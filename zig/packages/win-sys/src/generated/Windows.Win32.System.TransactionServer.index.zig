const std = @import("std");

pub const MethodRecord = struct {
    library: []const u8,
    import: []const u8,
    signature: []const u8,
};

pub const TypeRefEntry = struct {
    namespace: []const u8,
    name: []const u8,
};

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const mtsInstallUsers = 1;
pub const mtsExportUsers = 1;
pub const mtsErrObjectErrors = -2146368511;
pub const mtsErrObjectInvalid = -2146368510;
pub const mtsErrKeyMissing = -2146368509;
pub const mtsErrAlreadyInstalled = -2146368508;
pub const mtsErrDownloadFailed = -2146368507;
pub const mtsErrPDFWriteFail = -2146368505;
pub const mtsErrPDFReadFail = -2146368504;
pub const mtsErrPDFVersion = -2146368503;
pub const mtsErrCoReqCompInstalled = -2146368496;
pub const mtsErrBadPath = -2146368502;
pub const mtsErrPackageExists = -2146368501;
pub const mtsErrRoleExists = -2146368500;
pub const mtsErrCantCopyFile = -2146368499;
pub const mtsErrNoTypeLib = -2146368498;
pub const mtsErrNoUser = -2146368497;
pub const mtsErrInvalidUserids = -2146368496;
pub const mtsErrNoRegistryCLSID = -2146368495;
pub const mtsErrBadRegistryProgID = -2146368494;
pub const mtsErrAuthenticationLevel = -2146368493;
pub const mtsErrUserPasswdNotValid = -2146368492;
pub const mtsErrNoRegistryRead = -2146368491;
pub const mtsErrNoRegistryWrite = -2146368490;
pub const mtsErrNoRegistryRepair = -2146368489;
pub const mtsErrCLSIDOrIIDMismatch = -2146368488;
pub const mtsErrRemoteInterface = -2146368487;
pub const mtsErrDllRegisterServer = -2146368486;
pub const mtsErrNoServerShare = -2146368485;
pub const mtsErrNoAccessToUNC = -2146368484;
pub const mtsErrDllLoadFailed = -2146368483;
pub const mtsErrBadRegistryLibID = -2146368482;
pub const mtsErrPackDirNotFound = -2146368481;
pub const mtsErrTreatAs = -2146368480;
pub const mtsErrBadForward = -2146368479;
pub const mtsErrBadIID = -2146368478;
pub const mtsErrRegistrarFailed = -2146368477;
pub const mtsErrCompFileDoesNotExist = -2146368476;
pub const mtsErrCompFileLoadDLLFail = -2146368475;
pub const mtsErrCompFileGetClassObj = -2146368474;
pub const mtsErrCompFileClassNotAvail = -2146368473;
pub const mtsErrCompFileBadTLB = -2146368472;
pub const mtsErrCompFileNotInstallable = -2146368471;
pub const mtsErrNotChangeable = -2146368470;
pub const mtsErrNotDeletable = -2146368469;
pub const mtsErrSession = -2146368468;
pub const mtsErrCompFileNoRegistrar = -2146368460;

pub const aliases = struct {
    pub const MTSPackageInstallOptions = i32;
    pub const MTSPackageExportOptions = i32;
    pub const MTSAdminErrorCodes = i32;
};
