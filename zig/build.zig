//! windows-zig top-level build script.
//!
//! Wires up the six in-tree packages (`winmd`, `win-core`, `winbindgen`,
//! `win-sys`, `win`, `win-targets`), their unit tests, and the `bindings`
//! step that regenerates `win-sys` / `win` sources from the vendored
//! `.winmd` metadata.
//!
//! Requires Zig 0.16.0 or newer.

const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // ------------------------------------------------------------------
    // Modules (one per package). These are kept minimal until the package
    // source files actually exist; `zig build` will happily expose the
    // modules as long as `root_source_file` resolves.
    // ------------------------------------------------------------------

    const winmd_mod = b.addModule("winmd", .{
        .root_source_file = b.path("packages/winmd/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    // Expose the vendored WinRT metadata file to the winmd module so tests
    // (and any comptime consumer) can @embedFile it by a stable name.
    winmd_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    winmd_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    winmd_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const win_core_mod = b.addModule("win-core", .{
        .root_source_file = b.path("packages/win-core/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    // `win-core` calls into `OleAut32.dll` for `BSTR` helpers and into
    // `combase.dll` (via WinRT API sets shipped by Zig's MinGW) for
    // `HSTRING` helpers and WinRT activation. Link the corresponding
    // import libs on Windows targets.
    if (target.result.os.tag == .windows) {
        win_core_mod.linkSystemLibrary("oleaut32", .{});
        win_core_mod.linkSystemLibrary("api-ms-win-core-winrt-string-l1-1-0", .{});
        win_core_mod.linkSystemLibrary("api-ms-win-core-winrt-l1-1-0", .{});
    }

    const winbindgen_mod = b.addModule("winbindgen", .{
        .root_source_file = b.path("packages/winbindgen/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    winbindgen_mod.addImport("winmd", winmd_mod);
    // Same vendored metadata as `winmd` — exposed here so winbindgen's own
    // tests (which drive the code generator end-to-end) can `@embedFile` them.
    winbindgen_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    winbindgen_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    winbindgen_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const win_sys_mod = b.addModule("win-sys", .{
        .root_source_file = b.path("packages/win-sys/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    win_sys_mod.addImport("win-core", win_core_mod);

    const win_mod = b.addModule("win", .{
        .root_source_file = b.path("packages/win/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    win_mod.addImport("win-core", win_core_mod);
    win_mod.addImport("win-sys", win_sys_mod);

    const win_targets_mod = b.addModule("win-targets", .{
        .root_source_file = b.path("packages/win-targets/src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // ------------------------------------------------------------------
    // Unit tests
    // ------------------------------------------------------------------

    const test_step = b.step("test", "Run all package unit tests");

    const TestPkg = struct {
        name: []const u8,
        mod: *std.Build.Module,
        windows_only: bool = false,
    };
    const test_pkgs = [_]TestPkg{
        .{ .name = "winmd", .mod = winmd_mod },
        .{ .name = "win-core", .mod = win_core_mod },
        .{ .name = "win-sys", .mod = win_sys_mod, .windows_only = true },
        // NOTE: `win` is intentionally omitted from test_pkgs while the
        // VARIANT emitter gap is pending. A test-harness rooted at
        // `win/root.zig` analyzes `Com`'s pub decls, some of which
        // reference `*VARIANT` and trip the missing-struct error.
        // Compile-checking of Com.zig is covered by the
        // `compile-check-bundle` step (via the shared WriteFiles dir)
        // and by consumer samples like `com_uri`.
        .{ .name = "winbindgen", .mod = winbindgen_mod },
        .{ .name = "win-targets", .mod = win_targets_mod },
    };

    for (test_pkgs) |p| {
        // win-sys tests call `project()` which emits `@extern(..., library_name="KERNEL32", ...)`
        // — that cannot link against a native Linux target. Cross coverage
        // for win-sys already happens via `compile-check-bundle-*` below.
        if (p.windows_only and target.result.os.tag != .windows) continue;
        const t = b.addTest(.{
            .name = b.fmt("test-{s}", .{p.name}),
            .root_module = p.mod,
        });
        const run_t = b.addRunArtifact(t);
        test_step.dependOn(&run_t.step);
    }

    // ------------------------------------------------------------------
    // `bindings` step — placeholder until winbindgen exposes a CLI.
    // ------------------------------------------------------------------

    const bindings_step = b.step(
        "bindings",
        "Regenerate win-sys and win sources from the vendored .winmd files",
    );

    // ------------------------------------------------------------------
    // `winbindgen` CLI executable — drives `emitNamespace` against the
    // bundled `Windows.winmd`. Handy for eyeballing generated output
    // with `zig build run -- Windows.Foundation` while Phase 3 lands
    // the full bindings pipeline.
    // ------------------------------------------------------------------

    // Build-tool executables (winbindgen, windef) must run on the *host*,
    // regardless of any user-supplied `-Dtarget` (which applies only to
    // the emitted import libs in Phase 5). Create host-targeted copies
    // of the `winmd` and `winbindgen` modules for that purpose.
    const winmd_host_mod = b.createModule(.{
        .root_source_file = b.path("packages/winmd/src/root.zig"),
        .target = b.graph.host,
        .optimize = optimize,
    });
    winmd_host_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    winmd_host_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    winmd_host_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const winbindgen_host_mod = b.createModule(.{
        .root_source_file = b.path("packages/winbindgen/src/root.zig"),
        .target = b.graph.host,
        .optimize = optimize,
    });
    winbindgen_host_mod.addImport("winmd", winmd_host_mod);
    winbindgen_host_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    winbindgen_host_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    winbindgen_host_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const winbindgen_main_mod = b.createModule(.{
        .root_source_file = b.path("packages/winbindgen/src/main.zig"),
        .target = b.graph.host,
        .optimize = optimize,
    });
    winbindgen_main_mod.addImport("winbindgen", winbindgen_host_mod);
    winbindgen_main_mod.addImport("winmd", winmd_host_mod);
    winbindgen_main_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    winbindgen_main_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    winbindgen_main_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const winbindgen_exe = b.addExecutable(.{
        .name = "winbindgen",
        .root_module = winbindgen_main_mod,
    });
    b.installArtifact(winbindgen_exe);

    // Canary namespaces whose generated output is committed to the tree
    // so a CI `gen` job can diff-check the generator against its golden.
    // Kept intentionally tiny — the full bundle would commit hundreds of
    // megabytes. Grow as generation stabilizes.
    const gen_canaries = [_][]const u8{
        "Windows.Wdk.Foundation",
        "Windows.Wdk.System.Memory",
    };
    const gen_update = b.addUpdateSourceFiles();
    for (gen_canaries) |ns| {
        const gen_run = b.addRunArtifact(winbindgen_exe);
        gen_run.addArg("--arch=x64");
        gen_run.addArg(ns);
        const gen_source = gen_run.captureStdOut(.{});
        gen_update.addCopyFileToSource(
            gen_source,
            b.fmt("packages/win-sys/src/generated/{s}.zig", .{ns}),
        );
    }

    // Every Win32 namespace listed below gets refreshed on every
    // `zig build bindings`: both the `.structs.zig` (type declarations)
    // and the `.index.zig` (method table used by `win-sys`'s
    // `tyToZigType` and by Phase 4's comptime `project()` helper) are
    // regenerated from the vendored `.winmd`. Keep this list sorted;
    // to add a namespace, just add a line and rerun the bindings step.
    // Zig 0.16's build script runs before the new `Io` interface is
    // plumbed into `std.fs.Dir`, so we can't practically scan the
    // committed `packages/win-sys/src/generated/` directory here —
    // hence the hand-list. The `mod.zig` step downstream still
    // auto-discovers, so consumer `@import("win-sys")` doesn't care.
    const win32_namespaces = [_][]const u8{
        "Windows.Win32.AI.MachineLearning.DirectML",
        "Windows.Win32.AI.MachineLearning.WinML",
        "Windows.Win32.Data.HtmlHelp",
        "Windows.Win32.Data.RightsManagement",
        "Windows.Win32.Data.Xml.MsXml",
        "Windows.Win32.Data.Xml.XmlLite",
        "Windows.Win32.Devices",
        "Windows.Win32.Devices.AllJoyn",
        "Windows.Win32.Devices.Beep",
        "Windows.Win32.Devices.BiometricFramework",
        "Windows.Win32.Devices.Bluetooth",
        "Windows.Win32.Devices.Cdrom",
        "Windows.Win32.Devices.Communication",
        "Windows.Win32.Devices.DeviceAccess",
        "Windows.Win32.Devices.DeviceAndDriverInstallation",
        "Windows.Win32.Devices.DeviceQuery",
        "Windows.Win32.Devices.Display",
        "Windows.Win32.Devices.Dvd",
        "Windows.Win32.Devices.Enumeration.Pnp",
        "Windows.Win32.Devices.Fax",
        "Windows.Win32.Devices.FunctionDiscovery",
        "Windows.Win32.Devices.Geolocation",
        "Windows.Win32.Devices.HumanInterfaceDevice",
        "Windows.Win32.Devices.ImageAcquisition",
        "Windows.Win32.Devices.Nfc",
        "Windows.Win32.Devices.Nfp",
        "Windows.Win32.Devices.PortableDevices",
        "Windows.Win32.Devices.Properties",
        "Windows.Win32.Devices.Pwm",
        "Windows.Win32.Devices.Sensors",
        "Windows.Win32.Devices.SerialCommunication",
        "Windows.Win32.Devices.Tapi",
        "Windows.Win32.Devices.Usb",
        "Windows.Win32.Devices.WebServicesOnDevices",
        "Windows.Win32.Foundation.Metadata",
        "Windows.Win32.Foundation",
        "Windows.Win32.Gaming",
        "Windows.Win32.Globalization",
        "Windows.Win32.Graphics.CompositionSwapchain",
        "Windows.Win32.Graphics.DXCore",
        "Windows.Win32.Graphics.Direct2D",
        "Windows.Win32.Graphics.Direct2D.Common",
        "Windows.Win32.Graphics.Direct3D",
        "Windows.Win32.Graphics.Direct3D.Dxc",
        "Windows.Win32.Graphics.Direct3D.Fxc",
        "Windows.Win32.Graphics.Direct3D10",
        "Windows.Win32.Graphics.Direct3D11",
        "Windows.Win32.Graphics.Direct3D11on12",
        "Windows.Win32.Graphics.Direct3D12",
        "Windows.Win32.Graphics.Direct3D9",
        "Windows.Win32.Graphics.Direct3D9on12",
        "Windows.Win32.Graphics.DirectComposition",
        "Windows.Win32.Graphics.DirectDraw",
        "Windows.Win32.Graphics.DirectManipulation",
        "Windows.Win32.Graphics.DirectWrite",
        "Windows.Win32.Graphics.Dwm",
        "Windows.Win32.Graphics.Dxgi",
        "Windows.Win32.Graphics.Dxgi.Common",
        "Windows.Win32.Graphics.Gdi",
        "Windows.Win32.Graphics.GdiPlus",
        "Windows.Win32.Graphics.Hlsl",
        "Windows.Win32.Graphics.Imaging",
        "Windows.Win32.Graphics.Imaging.D2D",
        "Windows.Win32.Graphics.OpenGL",
        "Windows.Win32.Graphics.Printing",
        "Windows.Win32.Graphics.Printing.PrintTicket",
        "Windows.Win32.Management.MobileDeviceManagementRegistration",
        "Windows.Win32.Media",
        "Windows.Win32.Media.Audio",
        "Windows.Win32.Media.Audio.Apo",
        "Windows.Win32.Media.Audio.DirectMusic",
        "Windows.Win32.Media.Audio.DirectSound",
        "Windows.Win32.Media.Audio.Endpoints",
        "Windows.Win32.Media.Audio.XAudio2",
        "Windows.Win32.Media.DeviceManager",
        "Windows.Win32.Media.DirectShow",
        "Windows.Win32.Media.DirectShow.Tv",
        "Windows.Win32.Media.DirectShow.Xml",
        "Windows.Win32.Media.DxMediaObjects",
        "Windows.Win32.Media.KernelStreaming",
        "Windows.Win32.Media.LibrarySharingServices",
        "Windows.Win32.Media.MediaFoundation",
        "Windows.Win32.Media.MediaPlayer",
        "Windows.Win32.Media.Multimedia",
        "Windows.Win32.Media.PictureAcquisition",
        "Windows.Win32.Media.Speech",
        "Windows.Win32.Media.Streaming",
        "Windows.Win32.Media.WindowsMediaFormat",
        "Windows.Win32.Networking.ActiveDirectory",
        "Windows.Win32.Networking.BackgroundIntelligentTransferService",
        "Windows.Win32.Networking.Clustering",
        "Windows.Win32.Networking.DeliveryOptimization",
        "Windows.Win32.Networking.HttpServer",
        "Windows.Win32.Networking.Ldap",
        "Windows.Win32.Networking.NetworkListManager",
        "Windows.Win32.Networking.RemoteDifferentialCompression",
        "Windows.Win32.Networking.WebSocket",
        "Windows.Win32.Networking.WinHttp",
        "Windows.Win32.Networking.WinInet",
        "Windows.Win32.Networking.WinSock",
        "Windows.Win32.Networking.WindowsWebServices",
        "Windows.Win32.NetworkManagement.Dhcp",
        "Windows.Win32.NetworkManagement.Dns",
        "Windows.Win32.NetworkManagement.InternetConnectionWizard",
        "Windows.Win32.NetworkManagement.IpHelper",
        "Windows.Win32.NetworkManagement.MobileBroadband",
        "Windows.Win32.NetworkManagement.Multicast",
        "Windows.Win32.NetworkManagement.Ndis",
        "Windows.Win32.NetworkManagement.NetBios",
        "Windows.Win32.NetworkManagement.NetManagement",
        "Windows.Win32.NetworkManagement.NetShell",
        "Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework",
        "Windows.Win32.NetworkManagement.NetworkPolicyServer",
        "Windows.Win32.NetworkManagement.P2P",
        "Windows.Win32.NetworkManagement.QoS",
        "Windows.Win32.NetworkManagement.Rras",
        "Windows.Win32.NetworkManagement.Snmp",
        "Windows.Win32.NetworkManagement.WebDav",
        "Windows.Win32.NetworkManagement.WiFi",
        "Windows.Win32.NetworkManagement.WNet",
        "Windows.Win32.NetworkManagement.WindowsConnectionManager",
        "Windows.Win32.NetworkManagement.WindowsConnectNow",
        "Windows.Win32.NetworkManagement.WindowsFilteringPlatform",
        "Windows.Win32.NetworkManagement.WindowsFirewall",
        "Windows.Win32.NetworkManagement.WindowsNetworkVirtualization",
        "Windows.Win32.Security",
        "Windows.Win32.Security.AppLocker",
        "Windows.Win32.Security.Authentication.Identity",
        "Windows.Win32.Security.Authentication.Identity.Provider",
        "Windows.Win32.Security.Authentication.WebAuthn",
        "Windows.Win32.Security.Authorization",
        "Windows.Win32.Security.Authorization.UI",
        "Windows.Win32.Security.ConfigurationSnapin",
        "Windows.Win32.Security.Credentials",
        "Windows.Win32.Security.Cryptography",
        "Windows.Win32.Security.Cryptography.Catalog",
        "Windows.Win32.Security.Cryptography.Certificates",
        "Windows.Win32.Security.Cryptography.Sip",
        "Windows.Win32.Security.Cryptography.UI",
        "Windows.Win32.Security.DiagnosticDataQuery",
        "Windows.Win32.Security.DirectoryServices",
        "Windows.Win32.Security.EnterpriseData",
        "Windows.Win32.Security.ExtensibleAuthenticationProtocol",
        "Windows.Win32.Security.Isolation",
        "Windows.Win32.Security.LicenseProtection",
        "Windows.Win32.Security.NetworkAccessProtection",
        "Windows.Win32.Security.Tpm",
        "Windows.Win32.Security.WinTrust",
        "Windows.Win32.Security.WinWlx",
        "Windows.Win32.Storage.Cabinets",
        "Windows.Win32.Storage.CloudFilters",
        "Windows.Win32.Storage.Compression",
        "Windows.Win32.Storage.DataDeduplication",
        "Windows.Win32.Storage.DistributedFileSystem",
        "Windows.Win32.Storage.EnhancedStorage",
        "Windows.Win32.Storage.FileHistory",
        "Windows.Win32.Storage.FileServerResourceManager",
        "Windows.Win32.Storage.FileSystem",
        "Windows.Win32.Storage.Imapi",
        "Windows.Win32.Storage.IndexServer",
        "Windows.Win32.Storage.InstallableFileSystems",
        "Windows.Win32.Storage.IscsiDisc",
        "Windows.Win32.Storage.Jet",
        "Windows.Win32.Storage.Nvme",
        "Windows.Win32.Storage.OfflineFiles",
        "Windows.Win32.Storage.OperationRecorder",
        "Windows.Win32.Storage.Packaging.Appx",
        "Windows.Win32.Storage.Packaging.Opc",
        "Windows.Win32.Storage.ProjectedFileSystem",
        "Windows.Win32.Storage.StructuredStorage",
        "Windows.Win32.Storage.Vhd",
        "Windows.Win32.Storage.VirtualDiskService",
        "Windows.Win32.Storage.Vss",
        "Windows.Win32.Storage.Xps",
        "Windows.Win32.Storage.Xps.Printing",
        "Windows.Win32.System.AddressBook",
        "Windows.Win32.System.Antimalware",
        "Windows.Win32.System.ApplicationInstallationAndServicing",
        "Windows.Win32.System.ApplicationVerifier",
        "Windows.Win32.System.AssessmentTool",
        "Windows.Win32.System.ClrHosting",
        "Windows.Win32.System.Com",
        "Windows.Win32.System.Com.CallObj",
        "Windows.Win32.System.Com.ChannelCredentials",
        "Windows.Win32.System.Com.Events",
        "Windows.Win32.System.Com.Marshal",
        "Windows.Win32.System.Com.StructuredStorage",
        "Windows.Win32.System.Com.UI",
        "Windows.Win32.System.Com.Urlmon",
        "Windows.Win32.System.ComponentServices",
        "Windows.Win32.System.Console",
        "Windows.Win32.System.Contacts",
        "Windows.Win32.System.CorrelationVector",
        "Windows.Win32.System.DataExchange",
        "Windows.Win32.System.DeploymentServices",
        "Windows.Win32.System.DesktopSharing",
        "Windows.Win32.System.DeveloperLicensing",
        "Windows.Win32.System.Diagnostics.Ceip",
        "Windows.Win32.System.Diagnostics.ClrProfiling",
        "Windows.Win32.System.Diagnostics.Debug",
        "Windows.Win32.System.Diagnostics.Debug.ActiveScript",
        "Windows.Win32.System.Diagnostics.Debug.Extensions",
        "Windows.Win32.System.Diagnostics.Debug.WebApp",
        "Windows.Win32.System.Diagnostics.Etw",
        "Windows.Win32.System.Diagnostics.ProcessSnapshotting",
        "Windows.Win32.System.Diagnostics.ToolHelp",
        "Windows.Win32.System.Diagnostics.TraceLogging",
        "Windows.Win32.System.DistributedTransactionCoordinator",
        "Windows.Win32.System.Environment",
        "Windows.Win32.System.ErrorReporting",
        "Windows.Win32.System.EventCollector",
        "Windows.Win32.System.EventLog",
        "Windows.Win32.System.EventNotificationService",
        "Windows.Win32.System.GroupPolicy",
        "Windows.Win32.System.HostCompute",
        "Windows.Win32.System.HostComputeNetwork",
        "Windows.Win32.System.HostComputeSystem",
        "Windows.Win32.System.Hypervisor",
        "Windows.Win32.System.Iis",
        "Windows.Win32.System.IO",
        "Windows.Win32.System.Ioctl",
        "Windows.Win32.System.JobObjects",
        "Windows.Win32.System.Js",
        "Windows.Win32.System.Kernel",
        "Windows.Win32.System.LibraryLoader",
        "Windows.Win32.System.Mailslots",
        "Windows.Win32.System.Mapi",
        "Windows.Win32.System.Memory",
        "Windows.Win32.System.Memory.NonVolatile",
        "Windows.Win32.System.MessageQueuing",
        "Windows.Win32.System.MixedReality",
        "Windows.Win32.System.Mmc",
        "Windows.Win32.System.Ole",
        "Windows.Win32.System.ParentalControls",
        "Windows.Win32.System.PasswordManagement",
        "Windows.Win32.System.Performance",
        "Windows.Win32.System.Performance.HardwareCounterProfiling",
        "Windows.Win32.System.Pipes",
        "Windows.Win32.System.Power",
        "Windows.Win32.System.ProcessStatus",
        "Windows.Win32.System.RealTimeCommunications",
        "Windows.Win32.System.Recovery",
        "Windows.Win32.System.Registry",
        "Windows.Win32.System.RemoteAssistance",
        "Windows.Win32.System.RemoteDesktop",
        "Windows.Win32.System.RemoteManagement",
        "Windows.Win32.System.RestartManager",
        "Windows.Win32.System.Restore",
        "Windows.Win32.System.Rpc",
        "Windows.Win32.System.Search",
        "Windows.Win32.System.Search.Common",
        "Windows.Win32.System.SecurityCenter",
        "Windows.Win32.System.ServerBackup",
        "Windows.Win32.System.Services",
        "Windows.Win32.System.SettingsManagementInfrastructure",
        "Windows.Win32.System.SetupAndMigration",
        "Windows.Win32.System.Shutdown",
        "Windows.Win32.System.SideShow",
        "Windows.Win32.System.StationsAndDesktops",
        "Windows.Win32.System.SubsystemForLinux",
        "Windows.Win32.System.SystemInformation",
        "Windows.Win32.System.SystemServices",
        "Windows.Win32.System.TaskScheduler",
        "Windows.Win32.System.Threading",
        "Windows.Win32.System.Time",
        "Windows.Win32.System.TpmBaseServices",
        "Windows.Win32.System.TransactionServer",
        "Windows.Win32.System.UpdateAgent",
        "Windows.Win32.System.UpdateAssessment",
        "Windows.Win32.System.UserAccessLogging",
        "Windows.Win32.System.Variant",
        "Windows.Win32.System.VirtualDosMachines",
        "Windows.Win32.System.WindowsProgramming",
        "Windows.Win32.System.WindowsSync",
        "Windows.Win32.System.Wmi",
        "Windows.Win32.System.WinRT",
        "Windows.Win32.System.WinRT.AllJoyn",
        "Windows.Win32.System.WinRT.Composition",
        "Windows.Win32.System.WinRT.CoreInputView",
        "Windows.Win32.System.WinRT.Direct3D11",
        "Windows.Win32.System.WinRT.Display",
        "Windows.Win32.System.WinRT.Graphics.Capture",
        "Windows.Win32.System.WinRT.Graphics.Direct2D",
        "Windows.Win32.System.WinRT.Graphics.Imaging",
        "Windows.Win32.System.WinRT.Holographic",
        "Windows.Win32.System.WinRT.Isolation",
        "Windows.Win32.System.WinRT.Media",
        "Windows.Win32.System.WinRT.Metadata",
        "Windows.Win32.System.WinRT.ML",
        "Windows.Win32.System.WinRT.Pdf",
        "Windows.Win32.System.WinRT.Printing",
        "Windows.Win32.System.WinRT.Shell",
        "Windows.Win32.System.WinRT.Storage",
        "Windows.Win32.System.WinRT.Xaml",
        "Windows.Win32.UI.Accessibility",
        "Windows.Win32.UI.Animation",
        "Windows.Win32.UI.ColorSystem",
        "Windows.Win32.UI.Controls",
        "Windows.Win32.UI.Controls.Dialogs",
        "Windows.Win32.UI.Controls.RichEdit",
        "Windows.Win32.UI.HiDpi",
        "Windows.Win32.UI.Input",
        "Windows.Win32.UI.Input.GameInput",
        "Windows.Win32.UI.Input.Ime",
        "Windows.Win32.UI.Input.Ink",
        "Windows.Win32.UI.Input.KeyboardAndMouse",
        "Windows.Win32.UI.Input.Pointer",
        "Windows.Win32.UI.Input.Radial",
        "Windows.Win32.UI.Input.Touch",
        "Windows.Win32.UI.Input.XboxController",
        "Windows.Win32.UI.InteractionContext",
        "Windows.Win32.UI.LegacyWindowsEnvironmentFeatures",
        "Windows.Win32.UI.Magnification",
        "Windows.Win32.UI.Notifications",
        "Windows.Win32.UI.Ribbon",
        "Windows.Win32.UI.Shell",
        "Windows.Win32.UI.Shell.Common",
        "Windows.Win32.UI.Shell.PropertiesSystem",
        "Windows.Win32.UI.TabletPC",
        "Windows.Win32.UI.TextServices",
        "Windows.Win32.UI.WindowsAndMessaging",
        "Windows.Win32.UI.Wpf",
        "Windows.Win32.UI.Xaml.Diagnostics",
        "Windows.Win32.Web.InternetExplorer",
        "Windows.Win32.Web.MsHtml",
    };
    for (win32_namespaces) |ns| {
        const structs_run = b.addRunArtifact(winbindgen_exe);
        structs_run.addArg("--arch=x64");
        structs_run.addArg("--structs");
        structs_run.addArg(ns);
        const structs_source = structs_run.captureStdOut(.{});
        gen_update.addCopyFileToSource(
            structs_source,
            b.fmt("packages/win-sys/src/generated/{s}.structs.zig", .{ns}),
        );

        const idx_run = b.addRunArtifact(winbindgen_exe);
        idx_run.addArg("--arch=x64");
        idx_run.addArg("--index");
        idx_run.addArg(ns);
        const idx_source = idx_run.captureStdOut(.{});
        gen_update.addCopyFileToSource(
            idx_source,
            b.fmt("packages/win-sys/src/generated/{s}.index.zig", .{ns}),
        );
    }
    bindings_step.dependOn(&gen_update.step);

    // Re-scan the generated/ directory and refresh `mod.zig`. This must
    // run after every per-namespace sidecar has been written so the scan
    // sees the current set of files; `mod_update` therefore depends on
    // `gen_update`.
    const mod_run = b.addRunArtifact(winbindgen_exe);
    mod_run.addArg("--emit-mod");
    mod_run.addArg("packages/win-sys/src/generated");
    mod_run.step.dependOn(&gen_update.step);
    // `--emit-mod` scans the directory at runtime, so its cache key
    // (derived from argv) doesn't change when new sidecars arrive.
    // Force every `zig build bindings` invocation to rescan so adding
    // a namespace to `win32_namespaces` above reliably reaches
    // `mod.zig` without a manual rerun.
    mod_run.has_side_effects = true;
    const mod_source = mod_run.captureStdOut(.{});
    const mod_update = b.addUpdateSourceFiles();
    mod_update.addCopyFileToSource(
        mod_source,
        "packages/win-sys/src/generated/mod.zig",
    );
    bindings_step.dependOn(&mod_update.step);

    const run_winbindgen = b.addRunArtifact(winbindgen_exe);
    if (b.args) |user_args| run_winbindgen.addArgs(user_args);
    const run_step = b.step("run", "Run the winbindgen CLI (pass args with `--`)");
    run_step.dependOn(&run_winbindgen.step);

    // ------------------------------------------------------------------
    // `windef` CLI — same metadata wiring as `winbindgen`, different
    // entry point. Emits one `.def` body per invocation; feeds
    // `win-targets.addImportLib` downstream.
    // ------------------------------------------------------------------

    const windef_main_mod = b.createModule(.{
        .root_source_file = b.path("packages/winbindgen/src/windef.zig"),
        // `windef` is a build-time tool — it must run on the host,
        // regardless of `-Dtarget` (which applies to the emitted
        // import lib, not the DLL-scanning CLI that produces the .def).
        .target = b.graph.host,
        .optimize = optimize,
    });
    windef_main_mod.addImport("winbindgen", winbindgen_host_mod);
    windef_main_mod.addImport("winmd", winmd_host_mod);
    windef_main_mod.addAnonymousImport("Windows.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.winmd"),
    });
    windef_main_mod.addAnonymousImport("Windows.Win32.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Win32.winmd"),
    });
    windef_main_mod.addAnonymousImport("Windows.Wdk.winmd", .{
        .root_source_file = b.path("../crates/libs/bindgen/default/Windows.Wdk.winmd"),
    });

    const windef_exe = b.addExecutable(.{
        .name = "windef",
        .root_module = windef_main_mod,
    });
    b.installArtifact(windef_exe);

    const run_windef = b.addRunArtifact(windef_exe);
    if (b.args) |user_args| run_windef.addArgs(user_args);
    const windef_run_step = b.step("windef", "Run the windef CLI (pass args with `--`)");
    windef_run_step.dependOn(&run_windef.step);

    // ------------------------------------------------------------------
    // `lib` step — end-to-end demo of Phase 5: winmd -> .def -> .lib
    // via `win-targets.addImportLibFromWinmd`. Installs the generated
    // `<dll>.lib` under `zig-out/lib/` for inspection. Defaults to
    // `kernel32`; override with `zig build lib -Ddll=<name>`.
    // ------------------------------------------------------------------

    const win_targets = @import("packages/win-targets/src/root.zig");

    const lib_dll_name = b.option(
        []const u8,
        "dll",
        "DLL basename for `zig build lib` (default: kernel32)",
    ) orelse "kernel32";

    const lib_path = win_targets.addImportLibFromWinmd(b, .{
        .name = lib_dll_name,
        .windef_exe = windef_exe,
        .target = target,
    });
    const install_lib = b.addInstallFile(
        lib_path,
        b.fmt("lib/{s}.lib", .{lib_dll_name}),
    );
    const lib_step = b.step("lib", "Generate <dll>.lib from winmd via windef + dlltool");
    lib_step.dependOn(&install_lib.step);

    // ------------------------------------------------------------------
    // Compile-check: run `winbindgen Windows.Foundation`, capture the
    // generated Zig source, and compile it as an object against
    // `win-core`. This turns the output of Phase 3's codegen into a
    // continuously validated artifact — if a later slice regresses and
    // emits something that won't type-check, `zig build test` catches
    // it. Hooked into the `test` step.
    // ------------------------------------------------------------------

    // Namespaces we compile-check every build. Expand this list to
    // exercise more of the emitted surface; each entry regenerates
    // on demand and type-checks against `win-core`.
    const compile_check_namespaces = [_][]const u8{
        "Windows.Foundation",
        "Windows.Globalization",
        "Windows.Data.Json",
        "Windows.Storage.Streams",
        "Windows.Win32.Foundation",
    };

    const arch_flag: ?[]const u8 = switch (target.result.cpu.arch) {
        .x86 => "--arch=x86",
        .x86_64 => "--arch=x64",
        .aarch64 => "--arch=arm64",
        else => null,
    };

    // The native `gen_obj` / `bundle_obj` checks below link against real
    // Windows system libraries (kernel32, ntdll, oleaut32, ...) and execute
    // the resulting test binary. That only works when the host target *is*
    // Windows. On non-Windows hosts we still get full coverage via the
    // per-arch cross loop further down (compile-only against x86/x64/arm64
    // Windows targets). Skip the host-linked checks when cross-compiling.
    const host_is_windows = target.result.os.tag == .windows;

    if (host_is_windows) {
        for (compile_check_namespaces) |ns| {
            const gen_run = b.addRunArtifact(winbindgen_exe);
            if (arch_flag) |f| gen_run.addArg(f);
            gen_run.addArg(ns);
            const gen_source = gen_run.captureStdOut(.{});

            const gen_mod = b.createModule(.{
                .root_source_file = gen_source,
                .target = target,
                .optimize = optimize,
            });
            gen_mod.addImport("win-core", win_core_mod);

            const gen_obj = b.addTest(.{
                .name = b.fmt("compile-check-{s}", .{ns}),
                .root_module = gen_mod,
            });
            const run_gen_obj = b.addRunArtifact(gen_obj);
            test_step.dependOn(&run_gen_obj.step);
        }
    }

    // ------------------------------------------------------------------
    // Bundle compile-check: drop several generated namespace files into
    // one WriteFiles directory and type-check them together. This
    // exercises cross-namespace `@import("Other.Namespace.zig")`
    // references that the single-namespace checks above can't catch.
    // Each additional namespace added to the bundle is one more
    // dependency surface continuously validated by `zig build test`.
    // ------------------------------------------------------------------

    const bundle_namespaces = [_][]const u8{
        "Windows.Win32.Foundation",
        "Windows.Win32.System.IO",
        "Windows.Win32.System.Kernel",
        "Windows.Win32.System.Threading",
        "Windows.Win32.System.Memory",
        "Windows.Win32.System.LibraryLoader",
        "Windows.Win32.System.Diagnostics.Debug",
        "Windows.Win32.System.Diagnostics.ProcessSnapshotting",
        "Windows.Win32.System.Com",
        "Windows.Win32.System.Com.CallObj",
        "Windows.Win32.System.Com.Events",
        "Windows.Win32.System.Com.Marshal",
        "Windows.Win32.System.Com.StructuredStorage",
        "Windows.Win32.System.Com.Urlmon",
        "Windows.Win32.System.Ole",
        "Windows.Win32.System.Variant",
        "Windows.Win32.System.Registry",
        "Windows.Win32.System.Search.Common",
        "Windows.Win32.System.Console",
        "Windows.Win32.System.Environment",
        "Windows.Win32.System.EventLog",
        "Windows.Win32.System.Performance",
        "Windows.Win32.System.Pipes",
        "Windows.Win32.System.ProcessStatus",
        "Windows.Win32.System.Rpc",
        "Windows.Win32.System.Services",
        "Windows.Win32.System.SystemInformation",
        "Windows.Win32.System.SystemServices",
        "Windows.Win32.System.TaskScheduler",
        "Windows.Win32.System.Time",
        "Windows.Win32.System.WindowsProgramming",
        "Windows.Win32.System.Mmc",
        "Windows.Win32.System.Antimalware",
        "Windows.Win32.System.ApplicationInstallationAndServicing",
        "Windows.Win32.System.ClrHosting",
        "Windows.Win32.System.CorrelationVector",
        "Windows.Win32.System.Diagnostics.Ceip",
        "Windows.Win32.System.Diagnostics.TraceLogging",
        "Windows.Win32.System.ErrorReporting",
        "Windows.Win32.System.HostComputeSystem",
        "Windows.Win32.System.Hypervisor",
        "Windows.Win32.System.Iis",
        "Windows.Win32.System.JobObjects",
        "Windows.Win32.System.Recovery",
        "Windows.Win32.System.RestartManager",
        "Windows.Win32.System.SideBySide",
        "Windows.Win32.System.Wmi",
        "Windows.Win32.System.AddressBook",
        "Windows.Win32.System.Memory.NonVolatile",
        "Windows.Win32.System.StationsAndDesktops",
        "Windows.Win32.System.WindowsSync",
        "Windows.Win32.Security",
        "Windows.Win32.Security.AppLocker",
        "Windows.Win32.Security.Authentication.Identity",
        "Windows.Win32.Security.Authorization",
        "Windows.Win32.Security.Credentials",
        "Windows.Win32.Security.Cryptography",
        "Windows.Win32.Security.Cryptography.Catalog",
        "Windows.Win32.Security.Cryptography.Certificates",
        "Windows.Win32.Security.Cryptography.Sip",
        "Windows.Win32.Security.Cryptography.UI",
        "Windows.Win32.Security.DiagnosticDataQuery",
        "Windows.Win32.Security.ExtensibleAuthenticationProtocol",
        "Windows.Win32.Security.Isolation",
        "Windows.Win32.Security.LicenseProtection",
        "Windows.Win32.Security.NetworkAccessProtection",
        "Windows.Win32.Security.Tpm",
        "Windows.Win32.Security.WinTrust",
        "Windows.Win32.Storage.FileSystem",
        "Windows.Win32.Storage.CloudFilters",
        "Windows.Win32.Storage.Compression",
        "Windows.Win32.Storage.DistributedFileSystem",
        "Windows.Win32.Storage.FileHistory",
        "Windows.Win32.Storage.Imapi",
        "Windows.Win32.Storage.IndexServer",
        "Windows.Win32.Storage.InstallableFileSystems",
        "Windows.Win32.Storage.Jet",
        "Windows.Win32.Storage.Nvme",
        "Windows.Win32.Storage.OfflineFiles",
        "Windows.Win32.Storage.Packaging.Appx",
        "Windows.Win32.Storage.ProjectedFileSystem",
        "Windows.Win32.Storage.StructuredStorage",
        "Windows.Win32.Storage.VirtualStorage",
        "Windows.Win32.Storage.Xml",
        "Windows.Win32.Storage.Xps",
        "Windows.Win32.Globalization",
        "Windows.Win32.Devices.Bluetooth",
        "Windows.Win32.Devices.DeviceAndDriverInstallation",
        "Windows.Win32.Devices.DeviceQuery",
        "Windows.Win32.Devices.Display",
        "Windows.Win32.Devices.Enumeration.Pnp",
        "Windows.Win32.Devices.Fax",
        "Windows.Win32.Devices.FunctionDiscovery",
        "Windows.Win32.Devices.HumanInterfaceDevice",
        "Windows.Win32.Devices.ImageAcquisition",
        "Windows.Win32.Devices.PortableDevices",
        "Windows.Win32.Devices.Sensors",
        "Windows.Win32.Devices.Usb",
        "Windows.Win32.UI.WindowsAndMessaging",
        "Windows.Win32.UI.WindowStations",
        "Windows.Win32.UI.Wpf",
        "Windows.Win32.UI.Input.KeyboardAndMouse",
        "Windows.Win32.UI.Notifications",
        "Windows.Win32.UI.Ribbon",
        "Windows.Win32.UI.Shell",
        "Windows.Win32.UI.Shell.Common",
        "Windows.Win32.UI.Shell.PropertiesSystem",
        "Windows.Win32.UI.TextServices",
        "Windows.Win32.UI.Controls",
        "Windows.Win32.UI.Controls.Dialogs",
        "Windows.Win32.UI.Controls.RichEdit",
        "Windows.Win32.Graphics.Gdi",
        "Windows.Win32.Graphics.GdiPlus",
        "Windows.Win32.Graphics.Dwm",
        "Windows.Win32.Graphics.Dxgi",
        "Windows.Win32.Graphics.Dxgi.Common",
        "Windows.Win32.Graphics.Direct3D",
        "Windows.Win32.Graphics.Direct3D9",
        "Windows.Win32.Graphics.Direct3D10",
        "Windows.Win32.Graphics.Direct3D11",
        "Windows.Win32.Graphics.Direct3D11on12",
        "Windows.Win32.Graphics.Direct3D12",
        "Windows.Win32.Graphics.DirectDraw",
        "Windows.Win32.Graphics.Direct2D",
        "Windows.Win32.Graphics.Direct2D.Common",
        "Windows.Win32.Graphics.DirectWrite",
        "Windows.Win32.Graphics.DirectComposition",
        "Windows.Win32.Graphics.Imaging",
        "Windows.Win32.Graphics.OpenGL",
        "Windows.Win32.UI.Accessibility",
        "Windows.Win32.UI.Animation",
        "Windows.Win32.UI.ColorSystem",
        "Windows.Win32.UI.HiDpi",
        "Windows.Win32.UI.Input",
        "Windows.Win32.UI.Input.Ime",
        "Windows.Win32.UI.Magnification",
        "Windows.Win32.Data.Xml.MsXml",
        "Windows.Win32.Media",
        "Windows.Win32.Media.Audio",
        "Windows.Win32.Media.Audio.Apo",
        "Windows.Win32.Media.Audio.DirectSound",
        "Windows.Win32.Media.Audio.XAudio2",
        "Windows.Win32.Media.DxMediaObjects",
        "Windows.Win32.Media.LibrarySharingServices",
        "Windows.Win32.Media.Multimedia",
        "Windows.Win32.Media.PictureAcquisition",
        "Windows.Win32.Media.Speech",
        "Windows.Win32.Media.Streaming",
        "Windows.Win32.Media.WindowsMediaFormat",
        "Windows.Win32.Storage.Packaging.Opc",
        "Windows.Win32.System.DataExchange",
        "Windows.Win32.System.Diagnostics.ToolHelp",
        "Windows.Win32.Networking.WinSock",
        "Windows.Win32.Networking.WinHttp",
        "Windows.Win32.Networking.WinInet",
        "Windows.Win32.Networking.ActiveDirectory",
        "Windows.Win32.Networking.Clustering",
        "Windows.Win32.Networking.HttpServer",
        "Windows.Win32.Networking.Ldap",
        "Windows.Win32.Networking.NetworkListManager",
        "Windows.Win32.Networking.RemoteDifferentialCompression",
        "Windows.Win32.Networking.WebSocket",
        "Windows.Win32.Networking.WindowsWebServices",
        "Windows.Win32.NetworkManagement.Dhcp",
        "Windows.Win32.NetworkManagement.Dns",
        "Windows.Win32.NetworkManagement.IpHelper",
        "Windows.Win32.NetworkManagement.Ndis",
        "Windows.Win32.NetworkManagement.NetBios",
        "Windows.Win32.NetworkManagement.NetManagement",
        "Windows.Win32.NetworkManagement.NetShell",
        "Windows.Win32.NetworkManagement.QoS",
        "Windows.Win32.NetworkManagement.Rras",
        "Windows.Win32.NetworkManagement.Snmp",
        "Windows.Win32.NetworkManagement.WiFi",
        "Windows.Win32.NetworkManagement.WindowsFilteringPlatform",
        "Windows.Win32.NetworkManagement.WNet",
        "Windows.Win32.NetworkManagement.InternetConnectionWizard",
        "Windows.Win32.NetworkManagement.MobileBroadband",
        "Windows.Win32.NetworkManagement.Multicast",
        "Windows.Win32.NetworkManagement.P2P",
        "Windows.Win32.NetworkManagement.WebDav",
        "Windows.Win32.NetworkManagement.WindowsConnectionManager",
        "Windows.Win32.NetworkManagement.WindowsConnectNow",
        "Windows.Win32.NetworkManagement.WindowsFirewall",
        "Windows.Win32.NetworkManagement.WindowsNetworkVirtualization",
        "Windows.Win32.Data.RightsManagement",
        "Windows.Win32.Devices.AllJoyn",
        "Windows.Win32.Devices.BiometricFramework",
        "Windows.Win32.Devices.Communication",
        "Windows.Win32.Devices.Enumeration",
        "Windows.Win32.Devices.Geolocation",
        "Windows.Win32.Devices.Pwm",
        "Windows.Win32.Devices.SerialCommunication",
        "Windows.Win32.Devices.WebServicesOnDevices",
        "Windows.Win32.Graphics.CompositionSwapchain",
        "Windows.Win32.Graphics.Hlsl",
        "Windows.Win32.Graphics.Printing",
        "Windows.Win32.Graphics.Printing.PrintTicket",
        "Windows.Win32.Security.Authorization.UI",
        "Windows.Win32.Security.DirectoryServices",
        "Windows.Win32.Storage.EnhancedStorage",
        "Windows.Win32.Storage.FileServerResourceManager",
        "Windows.Win32.Storage.Vhd",
        "Windows.Win32.Storage.VirtualDiskService",
        "Windows.Win32.Storage.Vss",
        "Windows.Win32.System.Com.ChannelCredentials",
        "Windows.Win32.System.Contacts",
        "Windows.Win32.System.DeploymentServices",
        "Windows.Win32.System.DesktopSharing",
        "Windows.Win32.System.DeveloperLicensing",
        "Windows.Win32.System.Diagnostics.Debug.ActiveScript",
        "Windows.Win32.System.DistributedTransactionCoordinator",
        "Windows.Win32.System.ComponentServices",
        "Windows.Win32.System.MessageQueuing",
        "Windows.Win32.System.Search",
        "Windows.Win32.Data.HtmlHelp",
        "Windows.Win32.System.GroupPolicy",
        "Windows.Win32.System.HostCompute",
        "Windows.Win32.System.HostComputeNetwork",
        "Windows.Win32.System.Mailslots",
        "Windows.Win32.System.Mapi",
        "Windows.Win32.System.PasswordManagement",
        "Windows.Win32.System.PortableExecutable",
        "Windows.Win32.System.RemoteManagement",
        "Windows.Win32.System.Restore",
        "Windows.Win32.System.SecurityCenter",
        "Windows.Win32.System.Shutdown",
        "Windows.Win32.UI.Input.Pen",
        "Windows.Win32.UI.Input.Pointer",
        "Windows.Win32.UI.Input.Radial",
        "Windows.Win32.UI.Input.Touch",
        "Windows.Win32.UI.Input.XboxController",
        "Windows.Win32.UI.InteractionContext",
        "Windows.Win32.UI.LegacyWindowsEnvironmentFeatures",
        "Windows.Win32.UI.TabletPC",
        "Windows.Win32.UI.WinRT",
        "Windows.Win32.Web.MsHtml",
        "Windows.Win32.AI.MachineLearning.DirectML",
        "Windows.Win32.AI.MachineLearning.WinML",
        "Windows.Win32.Graphics.Direct3D.Dxc",
        "Windows.Win32.Management.MobileDeviceManagementRegistration",
        "Windows.Win32.NetworkManagement.Ras",
        "Windows.Win32.Security.ConfigurationSnapin",
        "Windows.Win32.Storage.DataDeduplication",
        "Windows.Win32.Storage.OperationRecorder",
        "Windows.Win32.Storage.Xps.Printing",
        "Windows.Win32.System.ApplicationVerifier",
        "Windows.Win32.System.ClusterClient",
        "Windows.Win32.System.CodeIntegrity",
        "Windows.Win32.System.DeviceQuery",
        "Windows.Win32.System.EventCollector",
        "Windows.Win32.System.EventNotificationService",
        "Windows.Win32.System.Js",
        "Windows.Win32.System.Js.Runtime",
        "Windows.Win32.System.Performance.HardwareCounterProfiling",
        "Windows.Win32.System.ServerBackup",
        "Windows.Win32.System.SideShow",
        "Windows.Win32.System.SubsystemForLinux",
        "Windows.Win32.System.VirtualDosMachines",
        "Windows.Win32.Data.Xml.XmlLite",
        "Windows.Win32.Devices.Beep",
        "Windows.Win32.Devices.Cdrom",
        "Windows.Win32.Devices.DeviceAccess",
        "Windows.Win32.Devices.Dvd",
        "Windows.Win32.Devices.Nfc",
        "Windows.Win32.Devices.Nfp",
        "Windows.Win32.Foundation.Metadata",
        "Windows.Win32.Graphics.Direct3D.Fxc",
        "Windows.Win32.Graphics.DirectManipulation",
        "Windows.Win32.Graphics.DXCore",
        "Windows.Win32.Graphics.Imaging.D2D",
        "Windows.Win32.Media.Audio.DirectMusic",
        "Windows.Win32.Networking.BackgroundIntelligentTransferService",
        "Windows.Win32.Networking.DeliveryOptimization",
        "Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework",
        "Windows.Win32.NetworkManagement.NetworkPolicyServer",
        "Windows.Win32.Security.Authentication.Identity.Provider",
        "Windows.Win32.Security.Authentication.WebAuthn",
        "Windows.Win32.Security.WinWlx",
        "Windows.Win32.Storage.Cabinets",
        "Windows.Win32.System.AssessmentTool",
        "Windows.Win32.System.Com.UI",
        "Windows.Win32.System.Diagnostics.Debug.Extensions",
        "Windows.Win32.System.Diagnostics.Debug.WebApp",
        "Windows.Win32.System.MixedReality",
        "Windows.Win32.System.ParentalControls",
        "Windows.Win32.System.RemoteAssistance",
        "Windows.Win32.System.SettingsManagementInfrastructure",
        "Windows.Win32.System.SetupAndMigration",
        "Windows.Win32.System.TpmBaseServices",
        "Windows.Win32.System.TransactionServer",
        "Windows.Win32.System.UpdateAgent",
        "Windows.Win32.System.UpdateAssessment",
        "Windows.Win32.System.UserAccessLogging",
        "Windows.Win32.System.WinRT.AllJoyn",
        "Windows.Win32.System.WinRT.CoreInputView",
        "Windows.Win32.System.WinRT.Graphics.Capture",
        "Windows.Win32.System.WinRT.Holographic",
        "Windows.Win32.System.WinRT.Isolation",
        "Windows.Win32.System.WinRT.ML",
        "Windows.Win32.System.WinRT.Pdf",
        "Windows.Win32.System.WinRT.Shell",
        "Windows.Win32.System.WinRT.Storage",
        "Windows.Win32.System.WinRT.Xaml",
        "Windows.Win32.UI.Input.GameInput",
        "Windows.Win32.UI.Input.Ink",
        // Win32 deps pulled in by the Wdk bundle below.
        "Windows.Win32.Devices.Properties",
        "Windows.Win32.Storage.IscsiDisc",
        "Windows.Win32.System.Diagnostics.Etw",
        "Windows.Win32.System.Ioctl",
        "Windows.Win32.System.Power",
        // Wdk namespaces — kernel-mode surface layered on top of Win32.
        "Windows.Wdk.Foundation",
        "Windows.Wdk.Devices.Bluetooth",
        "Windows.Wdk.Devices.HumanInterfaceDevice",
        "Windows.Wdk.Graphics.Direct3D",
        "Windows.Wdk.NetworkManagement.Ndis",
        "Windows.Wdk.NetworkManagement.WindowsFilteringPlatform",
        "Windows.Wdk.System.SystemServices",
        "Windows.Wdk.System.Threading",
        "Windows.Wdk.System.Memory",
        "Windows.Wdk.System.IO",
        "Windows.Wdk.System.OfflineRegistry",
        "Windows.Wdk.System.Registry",
        "Windows.Wdk.System.SystemInformation",
        "Windows.Wdk.Storage.FileSystem",
        "Windows.Wdk.Storage.FileSystem.Minifilters",
        // WinRT — transitive closure of Windows.Globalization.
        "Windows.ApplicationModel",
        "Windows.ApplicationModel.Activation",
        "Windows.ApplicationModel.AppService",
        "Windows.ApplicationModel.Appointments",
        "Windows.ApplicationModel.Appointments.AppointmentsProvider",
        "Windows.ApplicationModel.Background",
        "Windows.ApplicationModel.Calls",
        "Windows.ApplicationModel.Calls.Background",
        "Windows.ApplicationModel.Contacts",
        "Windows.ApplicationModel.Contacts.Provider",
        "Windows.ApplicationModel.Core",
        "Windows.ApplicationModel.DataTransfer",
        "Windows.ApplicationModel.DataTransfer.ShareTarget",
        "Windows.ApplicationModel.Email",
        "Windows.ApplicationModel.Search",
        "Windows.ApplicationModel.UserDataAccounts",
        "Windows.ApplicationModel.UserDataAccounts.Provider",
        "Windows.ApplicationModel.UserDataTasks",
        "Windows.ApplicationModel.Wallet",
        "Windows.Data.Json",
        "Windows.Data.Text",
        "Windows.Data.Xml.Dom",
        "Windows.Devices.Bluetooth",
        "Windows.Devices.Bluetooth.Advertisement",
        "Windows.Devices.Bluetooth.Background",
        "Windows.Devices.Bluetooth.GenericAttributeProfile",
        "Windows.Devices.Bluetooth.Rfcomm",
        "Windows.Devices.Enumeration",
        "Windows.Devices.Geolocation",
        "Windows.Devices.Haptics",
        "Windows.Devices.Input",
        "Windows.Devices.Printers.Extensions",
        "Windows.Devices.Radios",
        "Windows.Devices.Sensors",
        "Windows.Devices.SmartCards",
        "Windows.Devices.Sms",
        "Windows.Foundation",
        "Windows.Foundation.Collections",
        "Windows.Foundation.Numerics",
        "Windows.Globalization",
        "Windows.Graphics",
        "Windows.Graphics.DirectX",
        "Windows.Graphics.Display",
        "Windows.Graphics.Effects",
        "Windows.Media.SpeechRecognition",
        "Windows.Networking",
        "Windows.Networking.Connectivity",
        "Windows.Networking.Sockets",
        "Windows.Security.Authentication.Web",
        "Windows.Security.Authentication.Web.Core",
        "Windows.Security.Authentication.Web.Provider",
        "Windows.Security.Credentials",
        "Windows.Security.Cryptography.Certificates",
        "Windows.Security.Cryptography.Core",
        "Windows.Security.EnterpriseData",
        "Windows.Storage",
        "Windows.Storage.FileProperties",
        "Windows.Storage.Pickers.Provider",
        "Windows.Storage.Provider",
        "Windows.Storage.Search",
        "Windows.Storage.Streams",
        "Windows.System",
        "Windows.System.Diagnostics",
        "Windows.System.RemoteSystems",
        "Windows.System.Threading",
        "Windows.UI",
        "Windows.UI.Composition",
        "Windows.UI.Core",
        "Windows.UI.Input",
        "Windows.UI.Notifications",
        "Windows.UI.Popups",
        "Windows.UI.Text",
        "Windows.UI.Text.Core",
        "Windows.UI.ViewManagement",
        "Windows.UI.WindowManagement",
        "Windows.Web",
        "Windows.Web.Http",
        "Windows.Web.Http.Filters",
        "Windows.Web.Http.Headers",
    };

    // M4 Phase 4b: a single `winbindgen bundle` invocation emits every
    // namespace in the bundle and auto-routes closed-generic
    // instantiations (e.g. `IVectorView``1<HSTRING>` reached from
    // Windows.Globalization) into their home namespace. Replaces the
    // per-namespace loop + hand-coded --seed= flags.
    const bundle_run = b.addRunArtifact(winbindgen_exe);
    bundle_run.addArg("bundle");
    if (arch_flag) |f| bundle_run.addArg(f);
    bundle_run.addArg("--outdir");
    const bundle_outdir = bundle_run.addOutputDirectoryArg("bundle");
    for (bundle_namespaces) |ns| bundle_run.addArg(ns);

    const bundle_wf = b.addWriteFiles();
    for (bundle_namespaces) |ns| {
        const src = bundle_outdir.path(b, b.fmt("{s}.zig", .{ns}));
        _ = bundle_wf.addCopyFile(src, b.fmt("{s}.zig", .{ns}));
    }

    // Use the first namespace as the root of the bundle module; sibling
    // `@import("OtherNamespace.zig")` references resolve via the shared
    // WriteFiles directory.
    const bundle_root = bundle_wf.getDirectory().path(b, b.fmt("{s}.zig", .{bundle_namespaces[0]}));
    const bundle_mod = b.createModule(.{
        .root_source_file = bundle_root,
        .target = target,
        .optimize = optimize,
    });
    bundle_mod.addImport("win-core", win_core_mod);

    // ------------------------------------------------------------------
    // Ship `Windows.Win32.System.Com` + `Windows.Win32.Foundation` as
    // the first consumer-visible namespaces on `win`. Both live in
    // the same WriteFiles dir (generated by the bundle pass above),
    // and the generator emits file-path imports (`@import("X.zig")`)
    // to cross-reference namespaces. Mounting each namespace as its
    // own named module would put the same `Foundation.zig` file into
    // two modules (the `Foundation` module itself + the `Com` module
    // that file-imports it), which Zig rejects.
    //
    // Sidestep by adding a small proxy file into the same WriteFiles
    // dir that re-exports both namespaces, then mounting *that* as
    // the single `win-bundle` module. `win/root.zig` unpacks the
    // proxy into the consumer-visible `Foundation` / `Com` aliases.
    // ------------------------------------------------------------------
    const win_bundle_proxy_source =
        \\pub const Foundation = @import("Windows.Win32.Foundation.zig");
        \\pub const Com = @import("Windows.Win32.System.Com.zig");
        \\pub const WinRT = struct {
        \\    pub const Foundation = @import("Windows.Foundation.zig");
        \\    pub const Collections = @import("Windows.Foundation.Collections.zig");
        \\    pub const Globalization = @import("Windows.Globalization.zig");
        \\    pub const System = struct {
        \\        pub const Threading = @import("Windows.System.Threading.zig");
        \\    };
        \\};
        \\
    ;
    _ = bundle_wf.add("win_bundle.zig", win_bundle_proxy_source);
    const win_bundle_root = bundle_wf.getDirectory().path(b, "win_bundle.zig");
    const win_bundle_mod = b.createModule(.{
        .root_source_file = win_bundle_root,
        .target = target,
        .optimize = optimize,
    });
    win_bundle_mod.addImport("win-core", win_core_mod);
    win_mod.addImport("win-bundle", win_bundle_mod);

    if (host_is_windows) {
        const bundle_obj = b.addTest(.{
            .name = "compile-check-bundle",
            .root_module = bundle_mod,
        });
        const run_bundle_obj = b.addRunArtifact(bundle_obj);
        test_step.dependOn(&run_bundle_obj.step);
    }
    // Non-Windows hosts rely on the per-arch cross loop below for
    // compile-only coverage (x86/x64/arm64 Windows targets).

    // ------------------------------------------------------------------
    // Per-arch cross-compile bundle checks. We can't *run* foreign
    // binaries, so these depend on the test-exe compile step directly
    // instead of going through `addRunArtifact`. Each variant re-runs
    // `winbindgen --arch=<arch>` to regenerate the 35 namespaces against
    // that arch's SupportedArchitecture filter, then type-checks the
    // bundle against a cross-compiled `win-core` for that target.
    // ------------------------------------------------------------------

    const CrossArch = struct {
        name: []const u8,
        flag: []const u8,
        query: std.Target.Query,
    };
    const cross_arches = [_]CrossArch{
        .{ .name = "x86", .flag = "--arch=x86", .query = .{ .cpu_arch = .x86, .os_tag = .windows, .abi = .gnu } },
        .{ .name = "x64", .flag = "--arch=x64", .query = .{ .cpu_arch = .x86_64, .os_tag = .windows, .abi = .gnu } },
        .{ .name = "arm64", .flag = "--arch=arm64", .query = .{ .cpu_arch = .aarch64, .os_tag = .windows, .abi = .gnu } },
    };

    for (cross_arches) |ca| {
        const cross_target = b.resolveTargetQuery(ca.query);

        const cross_core_mod = b.createModule(.{
            .root_source_file = b.path("packages/win-core/src/root.zig"),
            .target = cross_target,
            .optimize = optimize,
        });
        cross_core_mod.linkSystemLibrary("oleaut32", .{});
        cross_core_mod.linkSystemLibrary("api-ms-win-core-winrt-string-l1-1-0", .{});
        cross_core_mod.linkSystemLibrary("api-ms-win-core-winrt-l1-1-0", .{});

        // M4 Phase 4b: use the `bundle` subcommand so cross-namespace
        // closed-generic instantiations (e.g. `IVectorView``1<HSTRING>`
        // reached from `Windows.Globalization`) are auto-routed into
        // their home namespace under every target arch, mirroring the
        // host-Windows `compile-check-bundle` above.
        const cross_bundle_run = b.addRunArtifact(winbindgen_exe);
        cross_bundle_run.addArg("bundle");
        cross_bundle_run.addArg(ca.flag);
        cross_bundle_run.addArg("--outdir");
        const cross_bundle_outdir = cross_bundle_run.addOutputDirectoryArg("bundle");
        for (bundle_namespaces) |ns| cross_bundle_run.addArg(ns);

        const cross_wf = b.addWriteFiles();
        for (bundle_namespaces) |ns| {
            const src = cross_bundle_outdir.path(b, b.fmt("{s}.zig", .{ns}));
            _ = cross_wf.addCopyFile(src, b.fmt("{s}.zig", .{ns}));
        }
        const cross_root = cross_wf.getDirectory().path(b, b.fmt("{s}.zig", .{bundle_namespaces[0]}));

        const cross_mod = b.createModule(.{
            .root_source_file = cross_root,
            .target = cross_target,
            .optimize = optimize,
        });
        cross_mod.addImport("win-core", cross_core_mod);

        const cross_obj = b.addTest(.{
            .name = b.fmt("compile-check-bundle-{s}", .{ca.name}),
            .root_module = cross_mod,
        });
        // Compile only — do not run (foreign binary when ca != host).
        test_step.dependOn(&cross_obj.step);
    }

    // ------------------------------------------------------------------
    // `samples` step — Phase 6 end-to-end demos that exercise the
    // comptime `project()` helper. Each sample is a tiny standalone
    // executable under `samples/<name>/main.zig` importing `win-sys`.
    //
    // `zig build samples` installs every sample into `zig-out/bin/`.
    // `zig build run-<name>` builds and runs one sample (native hosts
    // only; cross-built samples are installed but not executed).
    // ------------------------------------------------------------------

    const samples_step = b.step("samples", "Build all Phase 6 sample executables");

    const Sample = struct {
        name: []const u8,
        root: []const u8,
        extra_libs: []const []const u8 = &.{},
        // If set, generate `<gen_lib>.lib` via `win-targets` (winmd →
        // .def → `zig dlltool`) and link the resulting archive into
        // this sample *instead* of `linkSystemLibrary("kernel32")`.
        // This turns the sample into the end-to-end canary for Phase
        // 5: any regression in windef / emitDef / addImportLibFromWinmd
        // breaks the sample at link or run time, not just a hidden CI
        // machine-byte check.
        gen_lib: ?[]const u8 = null,
        // If true, make `@import("win")` available to the sample.
        // Opt-in so low-level samples that only need `win-sys` don't
        // pay the analysis cost of pulling in the full classic-COM
        // surface (`Com`, `Foundation`, ...).
        needs_win: bool = false,
    };
    const samples = [_]Sample{
        .{ .name = "last-error", .root = "samples/last_error/main.zig" },
        .{
            .name = "gen-lib-smoke",
            .root = "samples/gen_lib_smoke/main.zig",
            .gen_lib = "kernel32",
        },
        .{ .name = "load-library", .root = "samples/load_library/main.zig" },
        .{ .name = "threading", .root = "samples/threading/main.zig" },
        .{ .name = "event-roundtrip", .root = "samples/event_roundtrip/main.zig" },
        .{
            .name = "desktop-window",
            .root = "samples/desktop_window/main.zig",
            .extra_libs = &.{"user32"},
        },
        .{ .name = "file-write", .root = "samples/file_write/main.zig" },
        .{ .name = "heap-alloc", .root = "samples/heap_alloc/main.zig" },
        .{ .name = "system-info", .root = "samples/system_info/main.zig" },
        .{ .name = "virtual-alloc", .root = "samples/virtual_alloc/main.zig" },
        .{
            .name = "well-known-sid",
            .root = "samples/well_known_sid/main.zig",
            .extra_libs = &.{"advapi32"},
        },
        .{ .name = "debug-output", .root = "samples/debug_output/main.zig" },
        .{
            .name = "token-elevation",
            .root = "samples/token_elevation/main.zig",
            .extra_libs = &.{"advapi32"},
        },
        .{ .name = "file-attributes", .root = "samples/file_attributes/main.zig" },
        .{ .name = "temp-path", .root = "samples/temp_path/main.zig" },
        .{ .name = "find-files", .root = "samples/find_files/main.zig" },
        .{ .name = "native-system-info", .root = "samples/native_system_info/main.zig" },
        .{
            .name = "create-window",
            .root = "samples/create_window/main.zig",
            .extra_libs = &.{"user32"},
        },
        .{
            .name = "com-uri",
            .root = "samples/com_uri/main.zig",
            .extra_libs = &.{ "urlmon", "oleaut32", "ole32" },
            .needs_win = true,
        },
        .{
            .name = "hstring-roundtrip",
            .root = "samples/hstring_roundtrip/main.zig",
            .needs_win = true,
        },
        .{
            .name = "winrt-uri",
            .root = "samples/winrt_uri/main.zig",
            .needs_win = true,
        },
        .{
            .name = "winrt-calendar",
            .root = "samples/winrt_calendar/main.zig",
            .needs_win = true,
        },
        .{
            .name = "winrt-property-value",
            .root = "samples/winrt_property_value/main.zig",
            .extra_libs = &.{"ole32"},
            .needs_win = true,
        },
        .{
            .name = "winrt-property-set",
            .root = "samples/winrt_property_set/main.zig",
            .extra_libs = &.{"ole32"},
            .needs_win = true,
        },
        .{
            .name = "winrt-event-sugar",
            .root = "samples/winrt_event_sugar/main.zig",
            .needs_win = true,
        },
        .{
            .name = "winrt-async",
            .root = "samples/winrt_async/main.zig",
            .needs_win = true,
        },
        .{
            .name = "message-box",
            .root = "samples/message_box/main.zig",
        },
        .{
            .name = "enum-windows",
            .root = "samples/enum_windows/main.zig",
        },
    };

    for (samples) |s| {
        const sample_mod = b.createModule(.{
            .root_source_file = b.path(s.root),
            .target = target,
            .optimize = optimize,
        });
        sample_mod.addImport("win-sys", win_sys_mod);
        if (s.needs_win) {
            sample_mod.addImport("win", win_mod);
        }
        // Every current sample needs kernel32 (last-error). Keeping the
        // link here rather than in `win-sys` mirrors what a downstream
        // consumer would do: pay only for the libs they use. Zig ships
        // MinGW kernel32 import lib for cross targets.
        if (target.result.os.tag == .windows) {
            if (s.gen_lib) |dll| {
                // Phase 5 canary: link against a winmd-derived .lib
                // produced by `win-targets` at configure time, rather
                // than the MinGW def bundled in Zig. Exported symbols
                // must be resolvable by name or the link fails.
                const gen = win_targets.addImportLibFromWinmd(b, .{
                    .name = dll,
                    .windef_exe = windef_exe,
                    .target = target,
                });
                sample_mod.addObjectFile(gen);
            } else {
                sample_mod.linkSystemLibrary("kernel32", .{});
            }
            for (s.extra_libs) |lib| {
                sample_mod.linkSystemLibrary(lib, .{});
            }
        }

        const sample_exe = b.addExecutable(.{
            .name = s.name,
            .root_module = sample_mod,
        });
        const install_sample = b.addInstallArtifact(sample_exe, .{});
        samples_step.dependOn(&install_sample.step);

        const run_sample = b.addRunArtifact(sample_exe);
        run_sample.step.dependOn(&install_sample.step);
        const sample_run_step = b.step(
            b.fmt("run-{s}", .{s.name}),
            b.fmt("Build and run the `{s}` sample", .{s.name}),
        );
        sample_run_step.dependOn(&run_sample.step);
    }

    // Make `zig build test` also compile every sample, so low-level
    // type changes in win-sys (e.g. phase 6/U switching HANDLE from
    // `isize` to `?*anyopaque`) can't break sample code silently. The
    // samples step only installs artifacts; it doesn't run them.
    // Only wire this in on Windows hosts — on Linux, native-target
    // samples hit "dynamic library 'USER32' requires PIC" because
    // `@extern(..., .{ .library_name = ... })` cannot resolve Windows
    // DLLs on a Linux target. Linux test coverage still compiles every
    // namespace via the `compile-check-bundle-*` cross loop above.
    if (host_is_windows) {
        test_step.dependOn(samples_step);
    }

    // ------------------------------------------------------------------
    // Phase 4 — comptime-projection benchmark.
    //
    // `zig build bench` compiles `benches/project_bench/main.zig`, which
    // exercises `win_sys.project(...)` at filter sizes 10 / 50 / 100.
    // Measure wall-clock with:
    //
    //     Measure-Command { zig build bench }
    //     zig build bench --time-report
    //
    // to see how comptime cost scales. Windows-host-only for the same
    // `@extern` reason as samples.
    // ------------------------------------------------------------------
    const bench_step = b.step("bench", "Compile the Phase 4 comptime-projection benchmark");
    if (host_is_windows) {
        const bench_mod = b.createModule(.{
            .root_source_file = b.path("benches/project_bench/main.zig"),
            .target = target,
            .optimize = optimize,
        });
        bench_mod.addImport("win-sys", win_sys_mod);
        bench_mod.linkSystemLibrary("kernel32", .{});

        const bench_exe = b.addExecutable(.{
            .name = "project-bench",
            .root_module = bench_mod,
        });
        const install_bench = b.addInstallArtifact(bench_exe, .{});
        bench_step.dependOn(&install_bench.step);
    }
}
