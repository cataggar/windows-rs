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
    _ = win_targets_mod;

    // ------------------------------------------------------------------
    // Unit tests
    // ------------------------------------------------------------------

    const test_step = b.step("test", "Run all package unit tests");

    const TestPkg = struct {
        name: []const u8,
        mod: *std.Build.Module,
    };
    const test_pkgs = [_]TestPkg{
        .{ .name = "winmd", .mod = winmd_mod },
        .{ .name = "win-core", .mod = win_core_mod },
        .{ .name = "winbindgen", .mod = winbindgen_mod },
    };

    for (test_pkgs) |p| {
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
    _ = bindings_step; // will depend on winbindgen artifact once Phase 3 lands

    // ------------------------------------------------------------------
    // `winbindgen` CLI executable — drives `emitNamespace` against the
    // bundled `Windows.winmd`. Handy for eyeballing generated output
    // with `zig build run -- Windows.Foundation` while Phase 3 lands
    // the full bindings pipeline.
    // ------------------------------------------------------------------

    const winbindgen_main_mod = b.createModule(.{
        .root_source_file = b.path("packages/winbindgen/src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    winbindgen_main_mod.addImport("winbindgen", winbindgen_mod);
    winbindgen_main_mod.addImport("winmd", winmd_mod);
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

    const run_winbindgen = b.addRunArtifact(winbindgen_exe);
    if (b.args) |user_args| run_winbindgen.addArgs(user_args);
    const run_step = b.step("run", "Run the winbindgen CLI (pass args with `--`)");
    run_step.dependOn(&run_winbindgen.step);

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
        // Win32 deps pulled in by the Wdk bundle below.
        "Windows.Win32.Devices.Properties",
        "Windows.Win32.Storage.IscsiDisc",
        "Windows.Win32.System.Diagnostics.Etw",
        "Windows.Win32.System.Ioctl",
        "Windows.Win32.System.Power",
        // Wdk namespaces — kernel-mode surface layered on top of Win32.
        "Windows.Wdk.Foundation",
        "Windows.Wdk.System.SystemServices",
        "Windows.Wdk.System.Threading",
        "Windows.Wdk.System.Memory",
        "Windows.Wdk.System.IO",
        "Windows.Wdk.System.Registry",
        "Windows.Wdk.Storage.FileSystem",
    };

    const bundle_wf = b.addWriteFiles();
    for (bundle_namespaces) |ns| {
        const gen_run = b.addRunArtifact(winbindgen_exe);
        if (arch_flag) |f| gen_run.addArg(f);
        gen_run.addArg(ns);
        const gen_source = gen_run.captureStdOut(.{});
        _ = bundle_wf.addCopyFile(gen_source, b.fmt("{s}.zig", .{ns}));
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

    const bundle_obj = b.addTest(.{
        .name = "compile-check-bundle",
        .root_module = bundle_mod,
    });
    const run_bundle_obj = b.addRunArtifact(bundle_obj);
    test_step.dependOn(&run_bundle_obj.step);

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

        const cross_wf = b.addWriteFiles();
        for (bundle_namespaces) |ns| {
            const gen_run = b.addRunArtifact(winbindgen_exe);
            gen_run.addArg(ca.flag);
            gen_run.addArg(ns);
            const gen_source = gen_run.captureStdOut(.{});
            _ = cross_wf.addCopyFile(gen_source, b.fmt("{s}.zig", .{ns}));
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
}
