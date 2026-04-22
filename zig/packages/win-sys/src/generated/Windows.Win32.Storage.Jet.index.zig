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
    .{ "JetInit", MethodRecord{ .library = "ESENT", .import = "JetInit", .signature = "\x00\x01\x08\x0f\x11\xbe\x1d" } },
    .{ "JetInit2", MethodRecord{ .library = "ESENT", .import = "JetInit2", .signature = "\x00\x02\x08\x0f\x11\xbe\x1d\x09" } },
    .{ "JetInit3A", MethodRecord{ .library = "ESENT", .import = "JetInit3A", .signature = "\x00\x03\x08\x0f\x11\xbe\x1d\x0f\x11\xbe\x21\x09" } },
    .{ "JetInit3W", MethodRecord{ .library = "ESENT", .import = "JetInit3W", .signature = "\x00\x03\x08\x0f\x11\xbe\x1d\x0f\x11\xbe\x25\x09" } },
    .{ "JetCreateInstanceA", MethodRecord{ .library = "ESENT", .import = "JetCreateInstanceA", .signature = "\x00\x02\x08\x0f\x11\xbe\x1d\x0f\x04" } },
    .{ "JetCreateInstanceW", MethodRecord{ .library = "ESENT", .import = "JetCreateInstanceW", .signature = "\x00\x02\x08\x0f\x11\xbe\x1d\x0f\x07" } },
    .{ "JetCreateInstance2A", MethodRecord{ .library = "ESENT", .import = "JetCreateInstance2A", .signature = "\x00\x04\x08\x0f\x11\xbe\x1d\x0f\x04\x0f\x04\x09" } },
    .{ "JetCreateInstance2W", MethodRecord{ .library = "ESENT", .import = "JetCreateInstance2W", .signature = "\x00\x04\x08\x0f\x11\xbe\x1d\x0f\x07\x0f\x07\x09" } },
    .{ "JetGetInstanceMiscInfo", MethodRecord{ .library = "ESENT", .import = "JetGetInstanceMiscInfo", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x01\x09\x09" } },
    .{ "JetTerm", MethodRecord{ .library = "ESENT", .import = "JetTerm", .signature = "\x00\x01\x08\x11\xbe\x1d" } },
    .{ "JetTerm2", MethodRecord{ .library = "ESENT", .import = "JetTerm2", .signature = "\x00\x02\x08\x11\xbe\x1d\x09" } },
    .{ "JetStopService", MethodRecord{ .library = "ESENT", .import = "JetStopService", .signature = "\x00\x00\x08" } },
    .{ "JetStopServiceInstance", MethodRecord{ .library = "ESENT", .import = "JetStopServiceInstance", .signature = "\x00\x01\x08\x11\xbe\x1d" } },
    .{ "JetStopServiceInstance2", MethodRecord{ .library = "ESENT", .import = "JetStopServiceInstance2", .signature = "\x00\x02\x08\x11\xbe\x1d\x09" } },
    .{ "JetStopBackup", MethodRecord{ .library = "ESENT", .import = "JetStopBackup", .signature = "\x00\x00\x08" } },
    .{ "JetStopBackupInstance", MethodRecord{ .library = "ESENT", .import = "JetStopBackupInstance", .signature = "\x00\x01\x08\x11\xbe\x1d" } },
    .{ "JetSetSystemParameterA", MethodRecord{ .library = "ESENT", .import = "JetSetSystemParameterA", .signature = "\x00\x05\x08\x0f\x11\xbe\x1d\x11\xbe\x29\x09\x11\xbe\x2d\x0f\x04" } },
    .{ "JetSetSystemParameterW", MethodRecord{ .library = "ESENT", .import = "JetSetSystemParameterW", .signature = "\x00\x05\x08\x0f\x11\xbe\x1d\x11\xbe\x29\x09\x11\xbe\x2d\x0f\x07" } },
    .{ "JetGetSystemParameterA", MethodRecord{ .library = "ESENT", .import = "JetGetSystemParameterA", .signature = "\x00\x06\x08\x11\xbe\x1d\x11\xbe\x29\x09\x0f\x11\xbe\x2d\x0f\x04\x09" } },
    .{ "JetGetSystemParameterW", MethodRecord{ .library = "ESENT", .import = "JetGetSystemParameterW", .signature = "\x00\x06\x08\x11\xbe\x1d\x11\xbe\x29\x09\x0f\x11\xbe\x2d\x0f\x07\x09" } },
    .{ "JetEnableMultiInstanceA", MethodRecord{ .library = "ESENT", .import = "JetEnableMultiInstanceA", .signature = "\x00\x03\x08\x0f\x11\xbe\x31\x09\x0f\x09" } },
    .{ "JetEnableMultiInstanceW", MethodRecord{ .library = "ESENT", .import = "JetEnableMultiInstanceW", .signature = "\x00\x03\x08\x0f\x11\xbe\x35\x09\x0f\x09" } },
    .{ "JetGetThreadStats", MethodRecord{ .library = "ESENT", .import = "JetGetThreadStats", .signature = "\x00\x02\x08\x0f\x01\x09" } },
    .{ "JetBeginSessionA", MethodRecord{ .library = "ESENT", .import = "JetBeginSessionA", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x11\xbe\x29\x0f\x04\x0f\x04" } },
    .{ "JetBeginSessionW", MethodRecord{ .library = "ESENT", .import = "JetBeginSessionW", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x11\xbe\x29\x0f\x07\x0f\x07" } },
    .{ "JetDupSession", MethodRecord{ .library = "ESENT", .import = "JetDupSession", .signature = "\x00\x02\x08\x11\xbe\x29\x0f\x11\xbe\x29" } },
    .{ "JetEndSession", MethodRecord{ .library = "ESENT", .import = "JetEndSession", .signature = "\x00\x02\x08\x11\xbe\x29\x09" } },
    .{ "JetGetVersion", MethodRecord{ .library = "ESENT", .import = "JetGetVersion", .signature = "\x00\x02\x08\x11\xbe\x29\x0f\x09" } },
    .{ "JetIdle", MethodRecord{ .library = "ESENT", .import = "JetIdle", .signature = "\x00\x02\x08\x11\xbe\x29\x09" } },
    .{ "JetCreateDatabaseA", MethodRecord{ .library = "ESENT", .import = "JetCreateDatabaseA", .signature = "\x00\x05\x08\x11\xbe\x29\x0f\x04\x0f\x04\x0f\x09\x09" } },
    .{ "JetCreateDatabaseW", MethodRecord{ .library = "ESENT", .import = "JetCreateDatabaseW", .signature = "\x00\x05\x08\x11\xbe\x29\x0f\x07\x0f\x07\x0f\x09\x09" } },
    .{ "JetCreateDatabase2A", MethodRecord{ .library = "ESENT", .import = "JetCreateDatabase2A", .signature = "\x00\x05\x08\x11\xbe\x29\x0f\x04\x09\x0f\x09\x09" } },
    .{ "JetCreateDatabase2W", MethodRecord{ .library = "ESENT", .import = "JetCreateDatabase2W", .signature = "\x00\x05\x08\x11\xbe\x29\x0f\x07\x09\x0f\x09\x09" } },
    .{ "JetAttachDatabaseA", MethodRecord{ .library = "ESENT", .import = "JetAttachDatabaseA", .signature = "\x00\x03\x08\x11\xbe\x29\x0f\x04\x09" } },
    .{ "JetAttachDatabaseW", MethodRecord{ .library = "ESENT", .import = "JetAttachDatabaseW", .signature = "\x00\x03\x08\x11\xbe\x29\x0f\x07\x09" } },
    .{ "JetAttachDatabase2A", MethodRecord{ .library = "ESENT", .import = "JetAttachDatabase2A", .signature = "\x00\x04\x08\x11\xbe\x29\x0f\x04\x09\x09" } },
    .{ "JetAttachDatabase2W", MethodRecord{ .library = "ESENT", .import = "JetAttachDatabase2W", .signature = "\x00\x04\x08\x11\xbe\x29\x0f\x07\x09\x09" } },
    .{ "JetDetachDatabaseA", MethodRecord{ .library = "ESENT", .import = "JetDetachDatabaseA", .signature = "\x00\x02\x08\x11\xbe\x29\x0f\x04" } },
    .{ "JetDetachDatabaseW", MethodRecord{ .library = "ESENT", .import = "JetDetachDatabaseW", .signature = "\x00\x02\x08\x11\xbe\x29\x0f\x07" } },
    .{ "JetDetachDatabase2A", MethodRecord{ .library = "ESENT", .import = "JetDetachDatabase2A", .signature = "\x00\x03\x08\x11\xbe\x29\x0f\x04\x09" } },
    .{ "JetDetachDatabase2W", MethodRecord{ .library = "ESENT", .import = "JetDetachDatabase2W", .signature = "\x00\x03\x08\x11\xbe\x29\x0f\x07\x09" } },
    .{ "JetGetObjectInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetObjectInfoA", .signature = "\x00\x08\x08\x11\xbe\x29\x09\x09\x0f\x04\x0f\x04\x0f\x01\x09\x09" } },
    .{ "JetGetObjectInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetObjectInfoW", .signature = "\x00\x08\x08\x11\xbe\x29\x09\x09\x0f\x07\x0f\x07\x0f\x01\x09\x09" } },
    .{ "JetGetTableInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetTableInfoA", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x09" } },
    .{ "JetGetTableInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetTableInfoW", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x09" } },
    .{ "JetCreateTableA", MethodRecord{ .library = "ESENT", .import = "JetCreateTableA", .signature = "\x00\x06\x08\x11\xbe\x29\x09\x0f\x04\x09\x09\x0f\x11\xbe\x39" } },
    .{ "JetCreateTableW", MethodRecord{ .library = "ESENT", .import = "JetCreateTableW", .signature = "\x00\x06\x08\x11\xbe\x29\x09\x0f\x07\x09\x09\x0f\x11\xbe\x39" } },
    .{ "JetCreateTableColumnIndexA", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndexA", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x3d" } },
    .{ "JetCreateTableColumnIndexW", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndexW", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x41" } },
    .{ "JetCreateTableColumnIndex2A", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndex2A", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x45" } },
    .{ "JetCreateTableColumnIndex2W", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndex2W", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x49" } },
    .{ "JetCreateTableColumnIndex3A", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndex3A", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x4d" } },
    .{ "JetCreateTableColumnIndex3W", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndex3W", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x51" } },
    .{ "JetCreateTableColumnIndex4A", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndex4A", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x55" } },
    .{ "JetCreateTableColumnIndex4W", MethodRecord{ .library = "ESENT", .import = "JetCreateTableColumnIndex4W", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x11\xbe\x59" } },
    .{ "JetDeleteTableA", MethodRecord{ .library = "ESENT", .import = "JetDeleteTableA", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x04" } },
    .{ "JetDeleteTableW", MethodRecord{ .library = "ESENT", .import = "JetDeleteTableW", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x0f\x07" } },
    .{ "JetRenameTableA", MethodRecord{ .library = "ESENT", .import = "JetRenameTableA", .signature = "\x00\x04\x08\x11\xbe\x29\x09\x0f\x04\x0f\x04" } },
    .{ "JetRenameTableW", MethodRecord{ .library = "ESENT", .import = "JetRenameTableW", .signature = "\x00\x04\x08\x11\xbe\x29\x09\x0f\x07\x0f\x07" } },
    .{ "JetGetTableColumnInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetTableColumnInfoA", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x0f\x01\x09\x09" } },
    .{ "JetGetTableColumnInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetTableColumnInfoW", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x0f\x01\x09\x09" } },
    .{ "JetGetColumnInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetColumnInfoA", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x04\x0f\x04\x0f\x01\x09\x09" } },
    .{ "JetGetColumnInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetColumnInfoW", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x07\x0f\x07\x0f\x01\x09\x09" } },
    .{ "JetAddColumnA", MethodRecord{ .library = "ESENT", .import = "JetAddColumnA", .signature = "\x00\x07\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x0f\x11\xbe\x5d\x0f\x01\x09\x0f\x09" } },
    .{ "JetAddColumnW", MethodRecord{ .library = "ESENT", .import = "JetAddColumnW", .signature = "\x00\x07\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x0f\x11\xbe\x5d\x0f\x01\x09\x0f\x09" } },
    .{ "JetDeleteColumnA", MethodRecord{ .library = "ESENT", .import = "JetDeleteColumnA", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04" } },
    .{ "JetDeleteColumnW", MethodRecord{ .library = "ESENT", .import = "JetDeleteColumnW", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07" } },
    .{ "JetDeleteColumn2A", MethodRecord{ .library = "ESENT", .import = "JetDeleteColumn2A", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x09" } },
    .{ "JetDeleteColumn2W", MethodRecord{ .library = "ESENT", .import = "JetDeleteColumn2W", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x09" } },
    .{ "JetRenameColumnA", MethodRecord{ .library = "ESENT", .import = "JetRenameColumnA", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x0f\x04\x09" } },
    .{ "JetRenameColumnW", MethodRecord{ .library = "ESENT", .import = "JetRenameColumnW", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x0f\x07\x09" } },
    .{ "JetSetColumnDefaultValueA", MethodRecord{ .library = "ESENT", .import = "JetSetColumnDefaultValueA", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x04\x0f\x04\x0f\x01\x09\x09" } },
    .{ "JetSetColumnDefaultValueW", MethodRecord{ .library = "ESENT", .import = "JetSetColumnDefaultValueW", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x07\x0f\x07\x0f\x01\x09\x09" } },
    .{ "JetGetTableIndexInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetTableIndexInfoA", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x0f\x01\x09\x09" } },
    .{ "JetGetTableIndexInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetTableIndexInfoW", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x0f\x01\x09\x09" } },
    .{ "JetGetIndexInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetIndexInfoA", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x04\x0f\x04\x0f\x01\x09\x09" } },
    .{ "JetGetIndexInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetIndexInfoW", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x07\x0f\x07\x0f\x01\x09\x09" } },
    .{ "JetCreateIndexA", MethodRecord{ .library = "ESENT", .import = "JetCreateIndexA", .signature = "\x00\x07\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x09\x0f\x04\x09\x09" } },
    .{ "JetCreateIndexW", MethodRecord{ .library = "ESENT", .import = "JetCreateIndexW", .signature = "\x00\x07\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x09\x0f\x07\x09\x09" } },
    .{ "JetCreateIndex2A", MethodRecord{ .library = "ESENT", .import = "JetCreateIndex2A", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x61\x09" } },
    .{ "JetCreateIndex2W", MethodRecord{ .library = "ESENT", .import = "JetCreateIndex2W", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x65\x09" } },
    .{ "JetCreateIndex3A", MethodRecord{ .library = "ESENT", .import = "JetCreateIndex3A", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x69\x09" } },
    .{ "JetCreateIndex3W", MethodRecord{ .library = "ESENT", .import = "JetCreateIndex3W", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x6d\x09" } },
    .{ "JetCreateIndex4A", MethodRecord{ .library = "ESENT", .import = "JetCreateIndex4A", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x71\x09" } },
    .{ "JetCreateIndex4W", MethodRecord{ .library = "ESENT", .import = "JetCreateIndex4W", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x75\x09" } },
    .{ "JetDeleteIndexA", MethodRecord{ .library = "ESENT", .import = "JetDeleteIndexA", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04" } },
    .{ "JetDeleteIndexW", MethodRecord{ .library = "ESENT", .import = "JetDeleteIndexW", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07" } },
    .{ "JetBeginTransaction", MethodRecord{ .library = "ESENT", .import = "JetBeginTransaction", .signature = "\x00\x01\x08\x11\xbe\x29" } },
    .{ "JetBeginTransaction2", MethodRecord{ .library = "ESENT", .import = "JetBeginTransaction2", .signature = "\x00\x02\x08\x11\xbe\x29\x09" } },
    .{ "JetBeginTransaction3", MethodRecord{ .library = "ESENT", .import = "JetBeginTransaction3", .signature = "\x00\x03\x08\x11\xbe\x29\x0a\x09" } },
    .{ "JetCommitTransaction", MethodRecord{ .library = "ESENT", .import = "JetCommitTransaction", .signature = "\x00\x02\x08\x11\xbe\x29\x09" } },
    .{ "JetCommitTransaction2", MethodRecord{ .library = "ESENT", .import = "JetCommitTransaction2", .signature = "\x00\x04\x08\x11\xbe\x29\x09\x09\x0f\x11\xbe\x79" } },
    .{ "JetRollback", MethodRecord{ .library = "ESENT", .import = "JetRollback", .signature = "\x00\x02\x08\x11\xbe\x29\x09" } },
    .{ "JetGetDatabaseInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetDatabaseInfoA", .signature = "\x00\x05\x08\x11\xbe\x29\x09\x0f\x01\x09\x09" } },
    .{ "JetGetDatabaseInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetDatabaseInfoW", .signature = "\x00\x05\x08\x11\xbe\x29\x09\x0f\x01\x09\x09" } },
    .{ "JetGetDatabaseFileInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetDatabaseFileInfoA", .signature = "\x00\x04\x08\x0f\x04\x0f\x01\x09\x09" } },
    .{ "JetGetDatabaseFileInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetDatabaseFileInfoW", .signature = "\x00\x04\x08\x0f\x07\x0f\x01\x09\x09" } },
    .{ "JetOpenDatabaseA", MethodRecord{ .library = "ESENT", .import = "JetOpenDatabaseA", .signature = "\x00\x05\x08\x11\xbe\x29\x0f\x04\x0f\x04\x0f\x09\x09" } },
    .{ "JetOpenDatabaseW", MethodRecord{ .library = "ESENT", .import = "JetOpenDatabaseW", .signature = "\x00\x05\x08\x11\xbe\x29\x0f\x07\x0f\x07\x0f\x09\x09" } },
    .{ "JetCloseDatabase", MethodRecord{ .library = "ESENT", .import = "JetCloseDatabase", .signature = "\x00\x03\x08\x11\xbe\x29\x09\x09" } },
    .{ "JetOpenTableA", MethodRecord{ .library = "ESENT", .import = "JetOpenTableA", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x04\x0f\x01\x09\x09\x0f\x11\xbe\x39" } },
    .{ "JetOpenTableW", MethodRecord{ .library = "ESENT", .import = "JetOpenTableW", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x07\x0f\x01\x09\x09\x0f\x11\xbe\x39" } },
    .{ "JetSetTableSequential", MethodRecord{ .library = "ESENT", .import = "JetSetTableSequential", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x09" } },
    .{ "JetResetTableSequential", MethodRecord{ .library = "ESENT", .import = "JetResetTableSequential", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x09" } },
    .{ "JetCloseTable", MethodRecord{ .library = "ESENT", .import = "JetCloseTable", .signature = "\x00\x02\x08\x11\xbe\x29\x11\xbe\x39" } },
    .{ "JetDelete", MethodRecord{ .library = "ESENT", .import = "JetDelete", .signature = "\x00\x02\x08\x11\xbe\x29\x11\xbe\x39" } },
    .{ "JetUpdate", MethodRecord{ .library = "ESENT", .import = "JetUpdate", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x0f\x09" } },
    .{ "JetUpdate2", MethodRecord{ .library = "ESENT", .import = "JetUpdate2", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x0f\x09\x09" } },
    .{ "JetEscrowUpdate", MethodRecord{ .library = "ESENT", .import = "JetEscrowUpdate", .signature = "\x00\x09\x08\x11\xbe\x29\x11\xbe\x39\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x09" } },
    .{ "JetRetrieveColumn", MethodRecord{ .library = "ESENT", .import = "JetRetrieveColumn", .signature = "\x00\x08\x08\x11\xbe\x29\x11\xbe\x39\x09\x0f\x01\x09\x0f\x09\x09\x0f\x11\xbe\x7d" } },
    .{ "JetRetrieveColumns", MethodRecord{ .library = "ESENT", .import = "JetRetrieveColumns", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x81\x09" } },
    .{ "JetEnumerateColumns", MethodRecord{ .library = "ESENT", .import = "JetEnumerateColumns", .signature = "\x00\x0a\x08\x11\xbe\x29\x11\xbe\x39\x09\x0f\x11\xbe\x85\x0f\x09\x0f\x0f\x11\xbe\x89\x12\xbe\x8d\x0f\x01\x09\x09" } },
    .{ "JetGetRecordSize", MethodRecord{ .library = "ESENT", .import = "JetGetRecordSize", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x91\x09" } },
    .{ "JetGetRecordSize2", MethodRecord{ .library = "ESENT", .import = "JetGetRecordSize2", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x95\x09" } },
    .{ "JetSetColumn", MethodRecord{ .library = "ESENT", .import = "JetSetColumn", .signature = "\x00\x07\x08\x11\xbe\x29\x11\xbe\x39\x09\x0f\x01\x09\x09\x0f\x11\xbe\x99" } },
    .{ "JetSetColumns", MethodRecord{ .library = "ESENT", .import = "JetSetColumns", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x9d\x09" } },
    .{ "JetPrepareUpdate", MethodRecord{ .library = "ESENT", .import = "JetPrepareUpdate", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x09" } },
    .{ "JetGetRecordPosition", MethodRecord{ .library = "ESENT", .import = "JetGetRecordPosition", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\xa1\x09" } },
    .{ "JetGotoPosition", MethodRecord{ .library = "ESENT", .import = "JetGotoPosition", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\xa1" } },
    .{ "JetGetCursorInfo", MethodRecord{ .library = "ESENT", .import = "JetGetCursorInfo", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x09" } },
    .{ "JetDupCursor", MethodRecord{ .library = "ESENT", .import = "JetDupCursor", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\x39\x09" } },
    .{ "JetGetCurrentIndexA", MethodRecord{ .library = "ESENT", .import = "JetGetCurrentIndexA", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x09" } },
    .{ "JetGetCurrentIndexW", MethodRecord{ .library = "ESENT", .import = "JetGetCurrentIndexW", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x09" } },
    .{ "JetSetCurrentIndexA", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndexA", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04" } },
    .{ "JetSetCurrentIndexW", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndexW", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07" } },
    .{ "JetSetCurrentIndex2A", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndex2A", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x09" } },
    .{ "JetSetCurrentIndex2W", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndex2W", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x09" } },
    .{ "JetSetCurrentIndex3A", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndex3A", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x09\x09" } },
    .{ "JetSetCurrentIndex3W", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndex3W", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x09\x09" } },
    .{ "JetSetCurrentIndex4A", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndex4A", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x04\x0f\x11\xbe\xa5\x09\x09" } },
    .{ "JetSetCurrentIndex4W", MethodRecord{ .library = "ESENT", .import = "JetSetCurrentIndex4W", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x07\x0f\x11\xbe\xa5\x09\x09" } },
    .{ "JetMove", MethodRecord{ .library = "ESENT", .import = "JetMove", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x08\x09" } },
    .{ "JetSetCursorFilter", MethodRecord{ .library = "ESENT", .import = "JetSetCursorFilter", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\xa9\x09\x09" } },
    .{ "JetGetLock", MethodRecord{ .library = "ESENT", .import = "JetGetLock", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x09" } },
    .{ "JetMakeKey", MethodRecord{ .library = "ESENT", .import = "JetMakeKey", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x09" } },
    .{ "JetSeek", MethodRecord{ .library = "ESENT", .import = "JetSeek", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x09" } },
    .{ "JetPrereadKeys", MethodRecord{ .library = "ESENT", .import = "JetPrereadKeys", .signature = "\x00\x07\x08\x11\xbe\x29\x11\xbe\x39\x0f\x0f\x01\x0f\x09\x08\x0f\x08\x09" } },
    .{ "JetPrereadIndexRanges", MethodRecord{ .library = "ESENT", .import = "JetPrereadIndexRanges", .signature = "\x00\x08\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\xad\x09\x0f\x09\x0f\x09\x09\x09" } },
    .{ "JetGetBookmark", MethodRecord{ .library = "ESENT", .import = "JetGetBookmark", .signature = "\x00\x05\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x0f\x09" } },
    .{ "JetGetSecondaryIndexBookmark", MethodRecord{ .library = "ESENT", .import = "JetGetSecondaryIndexBookmark", .signature = "\x00\x09\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x0f\x09\x0f\x01\x09\x0f\x09\x09" } },
    .{ "JetCompactA", MethodRecord{ .library = "ESENT", .import = "JetCompactA", .signature = "\x00\x06\x08\x11\xbe\x29\x0f\x04\x0f\x04\x12\xbe\xb1\x0f\x11\xbe\xb5\x09" } },
    .{ "JetCompactW", MethodRecord{ .library = "ESENT", .import = "JetCompactW", .signature = "\x00\x06\x08\x11\xbe\x29\x0f\x07\x0f\x07\x12\xbe\xb1\x0f\x11\xbe\xb9\x09" } },
    .{ "JetDefragmentA", MethodRecord{ .library = "ESENT", .import = "JetDefragmentA", .signature = "\x00\x06\x08\x11\xbe\x29\x09\x0f\x04\x0f\x09\x0f\x09\x09" } },
    .{ "JetDefragmentW", MethodRecord{ .library = "ESENT", .import = "JetDefragmentW", .signature = "\x00\x06\x08\x11\xbe\x29\x09\x0f\x07\x0f\x09\x0f\x09\x09" } },
    .{ "JetDefragment2A", MethodRecord{ .library = "ESENT", .import = "JetDefragment2A", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x04\x0f\x09\x0f\x09\x12\xbe\xbd\x09" } },
    .{ "JetDefragment2W", MethodRecord{ .library = "ESENT", .import = "JetDefragment2W", .signature = "\x00\x07\x08\x11\xbe\x29\x09\x0f\x07\x0f\x09\x0f\x09\x12\xbe\xbd\x09" } },
    .{ "JetDefragment3A", MethodRecord{ .library = "ESENT", .import = "JetDefragment3A", .signature = "\x00\x08\x08\x11\xbe\x29\x0f\x04\x0f\x04\x0f\x09\x0f\x09\x12\xbe\xbd\x0f\x01\x09" } },
    .{ "JetDefragment3W", MethodRecord{ .library = "ESENT", .import = "JetDefragment3W", .signature = "\x00\x08\x08\x11\xbe\x29\x0f\x07\x0f\x07\x0f\x09\x0f\x09\x12\xbe\xbd\x0f\x01\x09" } },
    .{ "JetSetDatabaseSizeA", MethodRecord{ .library = "ESENT", .import = "JetSetDatabaseSizeA", .signature = "\x00\x04\x08\x11\xbe\x29\x0f\x04\x09\x0f\x09" } },
    .{ "JetSetDatabaseSizeW", MethodRecord{ .library = "ESENT", .import = "JetSetDatabaseSizeW", .signature = "\x00\x04\x08\x11\xbe\x29\x0f\x07\x09\x0f\x09" } },
    .{ "JetGrowDatabase", MethodRecord{ .library = "ESENT", .import = "JetGrowDatabase", .signature = "\x00\x04\x08\x11\xbe\x29\x09\x09\x0f\x09" } },
    .{ "JetResizeDatabase", MethodRecord{ .library = "ESENT", .import = "JetResizeDatabase", .signature = "\x00\x05\x08\x11\xbe\x29\x09\x09\x0f\x09\x09" } },
    .{ "JetSetSessionContext", MethodRecord{ .library = "ESENT", .import = "JetSetSessionContext", .signature = "\x00\x02\x08\x11\xbe\x29\x11\xbe\x2d" } },
    .{ "JetResetSessionContext", MethodRecord{ .library = "ESENT", .import = "JetResetSessionContext", .signature = "\x00\x01\x08\x11\xbe\x29" } },
    .{ "JetGotoBookmark", MethodRecord{ .library = "ESENT", .import = "JetGotoBookmark", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09" } },
    .{ "JetGotoSecondaryIndexBookmark", MethodRecord{ .library = "ESENT", .import = "JetGotoSecondaryIndexBookmark", .signature = "\x00\x07\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x0f\x01\x09\x09" } },
    .{ "JetIntersectIndexes", MethodRecord{ .library = "ESENT", .import = "JetIntersectIndexes", .signature = "\x00\x05\x08\x11\xbe\x29\x0f\x11\xbe\xc1\x09\x0f\x11\xbe\xc5\x09" } },
    .{ "JetComputeStats", MethodRecord{ .library = "ESENT", .import = "JetComputeStats", .signature = "\x00\x02\x08\x11\xbe\x29\x11\xbe\x39" } },
    .{ "JetOpenTempTable", MethodRecord{ .library = "ESENT", .import = "JetOpenTempTable", .signature = "\x00\x06\x08\x11\xbe\x29\x0f\x11\xbe\x5d\x09\x09\x0f\x11\xbe\x39\x0f\x09" } },
    .{ "JetOpenTempTable2", MethodRecord{ .library = "ESENT", .import = "JetOpenTempTable2", .signature = "\x00\x07\x08\x11\xbe\x29\x0f\x11\xbe\x5d\x09\x09\x09\x0f\x11\xbe\x39\x0f\x09" } },
    .{ "JetOpenTempTable3", MethodRecord{ .library = "ESENT", .import = "JetOpenTempTable3", .signature = "\x00\x07\x08\x11\xbe\x29\x0f\x11\xbe\x5d\x09\x0f\x11\xbe\xc9\x09\x0f\x11\xbe\x39\x0f\x09" } },
    .{ "JetOpenTemporaryTable", MethodRecord{ .library = "ESENT", .import = "JetOpenTemporaryTable", .signature = "\x00\x02\x08\x11\xbe\x29\x0f\x11\xbe\xcd" } },
    .{ "JetOpenTemporaryTable2", MethodRecord{ .library = "ESENT", .import = "JetOpenTemporaryTable2", .signature = "\x00\x02\x08\x11\xbe\x29\x0f\x11\xbe\xd1" } },
    .{ "JetBackupA", MethodRecord{ .library = "ESENT", .import = "JetBackupA", .signature = "\x00\x03\x08\x0f\x04\x09\x12\xbe\xb1" } },
    .{ "JetBackupW", MethodRecord{ .library = "ESENT", .import = "JetBackupW", .signature = "\x00\x03\x08\x0f\x07\x09\x12\xbe\xb1" } },
    .{ "JetBackupInstanceA", MethodRecord{ .library = "ESENT", .import = "JetBackupInstanceA", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x04\x09\x12\xbe\xb1" } },
    .{ "JetBackupInstanceW", MethodRecord{ .library = "ESENT", .import = "JetBackupInstanceW", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x07\x09\x12\xbe\xb1" } },
    .{ "JetRestoreA", MethodRecord{ .library = "ESENT", .import = "JetRestoreA", .signature = "\x00\x02\x08\x0f\x04\x12\xbe\xb1" } },
    .{ "JetRestoreW", MethodRecord{ .library = "ESENT", .import = "JetRestoreW", .signature = "\x00\x02\x08\x0f\x07\x12\xbe\xb1" } },
    .{ "JetRestore2A", MethodRecord{ .library = "ESENT", .import = "JetRestore2A", .signature = "\x00\x03\x08\x0f\x04\x0f\x04\x12\xbe\xb1" } },
    .{ "JetRestore2W", MethodRecord{ .library = "ESENT", .import = "JetRestore2W", .signature = "\x00\x03\x08\x0f\x07\x0f\x07\x12\xbe\xb1" } },
    .{ "JetRestoreInstanceA", MethodRecord{ .library = "ESENT", .import = "JetRestoreInstanceA", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x04\x0f\x04\x12\xbe\xb1" } },
    .{ "JetRestoreInstanceW", MethodRecord{ .library = "ESENT", .import = "JetRestoreInstanceW", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x07\x0f\x07\x12\xbe\xb1" } },
    .{ "JetSetIndexRange", MethodRecord{ .library = "ESENT", .import = "JetSetIndexRange", .signature = "\x00\x03\x08\x11\xbe\x29\x11\xbe\x39\x09" } },
    .{ "JetIndexRecordCount", MethodRecord{ .library = "ESENT", .import = "JetIndexRecordCount", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x09\x09" } },
    .{ "JetRetrieveKey", MethodRecord{ .library = "ESENT", .import = "JetRetrieveKey", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x0f\x01\x09\x0f\x09\x09" } },
    .{ "JetBeginExternalBackup", MethodRecord{ .library = "ESENT", .import = "JetBeginExternalBackup", .signature = "\x00\x01\x08\x09" } },
    .{ "JetBeginExternalBackupInstance", MethodRecord{ .library = "ESENT", .import = "JetBeginExternalBackupInstance", .signature = "\x00\x02\x08\x11\xbe\x1d\x09" } },
    .{ "JetGetAttachInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetAttachInfoA", .signature = "\x00\x03\x08\x0f\x04\x09\x0f\x09" } },
    .{ "JetGetAttachInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetAttachInfoW", .signature = "\x00\x03\x08\x0f\x07\x09\x0f\x09" } },
    .{ "JetGetAttachInfoInstanceA", MethodRecord{ .library = "ESENT", .import = "JetGetAttachInfoInstanceA", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x04\x09\x0f\x09" } },
    .{ "JetGetAttachInfoInstanceW", MethodRecord{ .library = "ESENT", .import = "JetGetAttachInfoInstanceW", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x07\x09\x0f\x09" } },
    .{ "JetOpenFileA", MethodRecord{ .library = "ESENT", .import = "JetOpenFileA", .signature = "\x00\x04\x08\x0f\x04\x0f\x11\xbe\xd5\x0f\x09\x0f\x09" } },
    .{ "JetOpenFileW", MethodRecord{ .library = "ESENT", .import = "JetOpenFileW", .signature = "\x00\x04\x08\x0f\x07\x0f\x11\xbe\xd5\x0f\x09\x0f\x09" } },
    .{ "JetOpenFileInstanceA", MethodRecord{ .library = "ESENT", .import = "JetOpenFileInstanceA", .signature = "\x00\x05\x08\x11\xbe\x1d\x0f\x04\x0f\x11\xbe\xd5\x0f\x09\x0f\x09" } },
    .{ "JetOpenFileInstanceW", MethodRecord{ .library = "ESENT", .import = "JetOpenFileInstanceW", .signature = "\x00\x05\x08\x11\xbe\x1d\x0f\x07\x0f\x11\xbe\xd5\x0f\x09\x0f\x09" } },
    .{ "JetReadFile", MethodRecord{ .library = "ESENT", .import = "JetReadFile", .signature = "\x00\x04\x08\x11\xbe\xd5\x0f\x01\x09\x0f\x09" } },
    .{ "JetReadFileInstance", MethodRecord{ .library = "ESENT", .import = "JetReadFileInstance", .signature = "\x00\x05\x08\x11\xbe\x1d\x11\xbe\xd5\x0f\x01\x09\x0f\x09" } },
    .{ "JetCloseFile", MethodRecord{ .library = "ESENT", .import = "JetCloseFile", .signature = "\x00\x01\x08\x11\xbe\xd5" } },
    .{ "JetCloseFileInstance", MethodRecord{ .library = "ESENT", .import = "JetCloseFileInstance", .signature = "\x00\x02\x08\x11\xbe\x1d\x11\xbe\xd5" } },
    .{ "JetGetLogInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetLogInfoA", .signature = "\x00\x03\x08\x0f\x04\x09\x0f\x09" } },
    .{ "JetGetLogInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetLogInfoW", .signature = "\x00\x03\x08\x0f\x07\x09\x0f\x09" } },
    .{ "JetGetLogInfoInstanceA", MethodRecord{ .library = "ESENT", .import = "JetGetLogInfoInstanceA", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x04\x09\x0f\x09" } },
    .{ "JetGetLogInfoInstanceW", MethodRecord{ .library = "ESENT", .import = "JetGetLogInfoInstanceW", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x07\x09\x0f\x09" } },
    .{ "JetGetLogInfoInstance2A", MethodRecord{ .library = "ESENT", .import = "JetGetLogInfoInstance2A", .signature = "\x00\x05\x08\x11\xbe\x1d\x0f\x04\x09\x0f\x09\x0f\x11\xbe\xd9" } },
    .{ "JetGetLogInfoInstance2W", MethodRecord{ .library = "ESENT", .import = "JetGetLogInfoInstance2W", .signature = "\x00\x05\x08\x11\xbe\x1d\x0f\x07\x09\x0f\x09\x0f\x11\xbe\xdd" } },
    .{ "JetGetTruncateLogInfoInstanceA", MethodRecord{ .library = "ESENT", .import = "JetGetTruncateLogInfoInstanceA", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x04\x09\x0f\x09" } },
    .{ "JetGetTruncateLogInfoInstanceW", MethodRecord{ .library = "ESENT", .import = "JetGetTruncateLogInfoInstanceW", .signature = "\x00\x04\x08\x11\xbe\x1d\x0f\x07\x09\x0f\x09" } },
    .{ "JetTruncateLog", MethodRecord{ .library = "ESENT", .import = "JetTruncateLog", .signature = "\x00\x00\x08" } },
    .{ "JetTruncateLogInstance", MethodRecord{ .library = "ESENT", .import = "JetTruncateLogInstance", .signature = "\x00\x01\x08\x11\xbe\x1d" } },
    .{ "JetEndExternalBackup", MethodRecord{ .library = "ESENT", .import = "JetEndExternalBackup", .signature = "\x00\x00\x08" } },
    .{ "JetEndExternalBackupInstance", MethodRecord{ .library = "ESENT", .import = "JetEndExternalBackupInstance", .signature = "\x00\x01\x08\x11\xbe\x1d" } },
    .{ "JetEndExternalBackupInstance2", MethodRecord{ .library = "ESENT", .import = "JetEndExternalBackupInstance2", .signature = "\x00\x02\x08\x11\xbe\x1d\x09" } },
    .{ "JetExternalRestoreA", MethodRecord{ .library = "ESENT", .import = "JetExternalRestoreA", .signature = "\x00\x08\x08\x0f\x04\x0f\x04\x0f\x11\xbe\xe1\x08\x0f\x04\x08\x08\x12\xbe\xb1" } },
    .{ "JetExternalRestoreW", MethodRecord{ .library = "ESENT", .import = "JetExternalRestoreW", .signature = "\x00\x08\x08\x0f\x07\x0f\x07\x0f\x11\xbe\xe5\x08\x0f\x07\x08\x08\x12\xbe\xb1" } },
    .{ "JetExternalRestore2A", MethodRecord{ .library = "ESENT", .import = "JetExternalRestore2A", .signature = "\x00\x0a\x08\x0f\x04\x0f\x04\x0f\x11\xbe\xe1\x08\x0f\x04\x0f\x11\xbe\xd9\x0f\x04\x0f\x04\x0f\x04\x12\xbe\xb1" } },
    .{ "JetExternalRestore2W", MethodRecord{ .library = "ESENT", .import = "JetExternalRestore2W", .signature = "\x00\x0a\x08\x0f\x07\x0f\x07\x0f\x11\xbe\xe5\x08\x0f\x07\x0f\x11\xbe\xdd\x0f\x07\x0f\x07\x0f\x07\x12\xbe\xb1" } },
    .{ "JetRegisterCallback", MethodRecord{ .library = "ESENT", .import = "JetRegisterCallback", .signature = "\x00\x06\x08\x11\xbe\x29\x11\xbe\x39\x09\x12\xbe\xbd\x0f\x01\x0f\x11\xbe\xd5" } },
    .{ "JetUnregisterCallback", MethodRecord{ .library = "ESENT", .import = "JetUnregisterCallback", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x09\x11\xbe\xd5" } },
    .{ "JetGetInstanceInfoA", MethodRecord{ .library = "ESENT", .import = "JetGetInstanceInfoA", .signature = "\x00\x02\x08\x0f\x09\x0f\x0f\x11\xbe\xe9" } },
    .{ "JetGetInstanceInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetInstanceInfoW", .signature = "\x00\x02\x08\x0f\x09\x0f\x0f\x11\xbe\xed" } },
    .{ "JetFreeBuffer", MethodRecord{ .library = "ESENT", .import = "JetFreeBuffer", .signature = "\x00\x01\x08\x0f\x04" } },
    .{ "JetSetLS", MethodRecord{ .library = "ESENT", .import = "JetSetLS", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x11\xbe\xf1\x09" } },
    .{ "JetGetLS", MethodRecord{ .library = "ESENT", .import = "JetGetLS", .signature = "\x00\x04\x08\x11\xbe\x29\x11\xbe\x39\x0f\x11\xbe\xf1\x09" } },
    .{ "JetOSSnapshotPrepare", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotPrepare", .signature = "\x00\x02\x08\x0f\x11\xbe\xf5\x09" } },
    .{ "JetOSSnapshotPrepareInstance", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotPrepareInstance", .signature = "\x00\x03\x08\x11\xbe\xf5\x11\xbe\x1d\x09" } },
    .{ "JetOSSnapshotFreezeA", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotFreezeA", .signature = "\x00\x04\x08\x11\xbe\xf5\x0f\x09\x0f\x0f\x11\xbe\xe9\x09" } },
    .{ "JetOSSnapshotFreezeW", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotFreezeW", .signature = "\x00\x04\x08\x11\xbe\xf5\x0f\x09\x0f\x0f\x11\xbe\xed\x09" } },
    .{ "JetOSSnapshotThaw", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotThaw", .signature = "\x00\x02\x08\x11\xbe\xf5\x09" } },
    .{ "JetOSSnapshotAbort", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotAbort", .signature = "\x00\x02\x08\x11\xbe\xf5\x09" } },
    .{ "JetOSSnapshotTruncateLog", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotTruncateLog", .signature = "\x00\x02\x08\x11\xbe\xf5\x09" } },
    .{ "JetOSSnapshotTruncateLogInstance", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotTruncateLogInstance", .signature = "\x00\x03\x08\x11\xbe\xf5\x11\xbe\x1d\x09" } },
    .{ "JetOSSnapshotGetFreezeInfoA", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotGetFreezeInfoA", .signature = "\x00\x04\x08\x11\xbe\xf5\x0f\x09\x0f\x0f\x11\xbe\xe9\x09" } },
    .{ "JetOSSnapshotGetFreezeInfoW", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotGetFreezeInfoW", .signature = "\x00\x04\x08\x11\xbe\xf5\x0f\x09\x0f\x0f\x11\xbe\xed\x09" } },
    .{ "JetOSSnapshotEnd", MethodRecord{ .library = "ESENT", .import = "JetOSSnapshotEnd", .signature = "\x00\x02\x08\x11\xbe\xf5\x09" } },
    .{ "JetConfigureProcessForCrashDump", MethodRecord{ .library = "ESENT", .import = "JetConfigureProcessForCrashDump", .signature = "\x00\x01\x08\x09" } },
    .{ "JetGetErrorInfoW", MethodRecord{ .library = "ESENT", .import = "JetGetErrorInfoW", .signature = "\x00\x05\x08\x0f\x01\x0f\x01\x09\x09\x09" } },
    .{ "JetSetSessionParameter", MethodRecord{ .library = "ESENT", .import = "JetSetSessionParameter", .signature = "\x00\x04\x08\x11\xbe\x29\x09\x0f\x01\x09" } },
    .{ "JetGetSessionParameter", MethodRecord{ .library = "ESENT", .import = "JetGetSessionParameter", .signature = "\x00\x05\x08\x11\xbe\x29\x09\x0f\x01\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x3e1d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INSTANCE" },
        0x3e21 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RSTINFO_A" },
        0x3e25 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RSTINFO_W" },
        0x3e29 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_SESID" },
        0x3e2d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.StructuredStorage", .name = "JET_API_PTR" },
        0x3e31 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_SETSYSPARAM_A" },
        0x3e35 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_SETSYSPARAM_W" },
        0x3e39 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.StructuredStorage", .name = "JET_TABLEID" },
        0x3e3d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE_A" },
        0x3e41 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE_W" },
        0x3e45 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE2_A" },
        0x3e49 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE2_W" },
        0x3e4d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE3_A" },
        0x3e51 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE3_W" },
        0x3e55 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE4_A" },
        0x3e59 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_TABLECREATE4_W" },
        0x3e5d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_COLUMNDEF" },
        0x3e61 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXCREATE_A" },
        0x3e65 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXCREATE_W" },
        0x3e69 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXCREATE2_A" },
        0x3e6d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXCREATE2_W" },
        0x3e71 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXCREATE3_A" },
        0x3e75 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXCREATE3_W" },
        0x3e79 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_COMMIT_ID" },
        0x3e7d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RETINFO" },
        0x3e81 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RETRIEVECOLUMN" },
        0x3e85 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_ENUMCOLUMNID" },
        0x3e89 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_ENUMCOLUMN" },
        0x3e8d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_PFNREALLOC" },
        0x3e91 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RECSIZE" },
        0x3e95 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RECSIZE2" },
        0x3e99 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_SETINFO" },
        0x3e9d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_SETCOLUMN" },
        0x3ea1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RECPOS" },
        0x3ea5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXID" },
        0x3ea9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEX_COLUMN" },
        0x3ead => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEX_RANGE" },
        0x3eb1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_PFNSTATUS" },
        0x3eb5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_CONVERT_A" },
        0x3eb9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_CONVERT_W" },
        0x3ebd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_CALLBACK" },
        0x3ec1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INDEXRANGE" },
        0x3ec5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RECORDLIST" },
        0x3ec9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_UNICODEINDEX" },
        0x3ecd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_OPENTEMPORARYTABLE" },
        0x3ed1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_OPENTEMPORARYTABLE2" },
        0x3ed5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.StructuredStorage", .name = "JET_HANDLE" },
        0x3ed9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_LOGINFO_A" },
        0x3edd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_LOGINFO_W" },
        0x3ee1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RSTMAP_A" },
        0x3ee5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_RSTMAP_W" },
        0x3ee9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INSTANCE_INFO_A" },
        0x3eed => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_INSTANCE_INFO_W" },
        0x3ef1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_LS" },
        0x3ef5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Jet", .name = "JET_OSSNAPID" },
        else => null,
    };
}

pub const JET_VERSION = 1280;
pub const JET_bitConfigStoreReadControlInhibitRead = 1;
pub const JET_bitConfigStoreReadControlDisableAll = 2;
pub const JET_bitConfigStoreReadControlDefault = 0;
pub const JET_efvUseEngineDefault = 1073741825;
pub const JET_efvUsePersistedFormat = 1073741826;
pub const JET_efvAllowHigherPersistedFormat = 1090519040;
pub const JET_efvWindows19H1Rtm = 8920;
pub const JET_efvWindows10v2004 = 9180;
pub const JET_efvWindowsServer2022 = 9360;
pub const JET_efvWindows11v21H2 = 9400;
pub const JET_efvWindows11v22H2 = 9480;
pub const JET_efvWindows11v23H2 = 9600;
pub const JET_bitDefragmentBatchStart = 1;
pub const JET_bitDefragmentBatchStop = 2;
pub const JET_bitDefragmentAvailSpaceTreesOnly = 64;
pub const JET_bitDefragmentNoPartialMerges = 128;
pub const JET_bitDefragmentBTree = 256;
pub const JET_cbtypNull = 0;
pub const JET_cbtypFinalize = 1;
pub const JET_cbtypBeforeInsert = 2;
pub const JET_cbtypAfterInsert = 4;
pub const JET_cbtypBeforeReplace = 8;
pub const JET_cbtypAfterReplace = 16;
pub const JET_cbtypBeforeDelete = 32;
pub const JET_cbtypAfterDelete = 64;
pub const JET_cbtypUserDefinedDefaultValue = 128;
pub const JET_cbtypOnlineDefragCompleted = 256;
pub const JET_cbtypFreeCursorLS = 512;
pub const JET_cbtypFreeTableLS = 1024;
pub const JET_bitTableInfoUpdatable = 1;
pub const JET_bitTableInfoBookmark = 2;
pub const JET_bitTableInfoRollback = 4;
pub const JET_bitObjectSystem = 2147483648;
pub const JET_bitObjectTableFixedDDL = 1073741824;
pub const JET_bitObjectTableTemplate = 536870912;
pub const JET_bitObjectTableDerived = 268435456;
pub const JET_bitObjectTableNoFixedVarColumnsInDerivedTables = 67108864;
pub const cObjectInfoCols = 9;
pub const cColumnInfoCols = 14;
pub const cIndexInfoCols = 15;
pub const JET_MAX_COMPUTERNAME_LENGTH = 15;
pub const JET_bitDurableCommitCallbackLogUnavailable = 1;
pub const JET_cbBookmarkMost = 256;
pub const JET_cbNameMost = 64;
pub const JET_cbFullNameMost = 255;
pub const JET_cbColumnLVPageOverhead = 82;
pub const JET_cbLVDefaultValueMost = 255;
pub const JET_cbColumnMost = 255;
pub const JET_cbLVColumnMost = 2147483647;
pub const JET_cbKeyMost8KBytePage = 2000;
pub const JET_cbKeyMost4KBytePage = 1000;
pub const JET_cbKeyMost2KBytePage = 500;
pub const JET_cbKeyMostMin = 255;
pub const JET_cbKeyMost = 255;
pub const JET_cbLimitKeyMost = 256;
pub const JET_cbPrimaryKeyMost = 255;
pub const JET_cbSecondaryKeyMost = 255;
pub const JET_ccolKeyMost = 16;
pub const JET_ccolMost = 65248;
pub const JET_ccolFixedMost = 127;
pub const JET_ccolVarMost = 128;
pub const JET_ccolTaggedMost = 64993;
pub const JET_EventLoggingDisable = 0;
pub const JET_EventLoggingLevelMin = 1;
pub const JET_EventLoggingLevelLow = 25;
pub const JET_EventLoggingLevelMedium = 50;
pub const JET_EventLoggingLevelHigh = 75;
pub const JET_EventLoggingLevelMax = 100;
pub const JET_IOPriorityNormal = 0;
pub const JET_IOPriorityLow = 1;
pub const JET_configDefault = 1;
pub const JET_configRemoveQuotas = 2;
pub const JET_configLowDiskFootprint = 4;
pub const JET_configMediumDiskFootprint = 8;
pub const JET_configLowMemory = 16;
pub const JET_configDynamicMediumMemory = 32;
pub const JET_configLowPower = 64;
pub const JET_configSSDProfileIO = 128;
pub const JET_configRunSilent = 256;
pub const JET_configUnthrottledMemory = 512;
pub const JET_configHighConcurrencyScaling = 1024;
pub const JET_paramSystemPath = 0;
pub const JET_paramTempPath = 1;
pub const JET_paramLogFilePath = 2;
pub const JET_paramBaseName = 3;
pub const JET_paramEventSource = 4;
pub const JET_paramMaxSessions = 5;
pub const JET_paramMaxOpenTables = 6;
pub const JET_paramPreferredMaxOpenTables = 7;
pub const JET_paramCachedClosedTables = 125;
pub const JET_paramMaxCursors = 8;
pub const JET_paramMaxVerPages = 9;
pub const JET_paramPreferredVerPages = 63;
pub const JET_paramGlobalMinVerPages = 81;
pub const JET_paramVersionStoreTaskQueueMax = 105;
pub const JET_paramMaxTemporaryTables = 10;
pub const JET_paramLogFileSize = 11;
pub const JET_paramLogBuffers = 12;
pub const JET_paramWaitLogFlush = 13;
pub const JET_paramLogCheckpointPeriod = 14;
pub const JET_paramLogWaitingUserMax = 15;
pub const JET_paramCommitDefault = 16;
pub const JET_paramCircularLog = 17;
pub const JET_paramDbExtensionSize = 18;
pub const JET_paramPageTempDBMin = 19;
pub const JET_paramPageFragment = 20;
pub const JET_paramEnableFileCache = 126;
pub const JET_paramVerPageSize = 128;
pub const JET_paramConfiguration = 129;
pub const JET_paramEnableAdvanced = 130;
pub const JET_paramMaxColtyp = 131;
pub const JET_paramBatchIOBufferMax = 22;
pub const JET_paramCacheSize = 41;
pub const JET_paramCacheSizeMin = 60;
pub const JET_paramCacheSizeMax = 23;
pub const JET_paramCheckpointDepthMax = 24;
pub const JET_paramLRUKCorrInterval = 25;
pub const JET_paramLRUKHistoryMax = 26;
pub const JET_paramLRUKPolicy = 27;
pub const JET_paramLRUKTimeout = 28;
pub const JET_paramLRUKTrxCorrInterval = 29;
pub const JET_paramOutstandingIOMax = 30;
pub const JET_paramStartFlushThreshold = 31;
pub const JET_paramStopFlushThreshold = 32;
pub const JET_paramEnableViewCache = 127;
pub const JET_paramCheckpointIOMax = 135;
pub const JET_paramTableClass1Name = 137;
pub const JET_paramTableClass2Name = 138;
pub const JET_paramTableClass3Name = 139;
pub const JET_paramTableClass4Name = 140;
pub const JET_paramTableClass5Name = 141;
pub const JET_paramTableClass6Name = 142;
pub const JET_paramTableClass7Name = 143;
pub const JET_paramTableClass8Name = 144;
pub const JET_paramTableClass9Name = 145;
pub const JET_paramTableClass10Name = 146;
pub const JET_paramTableClass11Name = 147;
pub const JET_paramTableClass12Name = 148;
pub const JET_paramTableClass13Name = 149;
pub const JET_paramTableClass14Name = 150;
pub const JET_paramTableClass15Name = 151;
pub const JET_paramIOPriority = 152;
pub const JET_paramRecovery = 34;
pub const JET_paramEnableOnlineDefrag = 35;
pub const JET_paramCheckFormatWhenOpenFail = 44;
pub const JET_paramEnableTempTableVersioning = 46;
pub const JET_paramIgnoreLogVersion = 47;
pub const JET_paramDeleteOldLogs = 48;
pub const JET_paramEventSourceKey = 49;
pub const JET_paramNoInformationEvent = 50;
pub const JET_paramEventLoggingLevel = 51;
pub const JET_paramDeleteOutOfRangeLogs = 52;
pub const JET_paramAccessDeniedRetryPeriod = 53;
pub const JET_paramEnableIndexChecking = 45;
pub const JET_paramEnableIndexCleanup = 54;
pub const JET_paramDatabasePageSize = 64;
pub const JET_paramDisableCallbacks = 65;
pub const JET_paramLogFileCreateAsynch = 69;
pub const JET_paramErrorToString = 70;
pub const JET_paramZeroDatabaseDuringBackup = 71;
pub const JET_paramUnicodeIndexDefault = 72;
pub const JET_paramRuntimeCallback = 73;
pub const JET_paramCleanupMismatchedLogFiles = 77;
pub const JET_paramRecordUpgradeDirtyLevel = 78;
pub const JET_paramOSSnapshotTimeout = 82;
pub const JET_paramExceptionAction = 98;
pub const JET_paramEventLogCache = 99;
pub const JET_paramCreatePathIfNotExist = 100;
pub const JET_paramPageHintCacheSize = 101;
pub const JET_paramOneDatabasePerSession = 102;
pub const JET_paramMaxInstances = 104;
pub const JET_paramDisablePerfmon = 107;
pub const JET_paramIndexTuplesLengthMin = 110;
pub const JET_paramIndexTuplesLengthMax = 111;
pub const JET_paramIndexTuplesToIndexMax = 112;
pub const JET_paramAlternateDatabaseRecoveryPath = 113;
pub const JET_paramIndexTupleIncrement = 132;
pub const JET_paramIndexTupleStart = 133;
pub const JET_paramKeyMost = 134;
pub const JET_paramLegacyFileNames = 136;
pub const JET_paramEnablePersistedCallbacks = 156;
pub const JET_paramWaypointLatency = 153;
pub const JET_paramDefragmentSequentialBTrees = 160;
pub const JET_paramDefragmentSequentialBTreesDensityCheckFrequency = 161;
pub const JET_paramIOThrottlingTimeQuanta = 162;
pub const JET_paramLVChunkSizeMost = 163;
pub const JET_paramMaxCoalesceReadSize = 164;
pub const JET_paramMaxCoalesceWriteSize = 165;
pub const JET_paramMaxCoalesceReadGapSize = 166;
pub const JET_paramMaxCoalesceWriteGapSize = 167;
pub const JET_paramEnableDBScanInRecovery = 169;
pub const JET_paramDbScanThrottle = 170;
pub const JET_paramDbScanIntervalMinSec = 171;
pub const JET_paramDbScanIntervalMaxSec = 172;
pub const JET_paramCachePriority = 177;
pub const JET_paramMaxTransactionSize = 178;
pub const JET_paramPrereadIOMax = 179;
pub const JET_paramEnableDBScanSerialization = 180;
pub const JET_paramHungIOThreshold = 181;
pub const JET_paramHungIOActions = 182;
pub const JET_paramMinDataForXpress = 183;
pub const JET_paramEnableShrinkDatabase = 184;
pub const JET_paramProcessFriendlyName = 186;
pub const JET_paramDurableCommitCallback = 187;
pub const JET_paramEnableSqm = 188;
pub const JET_paramConfigStoreSpec = 189;
pub const JET_paramEngineFormatVersion = 194;
pub const JET_paramUseFlushForWriteDurability = 214;
pub const JET_paramEnableRBS = 215;
pub const JET_paramRBSFilePath = 216;
pub const JET_paramPerfmonRefreshInterval = 217;
pub const JET_paramEnableBlockCache = 218;
pub const JET_paramTraceFlags = 223;
pub const JET_paramMaxValueInvalid = 232;
pub const JET_sesparamCommitDefault = 4097;
pub const JET_sesparamTransactionLevel = 4099;
pub const JET_sesparamOperationContext = 4100;
pub const JET_sesparamCorrelationID = 4101;
pub const JET_sesparamMaxValueInvalid = 4111;
pub const JET_bitESE98FileNames = 1;
pub const JET_bitEightDotThreeSoftCompat = 2;
pub const JET_bitHungIOEvent = 1;
pub const JET_bitShrinkDatabaseOff = 0;
pub const JET_bitShrinkDatabaseOn = 1;
pub const JET_bitShrinkDatabaseRealtime = 2;
pub const JET_bitShrinkDatabaseTrim = 1;
pub const JET_bitReplayIgnoreMissingDB = 4;
pub const JET_bitRecoveryWithoutUndo = 8;
pub const JET_bitTruncateLogsAfterRecovery = 16;
pub const JET_bitReplayMissingMapEntryDB = 32;
pub const JET_bitLogStreamMustExist = 64;
pub const JET_bitReplayIgnoreLostLogs = 128;
pub const JET_bitKeepDbAttachedAtEndOfRecovery = 4096;
pub const JET_bitTermComplete = 1;
pub const JET_bitTermAbrupt = 2;
pub const JET_bitTermStopBackup = 4;
pub const JET_bitTermDirty = 8;
pub const JET_bitIdleFlushBuffers = 1;
pub const JET_bitIdleCompact = 2;
pub const JET_bitIdleStatus = 4;
pub const JET_bitDbReadOnly = 1;
pub const JET_bitDbExclusive = 2;
pub const JET_bitDbDeleteCorruptIndexes = 16;
pub const JET_bitDbDeleteUnicodeIndexes = 1024;
pub const JET_bitDbUpgrade = 512;
pub const JET_bitDbEnableBackgroundMaintenance = 2048;
pub const JET_bitDbPurgeCacheOnAttach = 4096;
pub const JET_bitForceDetach = 1;
pub const JET_bitDbRecoveryOff = 8;
pub const JET_bitDbShadowingOff = 128;
pub const JET_bitDbOverwriteExisting = 512;
pub const JET_bitBackupIncremental = 1;
pub const JET_bitBackupAtomic = 4;
pub const JET_bitBackupSnapshot = 16;
pub const JET_bitBackupEndNormal = 1;
pub const JET_bitBackupEndAbort = 2;
pub const JET_bitBackupTruncateDone = 256;
pub const JET_bitTableCreateFixedDDL = 1;
pub const JET_bitTableCreateTemplateTable = 2;
pub const JET_bitTableCreateNoFixedVarColumnsInDerivedTables = 4;
pub const JET_bitTableCreateImmutableStructure = 8;
pub const JET_bitColumnFixed = 1;
pub const JET_bitColumnTagged = 2;
pub const JET_bitColumnNotNULL = 4;
pub const JET_bitColumnVersion = 8;
pub const JET_bitColumnAutoincrement = 16;
pub const JET_bitColumnUpdatable = 32;
pub const JET_bitColumnTTKey = 64;
pub const JET_bitColumnTTDescending = 128;
pub const JET_bitColumnMultiValued = 1024;
pub const JET_bitColumnEscrowUpdate = 2048;
pub const JET_bitColumnUnversioned = 4096;
pub const JET_bitColumnMaybeNull = 8192;
pub const JET_bitColumnFinalize = 16384;
pub const JET_bitColumnUserDefinedDefault = 32768;
pub const JET_bitColumnDeleteOnZero = 131072;
pub const JET_bitColumnCompressed = 524288;
pub const JET_bitDeleteColumnIgnoreTemplateColumns = 1;
pub const JET_bitMoveFirst = 0;
pub const JET_bitNoMove = 2;
pub const JET_bitNewKey = 1;
pub const JET_bitStrLimit = 2;
pub const JET_bitSubStrLimit = 4;
pub const JET_bitNormalizedKey = 8;
pub const JET_bitKeyDataZeroLength = 16;
pub const JET_bitFullColumnStartLimit = 256;
pub const JET_bitFullColumnEndLimit = 512;
pub const JET_bitPartialColumnStartLimit = 1024;
pub const JET_bitPartialColumnEndLimit = 2048;
pub const JET_bitRangeInclusive = 1;
pub const JET_bitRangeUpperLimit = 2;
pub const JET_bitRangeInstantDuration = 4;
pub const JET_bitRangeRemove = 8;
pub const JET_bitReadLock = 1;
pub const JET_bitWriteLock = 2;
pub const JET_MoveFirst = 2147483648;
pub const JET_MovePrevious = -1;
pub const JET_MoveLast = 2147483647;
pub const JET_bitMoveKeyNE = 1;
pub const JET_bitSeekEQ = 1;
pub const JET_bitSeekLT = 2;
pub const JET_bitSeekLE = 4;
pub const JET_bitSeekGE = 8;
pub const JET_bitSeekGT = 16;
pub const JET_bitSetIndexRange = 32;
pub const JET_bitCheckUniqueness = 64;
pub const JET_bitBookmarkPermitVirtualCurrency = 1;
pub const JET_bitIndexColumnMustBeNull = 1;
pub const JET_bitIndexColumnMustBeNonNull = 2;
pub const JET_bitRecordInIndex = 1;
pub const JET_bitRecordNotInIndex = 2;
pub const JET_bitIndexUnique = 1;
pub const JET_bitIndexPrimary = 2;
pub const JET_bitIndexDisallowNull = 4;
pub const JET_bitIndexIgnoreNull = 8;
pub const JET_bitIndexIgnoreAnyNull = 32;
pub const JET_bitIndexIgnoreFirstNull = 64;
pub const JET_bitIndexLazyFlush = 128;
pub const JET_bitIndexEmpty = 256;
pub const JET_bitIndexUnversioned = 512;
pub const JET_bitIndexSortNullsHigh = 1024;
pub const JET_bitIndexUnicode = 2048;
pub const JET_bitIndexTuples = 4096;
pub const JET_bitIndexTupleLimits = 8192;
pub const JET_bitIndexCrossProduct = 16384;
pub const JET_bitIndexKeyMost = 32768;
pub const JET_bitIndexDisallowTruncation = 65536;
pub const JET_bitIndexNestedTable = 131072;
pub const JET_bitIndexDotNetGuid = 262144;
pub const JET_bitIndexImmutableStructure = 524288;
pub const JET_bitKeyAscending = 0;
pub const JET_bitKeyDescending = 1;
pub const JET_bitTableDenyWrite = 1;
pub const JET_bitTableDenyRead = 2;
pub const JET_bitTableReadOnly = 4;
pub const JET_bitTableUpdatable = 8;
pub const JET_bitTablePermitDDL = 16;
pub const JET_bitTableNoCache = 32;
pub const JET_bitTablePreread = 64;
pub const JET_bitTableOpportuneRead = 128;
pub const JET_bitTableSequential = 32768;
pub const JET_bitTableClassMask = 2031616;
pub const JET_bitTableClassNone = 0;
pub const JET_bitTableClass1 = 65536;
pub const JET_bitTableClass2 = 131072;
pub const JET_bitTableClass3 = 196608;
pub const JET_bitTableClass4 = 262144;
pub const JET_bitTableClass5 = 327680;
pub const JET_bitTableClass6 = 393216;
pub const JET_bitTableClass7 = 458752;
pub const JET_bitTableClass8 = 524288;
pub const JET_bitTableClass9 = 589824;
pub const JET_bitTableClass10 = 655360;
pub const JET_bitTableClass11 = 720896;
pub const JET_bitTableClass12 = 786432;
pub const JET_bitTableClass13 = 851968;
pub const JET_bitTableClass14 = 917504;
pub const JET_bitTableClass15 = 983040;
pub const JET_bitLSReset = 1;
pub const JET_bitLSCursor = 2;
pub const JET_bitLSTable = 4;
pub const JET_bitPrereadForward = 1;
pub const JET_bitPrereadBackward = 2;
pub const JET_bitPrereadFirstPage = 4;
pub const JET_bitPrereadNormalizedKey = 8;
pub const JET_bitTTIndexed = 1;
pub const JET_bitTTUnique = 2;
pub const JET_bitTTUpdatable = 4;
pub const JET_bitTTScrollable = 8;
pub const JET_bitTTSortNullsHigh = 16;
pub const JET_bitTTForceMaterialization = 32;
pub const JET_bitTTErrorOnDuplicateInsertion = 32;
pub const JET_bitTTForwardOnly = 64;
pub const JET_bitTTIntrinsicLVsOnly = 128;
pub const JET_bitTTDotNetGuid = 256;
pub const JET_bitTTMaterializeBBT = 512;
pub const JET_bitSetAppendLV = 1;
pub const JET_bitSetOverwriteLV = 4;
pub const JET_bitSetSizeLV = 8;
pub const JET_bitSetZeroLength = 32;
pub const JET_bitSetSeparateLV = 64;
pub const JET_bitSetUniqueMultiValues = 128;
pub const JET_bitSetUniqueNormalizedMultiValues = 256;
pub const JET_bitSetRevertToDefaultValue = 512;
pub const JET_bitSetIntrinsicLV = 1024;
pub const JET_bitSetUncompressed = 65536;
pub const JET_bitSetCompressed = 131072;
pub const JET_bitSetContiguousLV = 262144;
pub const JET_bitSpaceHintsUtilizeParentSpace = 1;
pub const JET_bitCreateHintAppendSequential = 2;
pub const JET_bitCreateHintHotpointSequential = 4;
pub const JET_bitRetrieveHintReserve1 = 8;
pub const JET_bitRetrieveHintTableScanForward = 16;
pub const JET_bitRetrieveHintTableScanBackward = 32;
pub const JET_bitRetrieveHintReserve2 = 64;
pub const JET_bitRetrieveHintReserve3 = 128;
pub const JET_bitDeleteHintTableSequential = 256;
pub const JET_prepInsert = 0;
pub const JET_prepReplace = 2;
pub const JET_prepCancel = 3;
pub const JET_prepReplaceNoLock = 4;
pub const JET_prepInsertCopy = 5;
pub const JET_prepInsertCopyDeleteOriginal = 7;
pub const JET_prepInsertCopyReplaceOriginal = 9;
pub const JET_sqmDisable = 0;
pub const JET_sqmEnable = 1;
pub const JET_sqmFromCEIP = 2;
pub const JET_bitUpdateCheckESE97Compatibility = 1;
pub const JET_bitEscrowNoRollback = 1;
pub const JET_bitRetrieveCopy = 1;
pub const JET_bitRetrieveFromIndex = 2;
pub const JET_bitRetrieveFromPrimaryBookmark = 4;
pub const JET_bitRetrieveTag = 8;
pub const JET_bitRetrieveNull = 16;
pub const JET_bitRetrieveIgnoreDefault = 32;
pub const JET_bitRetrieveTuple = 2048;
pub const JET_bitZeroLength = 1;
pub const JET_bitEnumerateCopy = 1;
pub const JET_bitEnumerateIgnoreDefault = 32;
pub const JET_bitEnumeratePresenceOnly = 131072;
pub const JET_bitEnumerateTaggedOnly = 262144;
pub const JET_bitEnumerateCompressOutput = 524288;
pub const JET_bitEnumerateIgnoreUserDefinedDefault = 1048576;
pub const JET_bitEnumerateInRecordOnly = 2097152;
pub const JET_bitRecordSizeInCopyBuffer = 1;
pub const JET_bitRecordSizeRunningTotal = 2;
pub const JET_bitRecordSizeLocal = 4;
pub const JET_bitTransactionReadOnly = 1;
pub const JET_bitCommitLazyFlush = 1;
pub const JET_bitWaitLastLevel0Commit = 2;
pub const JET_bitWaitAllLevel0Commit = 8;
pub const JET_bitForceNewLog = 16;
pub const JET_bitRollbackAll = 1;
pub const JET_bitIncrementalSnapshot = 1;
pub const JET_bitCopySnapshot = 2;
pub const JET_bitContinueAfterThaw = 4;
pub const JET_bitExplicitPrepare = 8;
pub const JET_bitAllDatabasesSnapshot = 1;
pub const JET_bitAbortSnapshot = 1;
pub const JET_DbInfoFilename = 0;
pub const JET_DbInfoConnect = 1;
pub const JET_DbInfoCountry = 2;
pub const JET_DbInfoLCID = 3;
pub const JET_DbInfoLangid = 3;
pub const JET_DbInfoCp = 4;
pub const JET_DbInfoCollate = 5;
pub const JET_DbInfoOptions = 6;
pub const JET_DbInfoTransactions = 7;
pub const JET_DbInfoVersion = 8;
pub const JET_DbInfoIsam = 9;
pub const JET_DbInfoFilesize = 10;
pub const JET_DbInfoSpaceOwned = 11;
pub const JET_DbInfoSpaceAvailable = 12;
pub const JET_DbInfoUpgrade = 13;
pub const JET_DbInfoMisc = 14;
pub const JET_DbInfoDBInUse = 15;
pub const JET_DbInfoPageSize = 17;
pub const JET_DbInfoFileType = 19;
pub const JET_DbInfoFilesizeOnDisk = 21;
pub const JET_dbstateJustCreated = 1;
pub const JET_dbstateDirtyShutdown = 2;
pub const JET_dbstateCleanShutdown = 3;
pub const JET_dbstateBeingConverted = 4;
pub const JET_dbstateForceDetach = 5;
pub const JET_filetypeUnknown = 0;
pub const JET_filetypeDatabase = 1;
pub const JET_filetypeLog = 3;
pub const JET_filetypeCheckpoint = 4;
pub const JET_filetypeTempDatabase = 5;
pub const JET_filetypeFlushMap = 7;
pub const JET_coltypNil = 0;
pub const JET_coltypBit = 1;
pub const JET_coltypUnsignedByte = 2;
pub const JET_coltypShort = 3;
pub const JET_coltypLong = 4;
pub const JET_coltypCurrency = 5;
pub const JET_coltypIEEESingle = 6;
pub const JET_coltypIEEEDouble = 7;
pub const JET_coltypDateTime = 8;
pub const JET_coltypBinary = 9;
pub const JET_coltypText = 10;
pub const JET_coltypLongBinary = 11;
pub const JET_coltypLongText = 12;
pub const JET_coltypMax = 13;
pub const JET_coltypSLV = 13;
pub const JET_coltypUnsignedLong = 14;
pub const JET_coltypLongLong = 15;
pub const JET_coltypGUID = 16;
pub const JET_coltypUnsignedShort = 17;
pub const JET_coltypUnsignedLongLong = 18;
pub const JET_ColInfoGrbitNonDerivedColumnsOnly = 2147483648;
pub const JET_ColInfoGrbitMinimalInfo = 1073741824;
pub const JET_ColInfoGrbitSortByColumnid = 536870912;
pub const JET_objtypNil = 0;
pub const JET_objtypTable = 1;
pub const JET_bitCompactStats = 32;
pub const JET_bitCompactRepair = 64;
pub const JET_snpRepair = 2;
pub const JET_snpCompact = 4;
pub const JET_snpRestore = 8;
pub const JET_snpBackup = 9;
pub const JET_snpUpgrade = 10;
pub const JET_snpScrub = 11;
pub const JET_snpUpgradeRecordFormat = 12;
pub const JET_sntBegin = 5;
pub const JET_sntRequirements = 7;
pub const JET_sntProgress = 0;
pub const JET_sntComplete = 6;
pub const JET_sntFail = 3;
pub const JET_ExceptionMsgBox = 1;
pub const JET_ExceptionNone = 2;
pub const JET_ExceptionFailFast = 4;
pub const JET_OnlineDefragDisable = 0;
pub const JET_OnlineDefragAllOBSOLETE = 1;
pub const JET_OnlineDefragDatabases = 2;
pub const JET_OnlineDefragSpaceTrees = 4;
pub const JET_OnlineDefragAll = 65535;
pub const JET_bitResizeDatabaseOnlyGrow = 1;
pub const JET_bitResizeDatabaseOnlyShrink = 2;
pub const JET_bitStopServiceAll = 0;
pub const JET_bitStopServiceBackgroundUserTasks = 2;
pub const JET_bitStopServiceQuiesceCaches = 4;
pub const JET_bitStopServiceResume = 2147483648;
pub const JET_errSuccess = 0;
pub const JET_wrnNyi = -1;
pub const JET_errRfsFailure = -100;
pub const JET_errRfsNotArmed = -101;
pub const JET_errFileClose = -102;
pub const JET_errOutOfThreads = -103;
pub const JET_errTooManyIO = -105;
pub const JET_errTaskDropped = -106;
pub const JET_errInternalError = -107;
pub const JET_errDisabledFunctionality = -112;
pub const JET_errUnloadableOSFunctionality = -113;
pub const JET_errDatabaseBufferDependenciesCorrupted = -255;
pub const JET_wrnRemainingVersions = 321;
pub const JET_errPreviousVersion = -322;
pub const JET_errPageBoundary = -323;
pub const JET_errKeyBoundary = -324;
pub const JET_errBadPageLink = -327;
pub const JET_errBadBookmark = -328;
pub const JET_errNTSystemCallFailed = -334;
pub const JET_errBadParentPageLink = -338;
pub const JET_errSPAvailExtCacheOutOfSync = -340;
pub const JET_errSPAvailExtCorrupted = -341;
pub const JET_errSPAvailExtCacheOutOfMemory = -342;
pub const JET_errSPOwnExtCorrupted = -343;
pub const JET_errDbTimeCorrupted = -344;
pub const JET_wrnUniqueKey = 345;
pub const JET_errKeyTruncated = -346;
pub const JET_errDatabaseLeakInSpace = -348;
pub const JET_errBadEmptyPage = -351;
pub const wrnBTNotVisibleRejected = 352;
pub const wrnBTNotVisibleAccumulated = 353;
pub const JET_errBadLineCount = -354;
pub const JET_errPageTagCorrupted = -357;
pub const JET_errNodeCorrupted = -358;
pub const JET_errBBTNodeCorrupted = -364;
pub const JET_errBBTBuffCorrupted = -365;
pub const JET_wrnSeparateLongValue = 406;
pub const JET_errKeyTooBig = -408;
pub const JET_errCannotSeparateIntrinsicLV = -416;
pub const JET_errSeparatedLongValue = -421;
pub const JET_errMustBeSeparateLongValue = -423;
pub const JET_errInvalidPreread = -424;
pub const JET_errInvalidLoggedOperation = -500;
pub const JET_errLogFileCorrupt = -501;
pub const JET_errNoBackupDirectory = -503;
pub const JET_errBackupDirectoryNotEmpty = -504;
pub const JET_errBackupInProgress = -505;
pub const JET_errRestoreInProgress = -506;
pub const JET_errMissingPreviousLogFile = -509;
pub const JET_errLogWriteFail = -510;
pub const JET_errLogDisabledDueToRecoveryFailure = -511;
pub const JET_errCannotLogDuringRecoveryRedo = -512;
pub const JET_errLogGenerationMismatch = -513;
pub const JET_errBadLogVersion = -514;
pub const JET_errInvalidLogSequence = -515;
pub const JET_errLoggingDisabled = -516;
pub const JET_errLogBufferTooSmall = -517;
pub const JET_errLogSequenceEnd = -519;
pub const JET_errNoBackup = -520;
pub const JET_errInvalidBackupSequence = -521;
pub const JET_errBackupNotAllowedYet = -523;
pub const JET_errDeleteBackupFileFail = -524;
pub const JET_errMakeBackupDirectoryFail = -525;
pub const JET_errInvalidBackup = -526;
pub const JET_errRecoveredWithErrors = -527;
pub const JET_errMissingLogFile = -528;
pub const JET_errLogDiskFull = -529;
pub const JET_errBadLogSignature = -530;
pub const JET_errBadDbSignature = -531;
pub const JET_errBadCheckpointSignature = -532;
pub const JET_errCheckpointCorrupt = -533;
pub const JET_errMissingPatchPage = -534;
pub const JET_errBadPatchPage = -535;
pub const JET_errRedoAbruptEnded = -536;
pub const JET_errPatchFileMissing = -538;
pub const JET_errDatabaseLogSetMismatch = -539;
pub const JET_errDatabaseStreamingFileMismatch = -540;
pub const JET_errLogFileSizeMismatch = -541;
pub const JET_errCheckpointFileNotFound = -542;
pub const JET_errRequiredLogFilesMissing = -543;
pub const JET_errSoftRecoveryOnBackupDatabase = -544;
pub const JET_errLogFileSizeMismatchDatabasesConsistent = -545;
pub const JET_errLogSectorSizeMismatch = -546;
pub const JET_errLogSectorSizeMismatchDatabasesConsistent = -547;
pub const JET_errLogSequenceEndDatabasesConsistent = -548;
pub const JET_errStreamingDataNotLogged = -549;
pub const JET_errDatabaseDirtyShutdown = -550;
pub const JET_errDatabaseInconsistent = -550;
pub const JET_errConsistentTimeMismatch = -551;
pub const JET_errDatabasePatchFileMismatch = -552;
pub const JET_errEndingRestoreLogTooLow = -553;
pub const JET_errStartingRestoreLogTooHigh = -554;
pub const JET_errGivenLogFileHasBadSignature = -555;
pub const JET_errGivenLogFileIsNotContiguous = -556;
pub const JET_errMissingRestoreLogFiles = -557;
pub const JET_wrnExistingLogFileHasBadSignature = 558;
pub const JET_wrnExistingLogFileIsNotContiguous = 559;
pub const JET_errMissingFullBackup = -560;
pub const JET_errBadBackupDatabaseSize = -561;
pub const JET_errDatabaseAlreadyUpgraded = -562;
pub const JET_errDatabaseIncompleteUpgrade = -563;
pub const JET_wrnSkipThisRecord = 564;
pub const JET_errMissingCurrentLogFiles = -565;
pub const JET_errDbTimeTooOld = -566;
pub const JET_errDbTimeTooNew = -567;
pub const JET_errMissingFileToBackup = -569;
pub const JET_errLogTornWriteDuringHardRestore = -570;
pub const JET_errLogTornWriteDuringHardRecovery = -571;
pub const JET_errLogCorruptDuringHardRestore = -573;
pub const JET_errLogCorruptDuringHardRecovery = -574;
pub const JET_errMustDisableLoggingForDbUpgrade = -575;
pub const JET_errBadRestoreTargetInstance = -577;
pub const JET_wrnTargetInstanceRunning = 578;
pub const JET_errRecoveredWithoutUndo = -579;
pub const JET_errDatabasesNotFromSameSnapshot = -580;
pub const JET_errSoftRecoveryOnSnapshot = -581;
pub const JET_errCommittedLogFilesMissing = -582;
pub const JET_errSectorSizeNotSupported = -583;
pub const JET_errRecoveredWithoutUndoDatabasesConsistent = -584;
pub const JET_wrnCommittedLogFilesLost = 585;
pub const JET_errCommittedLogFileCorrupt = -586;
pub const JET_wrnCommittedLogFilesRemoved = 587;
pub const JET_wrnFinishWithUndo = 588;
pub const JET_errLogSequenceChecksumMismatch = -590;
pub const JET_wrnDatabaseRepaired = 595;
pub const JET_errPageInitializedMismatch = -596;
pub const JET_errUnicodeTranslationBufferTooSmall = -601;
pub const JET_errUnicodeTranslationFail = -602;
pub const JET_errUnicodeNormalizationNotSupported = -603;
pub const JET_errUnicodeLanguageValidationFailure = -604;
pub const JET_errExistingLogFileHasBadSignature = -610;
pub const JET_errExistingLogFileIsNotContiguous = -611;
pub const JET_errLogReadVerifyFailure = -612;
pub const JET_errCheckpointDepthTooDeep = -614;
pub const JET_errRestoreOfNonBackupDatabase = -615;
pub const JET_errLogFileNotCopied = -616;
pub const JET_errTransactionTooLong = -618;
pub const JET_errEngineFormatVersionNoLongerSupportedTooLow = -619;
pub const JET_errEngineFormatVersionNotYetImplementedTooHigh = -620;
pub const JET_errEngineFormatVersionParamTooLowForRequestedFeature = -621;
pub const JET_errEngineFormatVersionSpecifiedTooLowForLogVersion = -622;
pub const JET_errEngineFormatVersionSpecifiedTooLowForDatabaseVersion = -623;
pub const JET_errDbTimeBeyondMaxRequired = -625;
pub const JET_errLogOperationInconsistentWithDatabase = -626;
pub const JET_errInsertKeyOutOfOrder = -627;
pub const JET_errBackupAbortByServer = -801;
pub const JET_errInvalidGrbit = -900;
pub const JET_errTermInProgress = -1000;
pub const JET_errFeatureNotAvailable = -1001;
pub const JET_errInvalidName = -1002;
pub const JET_errInvalidParameter = -1003;
pub const JET_wrnColumnNull = 1004;
pub const JET_wrnBufferTruncated = 1006;
pub const JET_wrnDatabaseAttached = 1007;
pub const JET_errDatabaseFileReadOnly = -1008;
pub const JET_wrnSortOverflow = 1009;
pub const JET_errInvalidDatabaseId = -1010;
pub const JET_errOutOfMemory = -1011;
pub const JET_errOutOfDatabaseSpace = -1012;
pub const JET_errOutOfCursors = -1013;
pub const JET_errOutOfBuffers = -1014;
pub const JET_errTooManyIndexes = -1015;
pub const JET_errTooManyKeys = -1016;
pub const JET_errRecordDeleted = -1017;
pub const JET_errReadVerifyFailure = -1018;
pub const JET_errPageNotInitialized = -1019;
pub const JET_errOutOfFileHandles = -1020;
pub const JET_errDiskReadVerificationFailure = -1021;
pub const JET_errDiskIO = -1022;
pub const JET_errInvalidPath = -1023;
pub const JET_errInvalidSystemPath = -1024;
pub const JET_errInvalidLogDirectory = -1025;
pub const JET_errRecordTooBig = -1026;
pub const JET_errTooManyOpenDatabases = -1027;
pub const JET_errInvalidDatabase = -1028;
pub const JET_errNotInitialized = -1029;
pub const JET_errAlreadyInitialized = -1030;
pub const JET_errInitInProgress = -1031;
pub const JET_errFileAccessDenied = -1032;
pub const JET_errBufferTooSmall = -1038;
pub const JET_wrnSeekNotEqual = 1039;
pub const JET_errTooManyColumns = -1040;
pub const JET_errContainerNotEmpty = -1043;
pub const JET_errInvalidFilename = -1044;
pub const JET_errInvalidBookmark = -1045;
pub const JET_errColumnInUse = -1046;
pub const JET_errInvalidBufferSize = -1047;
pub const JET_errColumnNotUpdatable = -1048;
pub const JET_errIndexInUse = -1051;
pub const JET_errLinkNotSupported = -1052;
pub const JET_errNullKeyDisallowed = -1053;
pub const JET_errNotInTransaction = -1054;
pub const JET_wrnNoErrorInfo = 1055;
pub const JET_errMustRollback = -1057;
pub const JET_wrnNoIdleActivity = 1058;
pub const JET_errTooManyActiveUsers = -1059;
pub const JET_errInvalidCountry = -1061;
pub const JET_errInvalidLanguageId = -1062;
pub const JET_errInvalidCodePage = -1063;
pub const JET_errInvalidLCMapStringFlags = -1064;
pub const JET_errVersionStoreEntryTooBig = -1065;
pub const JET_errVersionStoreOutOfMemoryAndCleanupTimedOut = -1066;
pub const JET_wrnNoWriteLock = 1067;
pub const JET_wrnColumnSetNull = 1068;
pub const JET_errVersionStoreOutOfMemory = -1069;
pub const JET_errCannotIndex = -1071;
pub const JET_errRecordNotDeleted = -1072;
pub const JET_errTooManyMempoolEntries = -1073;
pub const JET_errOutOfObjectIDs = -1074;
pub const JET_errOutOfLongValueIDs = -1075;
pub const JET_errOutOfAutoincrementValues = -1076;
pub const JET_errOutOfDbtimeValues = -1077;
pub const JET_errOutOfSequentialIndexValues = -1078;
pub const JET_errRunningInOneInstanceMode = -1080;
pub const JET_errRunningInMultiInstanceMode = -1081;
pub const JET_errSystemParamsAlreadySet = -1082;
pub const JET_errSystemPathInUse = -1083;
pub const JET_errLogFilePathInUse = -1084;
pub const JET_errTempPathInUse = -1085;
pub const JET_errInstanceNameInUse = -1086;
pub const JET_errSystemParameterConflict = -1087;
pub const JET_errInstanceUnavailable = -1090;
pub const JET_errDatabaseUnavailable = -1091;
pub const JET_errInstanceUnavailableDueToFatalLogDiskFull = -1092;
pub const JET_errInvalidSesparamId = -1093;
pub const JET_errTooManyRecords = -1094;
pub const JET_errInvalidDbparamId = -1095;
pub const JET_errOutOfSessions = -1101;
pub const JET_errWriteConflict = -1102;
pub const JET_errTransTooDeep = -1103;
pub const JET_errInvalidSesid = -1104;
pub const JET_errWriteConflictPrimaryIndex = -1105;
pub const JET_errInTransaction = -1108;
pub const JET_errRollbackRequired = -1109;
pub const JET_errTransReadOnly = -1110;
pub const JET_errSessionWriteConflict = -1111;
pub const JET_errRecordTooBigForBackwardCompatibility = -1112;
pub const JET_errCannotMaterializeForwardOnlySort = -1113;
pub const JET_errSesidTableIdMismatch = -1114;
pub const JET_errInvalidInstance = -1115;
pub const JET_errDirtyShutdown = -1116;
pub const JET_errReadPgnoVerifyFailure = -1118;
pub const JET_errReadLostFlushVerifyFailure = -1119;
pub const JET_errFileSystemCorruption = -1121;
pub const JET_wrnShrinkNotPossible = 1122;
pub const JET_errRecoveryVerifyFailure = -1123;
pub const JET_errFilteredMoveNotSupported = -1124;
pub const JET_errDatabaseDuplicate = -1201;
pub const JET_errDatabaseInUse = -1202;
pub const JET_errDatabaseNotFound = -1203;
pub const JET_errDatabaseInvalidName = -1204;
pub const JET_errDatabaseInvalidPages = -1205;
pub const JET_errDatabaseCorrupted = -1206;
pub const JET_errDatabaseLocked = -1207;
pub const JET_errCannotDisableVersioning = -1208;
pub const JET_errInvalidDatabaseVersion = -1209;
pub const JET_errDatabase200Format = -1210;
pub const JET_errDatabase400Format = -1211;
pub const JET_errDatabase500Format = -1212;
pub const JET_errPageSizeMismatch = -1213;
pub const JET_errTooManyInstances = -1214;
pub const JET_errDatabaseSharingViolation = -1215;
pub const JET_errAttachedDatabaseMismatch = -1216;
pub const JET_errDatabaseInvalidPath = -1217;
pub const JET_errDatabaseIdInUse = -1218;
pub const JET_errForceDetachNotAllowed = -1219;
pub const JET_errCatalogCorrupted = -1220;
pub const JET_errPartiallyAttachedDB = -1221;
pub const JET_errDatabaseSignInUse = -1222;
pub const JET_errDatabaseCorruptedNoRepair = -1224;
pub const JET_errInvalidCreateDbVersion = -1225;
pub const JET_errDatabaseNotReady = -1230;
pub const JET_errDatabaseAttachedForRecovery = -1231;
pub const JET_errTransactionsNotReadyDuringRecovery = -1232;
pub const JET_wrnTableEmpty = 1301;
pub const JET_errTableLocked = -1302;
pub const JET_errTableDuplicate = -1303;
pub const JET_errTableInUse = -1304;
pub const JET_errObjectNotFound = -1305;
pub const JET_errDensityInvalid = -1307;
pub const JET_errTableNotEmpty = -1308;
pub const JET_errInvalidTableId = -1310;
pub const JET_errTooManyOpenTables = -1311;
pub const JET_errIllegalOperation = -1312;
pub const JET_errTooManyOpenTablesAndCleanupTimedOut = -1313;
pub const JET_errObjectDuplicate = -1314;
pub const JET_errInvalidObject = -1316;
pub const JET_errCannotDeleteTempTable = -1317;
pub const JET_errCannotDeleteSystemTable = -1318;
pub const JET_errCannotDeleteTemplateTable = -1319;
pub const JET_errExclusiveTableLockRequired = -1322;
pub const JET_errFixedDDL = -1323;
pub const JET_errFixedInheritedDDL = -1324;
pub const JET_errCannotNestDDL = -1325;
pub const JET_errDDLNotInheritable = -1326;
pub const JET_wrnTableInUseBySystem = 1327;
pub const JET_errInvalidSettings = -1328;
pub const JET_errClientRequestToStopJetService = -1329;
pub const JET_errCannotAddFixedVarColumnToDerivedTable = -1330;
pub const JET_errIndexCantBuild = -1401;
pub const JET_errIndexHasPrimary = -1402;
pub const JET_errIndexDuplicate = -1403;
pub const JET_errIndexNotFound = -1404;
pub const JET_errIndexMustStay = -1405;
pub const JET_errIndexInvalidDef = -1406;
pub const JET_errInvalidCreateIndex = -1409;
pub const JET_errTooManyOpenIndexes = -1410;
pub const JET_errMultiValuedIndexViolation = -1411;
pub const JET_errIndexBuildCorrupted = -1412;
pub const JET_errPrimaryIndexCorrupted = -1413;
pub const JET_errSecondaryIndexCorrupted = -1414;
pub const JET_wrnCorruptIndexDeleted = 1415;
pub const JET_errInvalidIndexId = -1416;
pub const JET_wrnPrimaryIndexOutOfDate = 1417;
pub const JET_wrnSecondaryIndexOutOfDate = 1418;
pub const JET_errIndexTuplesSecondaryIndexOnly = -1430;
pub const JET_errIndexTuplesTooManyColumns = -1431;
pub const JET_errIndexTuplesOneColumnOnly = -1431;
pub const JET_errIndexTuplesNonUniqueOnly = -1432;
pub const JET_errIndexTuplesTextBinaryColumnsOnly = -1433;
pub const JET_errIndexTuplesTextColumnsOnly = -1433;
pub const JET_errIndexTuplesVarSegMacNotAllowed = -1434;
pub const JET_errIndexTuplesInvalidLimits = -1435;
pub const JET_errIndexTuplesCannotRetrieveFromIndex = -1436;
pub const JET_errIndexTuplesKeyTooSmall = -1437;
pub const JET_errInvalidLVChunkSize = -1438;
pub const JET_errColumnCannotBeEncrypted = -1439;
pub const JET_errCannotIndexOnEncryptedColumn = -1440;
pub const JET_errColumnLong = -1501;
pub const JET_errColumnNoChunk = -1502;
pub const JET_errColumnDoesNotFit = -1503;
pub const JET_errNullInvalid = -1504;
pub const JET_errColumnIndexed = -1505;
pub const JET_errColumnTooBig = -1506;
pub const JET_errColumnNotFound = -1507;
pub const JET_errColumnDuplicate = -1508;
pub const JET_errMultiValuedColumnMustBeTagged = -1509;
pub const JET_errColumnRedundant = -1510;
pub const JET_errInvalidColumnType = -1511;
pub const JET_wrnColumnMaxTruncated = 1512;
pub const JET_errTaggedNotNULL = -1514;
pub const JET_errNoCurrentIndex = -1515;
pub const JET_errKeyIsMade = -1516;
pub const JET_errBadColumnId = -1517;
pub const JET_errBadItagSequence = -1518;
pub const JET_errColumnInRelationship = -1519;
pub const JET_wrnCopyLongValue = 1520;
pub const JET_errCannotBeTagged = -1521;
pub const JET_errDefaultValueTooBig = -1524;
pub const JET_errMultiValuedDuplicate = -1525;
pub const JET_errLVCorrupted = -1526;
pub const JET_errMultiValuedDuplicateAfterTruncation = -1528;
pub const JET_errDerivedColumnCorruption = -1529;
pub const JET_errInvalidPlaceholderColumn = -1530;
pub const JET_wrnColumnSkipped = 1531;
pub const JET_wrnColumnNotLocal = 1532;
pub const JET_wrnColumnMoreTags = 1533;
pub const JET_wrnColumnTruncated = 1534;
pub const JET_wrnColumnPresent = 1535;
pub const JET_wrnColumnSingleValue = 1536;
pub const JET_wrnColumnDefault = 1537;
pub const JET_errColumnCannotBeCompressed = -1538;
pub const JET_wrnColumnNotInRecord = 1539;
pub const JET_errColumnNoEncryptionKey = -1540;
pub const JET_wrnColumnReference = 1541;
pub const JET_errRecordNotFound = -1601;
pub const JET_errRecordNoCopy = -1602;
pub const JET_errNoCurrentRecord = -1603;
pub const JET_errRecordPrimaryChanged = -1604;
pub const JET_errKeyDuplicate = -1605;
pub const JET_errAlreadyPrepared = -1607;
pub const JET_errKeyNotMade = -1608;
pub const JET_errUpdateNotPrepared = -1609;
pub const JET_wrnDataHasChanged = 1610;
pub const JET_errDataHasChanged = -1611;
pub const JET_wrnKeyChanged = 1618;
pub const JET_errLanguageNotSupported = -1619;
pub const JET_errDecompressionFailed = -1620;
pub const JET_errUpdateMustVersion = -1621;
pub const JET_errDecryptionFailed = -1622;
pub const JET_errEncryptionBadItag = -1623;
pub const JET_errSetAutoIncrementTooHigh = -1624;
pub const JET_errAutoIncrementNotSet = -1625;
pub const JET_errTooManySorts = -1701;
pub const JET_errInvalidOnSort = -1702;
pub const JET_errTempFileOpenError = -1803;
pub const JET_errTooManyAttachedDatabases = -1805;
pub const JET_errDiskFull = -1808;
pub const JET_errPermissionDenied = -1809;
pub const JET_errFileNotFound = -1811;
pub const JET_errFileInvalidType = -1812;
pub const JET_wrnFileOpenReadOnly = 1813;
pub const JET_errFileAlreadyExists = -1814;
pub const JET_errAfterInitialization = -1850;
pub const JET_errLogCorrupted = -1852;
pub const JET_errInvalidOperation = -1906;
pub const JET_errAccessDenied = -1907;
pub const JET_wrnIdleFull = 1908;
pub const JET_errTooManySplits = -1909;
pub const JET_errSessionSharingViolation = -1910;
pub const JET_errEntryPointNotFound = -1911;
pub const JET_errSessionContextAlreadySet = -1912;
pub const JET_errSessionContextNotSetByThisThread = -1913;
pub const JET_errSessionInUse = -1914;
pub const JET_errRecordFormatConversionFailed = -1915;
pub const JET_errOneDatabasePerSession = -1916;
pub const JET_errRollbackError = -1917;
pub const JET_errFlushMapVersionUnsupported = -1918;
pub const JET_errFlushMapDatabaseMismatch = -1919;
pub const JET_errFlushMapUnrecoverable = -1920;
pub const JET_wrnDefragAlreadyRunning = 2000;
pub const JET_wrnDefragNotRunning = 2001;
pub const JET_errDatabaseAlreadyRunningMaintenance = -2004;
pub const JET_wrnCallbackNotRegistered = 2100;
pub const JET_errCallbackFailed = -2101;
pub const JET_errCallbackNotResolved = -2102;
pub const JET_errSpaceHintsInvalid = -2103;
pub const JET_errOSSnapshotInvalidSequence = -2401;
pub const JET_errOSSnapshotTimeOut = -2402;
pub const JET_errOSSnapshotNotAllowed = -2403;
pub const JET_errOSSnapshotInvalidSnapId = -2404;
pub const JET_errLSCallbackNotSpecified = -3000;
pub const JET_errLSAlreadySet = -3001;
pub const JET_errLSNotSet = -3002;
pub const JET_errFileIOSparse = -4000;
pub const JET_errFileIOBeyondEOF = -4001;
pub const JET_errFileIOAbort = -4002;
pub const JET_errFileIORetry = -4003;
pub const JET_errFileIOFail = -4004;
pub const JET_errFileCompressed = -4005;
pub const JET_errClientSpaceBegin = -10000;
pub const JET_errClientSpaceEnd = -11999;
pub const JET_BASE_NAME_LENGTH = 3;
pub const JET_bitDumpMinimum = 1;
pub const JET_bitDumpMaximum = 2;
pub const JET_bitDumpCacheMinimum = 4;
pub const JET_bitDumpCacheMaximum = 8;
pub const JET_bitDumpCacheIncludeDirtyPages = 16;
pub const JET_bitDumpCacheIncludeCachedPages = 32;
pub const JET_bitDumpCacheIncludeCorruptedPages = 64;
pub const JET_bitDumpCacheNoDecommit = 128;
pub const JET_relopEquals = 0;
pub const JET_relopPrefixEquals = 1;
pub const JET_relopNotEquals = 2;
pub const JET_relopLessThanOrEqual = 3;
pub const JET_relopLessThan = 4;
pub const JET_relopGreaterThanOrEqual = 5;
pub const JET_relopGreaterThan = 6;
pub const JET_relopBitmaskEqualsZero = 7;
pub const JET_relopBitmaskNotEqualsZero = 8;
pub const JET_errcatUnknown = 0;
pub const JET_errcatError = 1;
pub const JET_errcatOperation = 2;
pub const JET_errcatFatal = 3;
pub const JET_errcatIO = 4;
pub const JET_errcatResource = 5;
pub const JET_errcatMemory = 6;
pub const JET_errcatQuota = 7;
pub const JET_errcatDisk = 8;
pub const JET_errcatData = 9;
pub const JET_errcatCorruption = 10;
pub const JET_errcatInconsistent = 11;
pub const JET_errcatFragmentation = 12;
pub const JET_errcatApi = 13;
pub const JET_errcatUsage = 14;
pub const JET_errcatState = 15;
pub const JET_errcatObsolete = 16;
pub const JET_errcatMax = 17;
pub const JET_IndexCheckingOff = 0;
pub const JET_IndexCheckingOn = 1;
pub const JET_IndexCheckingDeferToOpenTable = 2;
pub const JET_IndexCheckingMax = 3;

pub const aliases = struct {
    pub const JET_RELOP = i32;
    pub const JET_ERRCAT = i32;
    pub const JET_INDEXCHECKING = i32;
    pub const JET_INSTANCE = usize;
    pub const JET_SESID = usize;
    pub const JET_OSSNAPID = usize;
    pub const JET_LS = usize;
};
