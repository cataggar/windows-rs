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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const IOCTL_DVD_BASE = 51;
pub const IOCTL_DVD_START_SESSION = 3362816;
pub const IOCTL_DVD_READ_KEY = 3362820;
pub const IOCTL_DVD_SEND_KEY = 3362824;
pub const IOCTL_DVD_END_SESSION = 3362828;
pub const IOCTL_DVD_SET_READ_AHEAD = 3362832;
pub const IOCTL_DVD_GET_REGION = 3362836;
pub const IOCTL_DVD_SEND_KEY2 = 3395608;
pub const IOCTL_AACS_READ_MEDIA_KEY_BLOCK_SIZE = 3363008;
pub const IOCTL_AACS_READ_MEDIA_KEY_BLOCK = 3363012;
pub const IOCTL_AACS_START_SESSION = 3363016;
pub const IOCTL_AACS_END_SESSION = 3363020;
pub const IOCTL_AACS_SEND_CERTIFICATE = 3363024;
pub const IOCTL_AACS_GET_CERTIFICATE = 3363028;
pub const IOCTL_AACS_GET_CHALLENGE_KEY = 3363032;
pub const IOCTL_AACS_SEND_CHALLENGE_KEY = 3363036;
pub const IOCTL_AACS_READ_VOLUME_ID = 3363040;
pub const IOCTL_AACS_READ_SERIAL_NUMBER = 3363044;
pub const IOCTL_AACS_READ_MEDIA_ID = 3363048;
pub const IOCTL_AACS_READ_BINDING_NONCE = 3363052;
pub const IOCTL_AACS_GENERATE_BINDING_NONCE = 3395824;
pub const IOCTL_DVD_READ_STRUCTURE = 3363136;
pub const IOCTL_STORAGE_SET_READ_AHEAD = 2966528;
pub const DVD_CGMS_RESERVED_MASK = 120;
pub const DVD_CGMS_COPY_PROTECT_MASK = 24;
pub const DVD_CGMS_COPY_PERMITTED = 0;
pub const DVD_CGMS_COPY_ONCE = 16;
pub const DVD_CGMS_NO_COPY = 24;
pub const DVD_COPYRIGHT_MASK = 64;
pub const DVD_NOT_COPYRIGHTED = 0;
pub const DVD_COPYRIGHTED = 64;
pub const DVD_SECTOR_PROTECT_MASK = 32;
pub const DVD_SECTOR_NOT_PROTECTED = 0;
pub const DVD_SECTOR_PROTECTED = 32;
pub const DvdChallengeKey = 1;
pub const DvdBusKey1 = 2;
pub const DvdBusKey2 = 3;
pub const DvdTitleKey = 4;
pub const DvdAsf = 5;
pub const DvdSetRpcKey = 6;
pub const DvdGetRpcKey = 8;
pub const DvdDiskKey = 128;
pub const DvdInvalidateAGID = 63;
pub const DvdPhysicalDescriptor = 0;
pub const DvdCopyrightDescriptor = 1;
pub const DvdDiskKeyDescriptor = 2;
pub const DvdBCADescriptor = 3;
pub const DvdManufacturerDescriptor = 4;
pub const DvdMaxDescriptor = 5;
pub const FormattingDiscControlBlock = 1178878720;
pub const WriteInhibitDiscControlBlock = 1464091392;
pub const SessionInfoDiscControlBlock = 1396982528;
pub const DiscControlBlockList = -1;

pub const aliases = struct {
    pub const DVD_KEY_TYPE = i32;
    pub const DVD_STRUCTURE_FORMAT = i32;
    pub const DISC_CONTROL_BLOCK_TYPE = i32;
};
