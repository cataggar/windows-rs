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
    .{ "ldap_openW", MethodRecord{ .library = "WLDAP32", .import = "ldap_openW", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x05\x09" } },
    .{ "ldap_openA", MethodRecord{ .library = "WLDAP32", .import = "ldap_openA", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x3d\x09" } },
    .{ "ldap_initW", MethodRecord{ .library = "WLDAP32", .import = "ldap_initW", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x05\x09" } },
    .{ "ldap_initA", MethodRecord{ .library = "WLDAP32", .import = "ldap_initA", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x3d\x09" } },
    .{ "ldap_sslinitW", MethodRecord{ .library = "WLDAP32", .import = "ldap_sslinitW", .signature = "\x00\x03\x0f\x11\xb2\x31\x11\x05\x09\x08" } },
    .{ "ldap_sslinitA", MethodRecord{ .library = "WLDAP32", .import = "ldap_sslinitA", .signature = "\x00\x03\x0f\x11\xb2\x31\x11\x3d\x09\x08" } },
    .{ "ldap_connect", MethodRecord{ .library = "WLDAP32", .import = "ldap_connect", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x35" } },
    .{ "ldap_open", MethodRecord{ .library = "WLDAP32", .import = "ldap_open", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x3d\x09" } },
    .{ "ldap_init", MethodRecord{ .library = "WLDAP32", .import = "ldap_init", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x3d\x09" } },
    .{ "ldap_sslinit", MethodRecord{ .library = "WLDAP32", .import = "ldap_sslinit", .signature = "\x00\x03\x0f\x11\xb2\x31\x11\x3d\x09\x08" } },
    .{ "cldap_openW", MethodRecord{ .library = "WLDAP32", .import = "cldap_openW", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x05\x09" } },
    .{ "cldap_openA", MethodRecord{ .library = "WLDAP32", .import = "cldap_openA", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x3d\x09" } },
    .{ "cldap_open", MethodRecord{ .library = "WLDAP32", .import = "cldap_open", .signature = "\x00\x02\x0f\x11\xb2\x31\x11\x3d\x09" } },
    .{ "ldap_unbind", MethodRecord{ .library = "WLDAP32", .import = "ldap_unbind", .signature = "\x00\x01\x09\x0f\x11\xb2\x31" } },
    .{ "ldap_unbind_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_unbind_s", .signature = "\x00\x01\x09\x0f\x11\xb2\x31" } },
    .{ "ldap_get_option", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_option", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x08\x0f\x01" } },
    .{ "ldap_get_optionW", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_optionW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x08\x0f\x01" } },
    .{ "ldap_set_option", MethodRecord{ .library = "WLDAP32", .import = "ldap_set_option", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x08\x0f\x01" } },
    .{ "ldap_set_optionW", MethodRecord{ .library = "WLDAP32", .import = "ldap_set_optionW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x08\x0f\x01" } },
    .{ "ldap_simple_bindW", MethodRecord{ .library = "WLDAP32", .import = "ldap_simple_bindW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x11\x05" } },
    .{ "ldap_simple_bindA", MethodRecord{ .library = "WLDAP32", .import = "ldap_simple_bindA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_simple_bind_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_simple_bind_sW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x11\x05" } },
    .{ "ldap_simple_bind_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_simple_bind_sA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_bindW", MethodRecord{ .library = "WLDAP32", .import = "ldap_bindW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x09" } },
    .{ "ldap_bindA", MethodRecord{ .library = "WLDAP32", .import = "ldap_bindA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x09" } },
    .{ "ldap_bind_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_bind_sW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x09" } },
    .{ "ldap_bind_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_bind_sA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x09" } },
    .{ "ldap_sasl_bindA", MethodRecord{ .library = "WLDAP32", .import = "ldap_sasl_bindA", .signature = "\x00\x07\x08\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x08" } },
    .{ "ldap_sasl_bindW", MethodRecord{ .library = "WLDAP32", .import = "ldap_sasl_bindW", .signature = "\x00\x07\x08\x0f\x11\xb2\x31\x11\x05\x11\x05\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x08" } },
    .{ "ldap_sasl_bind_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_sasl_bind_sA", .signature = "\x00\x07\x08\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_sasl_bind_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_sasl_bind_sW", .signature = "\x00\x07\x08\x0f\x11\xb2\x31\x11\x05\x11\x05\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_simple_bind", MethodRecord{ .library = "WLDAP32", .import = "ldap_simple_bind", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_simple_bind_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_simple_bind_s", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_bind", MethodRecord{ .library = "WLDAP32", .import = "ldap_bind", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x09" } },
    .{ "ldap_bind_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_bind_s", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x09" } },
    .{ "ldap_searchW", MethodRecord{ .library = "WLDAP32", .import = "ldap_searchW", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x05\x09\x11\x05\x0f\x0f\x07\x09" } },
    .{ "ldap_searchA", MethodRecord{ .library = "WLDAP32", .import = "ldap_searchA", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09" } },
    .{ "ldap_search_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_sW", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x05\x09\x11\x05\x0f\x0f\x07\x09\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_sA", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search_stW", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_stW", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x05\x09\x11\x05\x0f\x0f\x07\x09\x0f\x11\xb2\x35\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search_stA", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_stA", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x11\xb2\x35\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search_extW", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_extW", .signature = "\x00\x0b\x09\x0f\x11\xb2\x31\x11\x05\x09\x11\x05\x0f\x0f\x07\x09\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x09\x09\x0f\x09" } },
    .{ "ldap_search_extA", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_extA", .signature = "\x00\x0b\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x09\x09\x0f\x09" } },
    .{ "ldap_search_ext_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_ext_sW", .signature = "\x00\x0b\x09\x0f\x11\xb2\x31\x11\x05\x09\x11\x05\x0f\x0f\x07\x09\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x11\xb2\x35\x09\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search_ext_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_ext_sA", .signature = "\x00\x0b\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x11\xb2\x35\x09\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search", MethodRecord{ .library = "WLDAP32", .import = "ldap_search", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09" } },
    .{ "ldap_search_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_s", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search_st", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_st", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x11\xb2\x35\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_search_ext", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_ext", .signature = "\x00\x0b\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x09\x09\x0f\x09" } },
    .{ "ldap_search_ext_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_ext_s", .signature = "\x00\x0b\x09\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x11\xb2\x35\x09\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_check_filterW", MethodRecord{ .library = "WLDAP32", .import = "ldap_check_filterW", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x05" } },
    .{ "ldap_check_filterA", MethodRecord{ .library = "WLDAP32", .import = "ldap_check_filterA", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x3d" } },
    .{ "ldap_modifyW", MethodRecord{ .library = "WLDAP32", .import = "ldap_modifyW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49" } },
    .{ "ldap_modifyA", MethodRecord{ .library = "WLDAP32", .import = "ldap_modifyA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_modify_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_sW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49" } },
    .{ "ldap_modify_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_sA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_modify_extW", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_extW", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x09" } },
    .{ "ldap_modify_extA", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_extA", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_modify_ext_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_ext_sW", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_modify_ext_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_ext_sA", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_modify", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_modify_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_s", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_modify_ext", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_ext", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_modify_ext_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_modify_ext_s", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_modrdn2W", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn2W", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x08" } },
    .{ "ldap_modrdn2A", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn2A", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x08" } },
    .{ "ldap_modrdnW", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdnW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x11\x05" } },
    .{ "ldap_modrdnA", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdnA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_modrdn2_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn2_sW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x08" } },
    .{ "ldap_modrdn2_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn2_sA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x08" } },
    .{ "ldap_modrdn_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn_sW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x11\x05" } },
    .{ "ldap_modrdn_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn_sA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_modrdn2", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn2", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x08" } },
    .{ "ldap_modrdn", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_modrdn2_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn2_s", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x08" } },
    .{ "ldap_modrdn_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_modrdn_s", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d" } },
    .{ "ldap_rename_extW", MethodRecord{ .library = "WLDAP32", .import = "ldap_rename_extW", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x11\x05\x08\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x09" } },
    .{ "ldap_rename_extA", MethodRecord{ .library = "WLDAP32", .import = "ldap_rename_extA", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x08\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_rename_ext_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_rename_ext_sW", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x11\x05\x08\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_rename_ext_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_rename_ext_sA", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x08\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_rename_ext", MethodRecord{ .library = "WLDAP32", .import = "ldap_rename_ext", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x08\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_rename_ext_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_rename_ext_s", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x08\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_addW", MethodRecord{ .library = "WLDAP32", .import = "ldap_addW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49" } },
    .{ "ldap_addA", MethodRecord{ .library = "WLDAP32", .import = "ldap_addA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_add_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_sW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49" } },
    .{ "ldap_add_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_sA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_add_extW", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_extW", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x09" } },
    .{ "ldap_add_extA", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_extA", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_add_ext_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_ext_sW", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x49\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_add_ext_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_ext_sA", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_add", MethodRecord{ .library = "WLDAP32", .import = "ldap_add", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_add_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_s", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d" } },
    .{ "ldap_add_ext", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_ext", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_add_ext_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_add_ext_s", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x4d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_compareW", MethodRecord{ .library = "WLDAP32", .import = "ldap_compareW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x11\x05" } },
    .{ "ldap_compareA", MethodRecord{ .library = "WLDAP32", .import = "ldap_compareA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "ldap_compare_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_sW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x11\x05" } },
    .{ "ldap_compare_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_sA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "ldap_compare", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "ldap_compare_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_s", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "ldap_compare_extW", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_extW", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x11\x05\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x09" } },
    .{ "ldap_compare_extA", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_extA", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_compare_ext_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_ext_sW", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x05\x11\x05\x11\x05\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_compare_ext_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_ext_sA", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_compare_ext", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_ext", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_compare_ext_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_compare_ext_s", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x3d\x11\x3d\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_deleteW", MethodRecord{ .library = "WLDAP32", .import = "ldap_deleteW", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x05" } },
    .{ "ldap_deleteA", MethodRecord{ .library = "WLDAP32", .import = "ldap_deleteA", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x3d" } },
    .{ "ldap_delete_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_sW", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x05" } },
    .{ "ldap_delete_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_sA", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x3d" } },
    .{ "ldap_delete_extW", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_extW", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x09" } },
    .{ "ldap_delete_extA", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_extA", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_delete_ext_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_ext_sW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x05\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_delete_ext_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_ext_sA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_delete", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x3d" } },
    .{ "ldap_delete_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_s", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\x3d" } },
    .{ "ldap_delete_ext", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_ext", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_delete_ext_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_delete_ext_s", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_abandon", MethodRecord{ .library = "WLDAP32", .import = "ldap_abandon", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x09" } },
    .{ "ldap_result", MethodRecord{ .library = "WLDAP32", .import = "ldap_result", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x09\x09\x0f\x11\xb2\x35\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_msgfree", MethodRecord{ .library = "WLDAP32", .import = "ldap_msgfree", .signature = "\x00\x01\x09\x0f\x11\xb2\x45" } },
    .{ "ldap_result2error", MethodRecord{ .library = "WLDAP32", .import = "ldap_result2error", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x09" } },
    .{ "ldap_parse_resultW", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_resultW", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x09\x0f\x11\x05\x0f\x11\x05\x0f\x0f\x0f\x07\x0f\x0f\x0f\x11\xb2\x41\x11\x87\x79" } },
    .{ "ldap_parse_resultA", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_resultA", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x09\x0f\x11\x3d\x0f\x11\x3d\x0f\x0f\x0f\x04\x0f\x0f\x0f\x11\xb2\x3d\x11\x87\x79" } },
    .{ "ldap_parse_extended_resultA", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_extended_resultA", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x11\x3d\x0f\x0f\x11\xb2\x39\x11\x87\x79" } },
    .{ "ldap_parse_extended_resultW", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_extended_resultW", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x11\x05\x0f\x0f\x11\xb2\x39\x11\x87\x79" } },
    .{ "ldap_controls_freeA", MethodRecord{ .library = "WLDAP32", .import = "ldap_controls_freeA", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_control_freeA", MethodRecord{ .library = "WLDAP32", .import = "ldap_control_freeA", .signature = "\x00\x01\x09\x0f\x11\xb2\x3d" } },
    .{ "ldap_controls_freeW", MethodRecord{ .library = "WLDAP32", .import = "ldap_controls_freeW", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_control_freeW", MethodRecord{ .library = "WLDAP32", .import = "ldap_control_freeW", .signature = "\x00\x01\x09\x0f\x11\xb2\x41" } },
    .{ "ldap_free_controlsW", MethodRecord{ .library = "WLDAP32", .import = "ldap_free_controlsW", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_free_controlsA", MethodRecord{ .library = "WLDAP32", .import = "ldap_free_controlsA", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_parse_result", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_result", .signature = "\x00\x08\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x09\x0f\x11\x3d\x0f\x11\x3d\x0f\x0f\x11\x3d\x0f\x0f\x0f\x11\xb2\x3d\x11\x87\x79" } },
    .{ "ldap_controls_free", MethodRecord{ .library = "WLDAP32", .import = "ldap_controls_free", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_control_free", MethodRecord{ .library = "WLDAP32", .import = "ldap_control_free", .signature = "\x00\x01\x09\x0f\x11\xb2\x3d" } },
    .{ "ldap_free_controls", MethodRecord{ .library = "WLDAP32", .import = "ldap_free_controls", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_err2stringW", MethodRecord{ .library = "WLDAP32", .import = "ldap_err2stringW", .signature = "\x00\x01\x11\x05\x09" } },
    .{ "ldap_err2stringA", MethodRecord{ .library = "WLDAP32", .import = "ldap_err2stringA", .signature = "\x00\x01\x11\x3d\x09" } },
    .{ "ldap_err2string", MethodRecord{ .library = "WLDAP32", .import = "ldap_err2string", .signature = "\x00\x01\x11\x3d\x09" } },
    .{ "ldap_perror", MethodRecord{ .library = "WLDAP32", .import = "ldap_perror", .signature = "\x00\x02\x01\x0f\x11\xb2\x31\x11\x3d" } },
    .{ "ldap_first_entry", MethodRecord{ .library = "WLDAP32", .import = "ldap_first_entry", .signature = "\x00\x02\x0f\x11\xb2\x45\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_next_entry", MethodRecord{ .library = "WLDAP32", .import = "ldap_next_entry", .signature = "\x00\x02\x0f\x11\xb2\x45\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_count_entries", MethodRecord{ .library = "WLDAP32", .import = "ldap_count_entries", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_first_attributeW", MethodRecord{ .library = "WLDAP32", .import = "ldap_first_attributeW", .signature = "\x00\x03\x11\x05\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x0f\x11\xb2\x51" } },
    .{ "ldap_first_attributeA", MethodRecord{ .library = "WLDAP32", .import = "ldap_first_attributeA", .signature = "\x00\x03\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x0f\x11\xb2\x51" } },
    .{ "ldap_first_attribute", MethodRecord{ .library = "WLDAP32", .import = "ldap_first_attribute", .signature = "\x00\x03\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x0f\x11\xb2\x51" } },
    .{ "ldap_next_attributeW", MethodRecord{ .library = "WLDAP32", .import = "ldap_next_attributeW", .signature = "\x00\x03\x11\x05\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x11\xb2\x51" } },
    .{ "ldap_next_attributeA", MethodRecord{ .library = "WLDAP32", .import = "ldap_next_attributeA", .signature = "\x00\x03\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x11\xb2\x51" } },
    .{ "ldap_next_attribute", MethodRecord{ .library = "WLDAP32", .import = "ldap_next_attribute", .signature = "\x00\x03\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x11\xb2\x51" } },
    .{ "ldap_get_valuesW", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_valuesW", .signature = "\x00\x03\x0f\x11\x05\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x11\x05" } },
    .{ "ldap_get_valuesA", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_valuesA", .signature = "\x00\x03\x0f\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x11\x3d" } },
    .{ "ldap_get_values", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_values", .signature = "\x00\x03\x0f\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x11\x3d" } },
    .{ "ldap_get_values_lenW", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_values_lenW", .signature = "\x00\x03\x0f\x0f\x11\xb2\x39\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x11\x05" } },
    .{ "ldap_get_values_lenA", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_values_lenA", .signature = "\x00\x03\x0f\x0f\x11\xb2\x39\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x11\x3d" } },
    .{ "ldap_get_values_len", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_values_len", .signature = "\x00\x03\x0f\x0f\x11\xb2\x39\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x11\x3d" } },
    .{ "ldap_count_valuesW", MethodRecord{ .library = "WLDAP32", .import = "ldap_count_valuesW", .signature = "\x00\x01\x09\x0f\x11\x05" } },
    .{ "ldap_count_valuesA", MethodRecord{ .library = "WLDAP32", .import = "ldap_count_valuesA", .signature = "\x00\x01\x09\x0f\x11\x3d" } },
    .{ "ldap_count_values", MethodRecord{ .library = "WLDAP32", .import = "ldap_count_values", .signature = "\x00\x01\x09\x0f\x11\x3d" } },
    .{ "ldap_count_values_len", MethodRecord{ .library = "WLDAP32", .import = "ldap_count_values_len", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_value_freeW", MethodRecord{ .library = "WLDAP32", .import = "ldap_value_freeW", .signature = "\x00\x01\x09\x0f\x11\x05" } },
    .{ "ldap_value_freeA", MethodRecord{ .library = "WLDAP32", .import = "ldap_value_freeA", .signature = "\x00\x01\x09\x0f\x11\x3d" } },
    .{ "ldap_value_free", MethodRecord{ .library = "WLDAP32", .import = "ldap_value_free", .signature = "\x00\x01\x09\x0f\x11\x3d" } },
    .{ "ldap_value_free_len", MethodRecord{ .library = "WLDAP32", .import = "ldap_value_free_len", .signature = "\x00\x01\x09\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_get_dnW", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_dnW", .signature = "\x00\x02\x11\x05\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_get_dnA", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_dnA", .signature = "\x00\x02\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_get_dn", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_dn", .signature = "\x00\x02\x11\x3d\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_explode_dnW", MethodRecord{ .library = "WLDAP32", .import = "ldap_explode_dnW", .signature = "\x00\x02\x0f\x11\x05\x11\x05\x09" } },
    .{ "ldap_explode_dnA", MethodRecord{ .library = "WLDAP32", .import = "ldap_explode_dnA", .signature = "\x00\x02\x0f\x11\x3d\x11\x3d\x09" } },
    .{ "ldap_explode_dn", MethodRecord{ .library = "WLDAP32", .import = "ldap_explode_dn", .signature = "\x00\x02\x0f\x11\x3d\x11\x3d\x09" } },
    .{ "ldap_dn2ufnW", MethodRecord{ .library = "WLDAP32", .import = "ldap_dn2ufnW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "ldap_dn2ufnA", MethodRecord{ .library = "WLDAP32", .import = "ldap_dn2ufnA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "ldap_dn2ufn", MethodRecord{ .library = "WLDAP32", .import = "ldap_dn2ufn", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "ldap_memfreeW", MethodRecord{ .library = "WLDAP32", .import = "ldap_memfreeW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "ldap_memfreeA", MethodRecord{ .library = "WLDAP32", .import = "ldap_memfreeA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "ber_bvfree", MethodRecord{ .library = "WLDAP32", .import = "ber_bvfree", .signature = "\x00\x01\x01\x0f\x11\xb2\x39" } },
    .{ "ldap_memfree", MethodRecord{ .library = "WLDAP32", .import = "ldap_memfree", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "ldap_ufn2dnW", MethodRecord{ .library = "WLDAP32", .import = "ldap_ufn2dnW", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x05" } },
    .{ "ldap_ufn2dnA", MethodRecord{ .library = "WLDAP32", .import = "ldap_ufn2dnA", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\x3d" } },
    .{ "ldap_ufn2dn", MethodRecord{ .library = "WLDAP32", .import = "ldap_ufn2dn", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\x3d" } },
    .{ "ldap_startup", MethodRecord{ .library = "WLDAP32", .import = "ldap_startup", .signature = "\x00\x02\x09\x0f\x11\xb2\x55\x0f\x11\x80\x85" } },
    .{ "ldap_cleanup", MethodRecord{ .library = "WLDAP32", .import = "ldap_cleanup", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "ldap_escape_filter_elementW", MethodRecord{ .library = "WLDAP32", .import = "ldap_escape_filter_elementW", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x05\x09" } },
    .{ "ldap_escape_filter_elementA", MethodRecord{ .library = "WLDAP32", .import = "ldap_escape_filter_elementA", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x3d\x09" } },
    .{ "ldap_escape_filter_element", MethodRecord{ .library = "WLDAP32", .import = "ldap_escape_filter_element", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x3d\x09" } },
    .{ "ldap_set_dbg_flags", MethodRecord{ .library = "WLDAP32", .import = "ldap_set_dbg_flags", .signature = "\x00\x01\x09\x09" } },
    .{ "ldap_set_dbg_routine", MethodRecord{ .library = "WLDAP32", .import = "ldap_set_dbg_routine", .signature = "\x00\x01\x01\x12\xb2\x59" } },
    .{ "LdapUTF8ToUnicode", MethodRecord{ .library = "WLDAP32", .import = "LdapUTF8ToUnicode", .signature = "\x00\x04\x08\x11\x3d\x08\x11\x05\x08" } },
    .{ "LdapUnicodeToUTF8", MethodRecord{ .library = "WLDAP32", .import = "LdapUnicodeToUTF8", .signature = "\x00\x04\x08\x11\x05\x08\x11\x3d\x08" } },
    .{ "ldap_create_sort_controlA", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_sort_controlA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x5d\x05\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_create_sort_controlW", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_sort_controlW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x61\x05\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_parse_sort_controlA", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_sort_controlA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x3d\x0f\x09\x0f\x11\x3d" } },
    .{ "ldap_parse_sort_controlW", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_sort_controlW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x41\x0f\x09\x0f\x11\x05" } },
    .{ "ldap_create_sort_control", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_sort_control", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x5d\x05\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_parse_sort_control", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_sort_control", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x3d\x0f\x09\x0f\x11\x3d" } },
    .{ "ldap_encode_sort_controlW", MethodRecord{ .library = "WLDAP32", .import = "ldap_encode_sort_controlW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x61\x0f\x11\xb2\x41\x11\x87\x79" } },
    .{ "ldap_encode_sort_controlA", MethodRecord{ .library = "WLDAP32", .import = "ldap_encode_sort_controlA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x5d\x0f\x11\xb2\x3d\x11\x87\x79" } },
    .{ "ldap_create_page_controlW", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_page_controlW", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x09\x0f\x11\xb2\x39\x05\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_create_page_controlA", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_page_controlA", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x09\x0f\x11\xb2\x39\x05\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_parse_page_controlW", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_page_controlW", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x41\x0f\x09\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_parse_page_controlA", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_page_controlA", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x3d\x0f\x09\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_create_page_control", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_page_control", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x09\x0f\x11\xb2\x39\x05\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_parse_page_control", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_page_control", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x3d\x0f\x09\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_search_init_pageW", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_init_pageW", .signature = "\x00\x0b\x11\xb2\x65\x0f\x11\xb2\x31\x11\x05\x09\x11\x05\x0f\x0f\x07\x09\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x09\x09\x0f\x0f\x11\xb2\x61" } },
    .{ "ldap_search_init_pageA", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_init_pageA", .signature = "\x00\x0b\x11\xb2\x65\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x09\x09\x0f\x0f\x11\xb2\x5d" } },
    .{ "ldap_search_init_page", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_init_page", .signature = "\x00\x0b\x11\xb2\x65\x0f\x11\xb2\x31\x11\x3d\x09\x11\x3d\x0f\x0f\x04\x09\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x09\x09\x0f\x0f\x11\xb2\x5d" } },
    .{ "ldap_get_next_page", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_next_page", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\xb2\x65\x09\x0f\x09" } },
    .{ "ldap_get_next_page_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_next_page_s", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\xb2\x65\x0f\x11\xb2\x35\x09\x0f\x09\x0f\x0f\x11\xb2\x45" } },
    .{ "ldap_get_paged_count", MethodRecord{ .library = "WLDAP32", .import = "ldap_get_paged_count", .signature = "\x00\x04\x09\x0f\x11\xb2\x31\x11\xb2\x65\x0f\x09\x0f\x11\xb2\x45" } },
    .{ "ldap_search_abandon_page", MethodRecord{ .library = "WLDAP32", .import = "ldap_search_abandon_page", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x11\xb2\x65" } },
    .{ "ldap_create_vlv_controlW", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_vlv_controlW", .signature = "\x00\x04\x08\x0f\x11\xb2\x31\x0f\x11\xb2\x69\x05\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_create_vlv_controlA", MethodRecord{ .library = "WLDAP32", .import = "ldap_create_vlv_controlA", .signature = "\x00\x04\x08\x0f\x11\xb2\x31\x0f\x11\xb2\x69\x05\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_parse_vlv_controlW", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_vlv_controlW", .signature = "\x00\x06\x08\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x41\x0f\x09\x0f\x09\x0f\x0f\x11\xb2\x39\x0f\x08" } },
    .{ "ldap_parse_vlv_controlA", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_vlv_controlA", .signature = "\x00\x06\x08\x0f\x11\xb2\x31\x0f\x0f\x11\xb2\x3d\x0f\x09\x0f\x09\x0f\x0f\x11\xb2\x39\x0f\x08" } },
    .{ "ldap_start_tls_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_start_tls_sW", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x0f\x09\x0f\x0f\x11\xb2\x45\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41" } },
    .{ "ldap_start_tls_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_start_tls_sA", .signature = "\x00\x05\x09\x0f\x11\xb2\x31\x0f\x09\x0f\x0f\x11\xb2\x45\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d" } },
    .{ "ldap_stop_tls_s", MethodRecord{ .library = "WLDAP32", .import = "ldap_stop_tls_s", .signature = "\x00\x01\x11\x87\x79\x0f\x11\xb2\x31" } },
    .{ "ldap_first_reference", MethodRecord{ .library = "WLDAP32", .import = "ldap_first_reference", .signature = "\x00\x02\x0f\x11\xb2\x45\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_next_reference", MethodRecord{ .library = "WLDAP32", .import = "ldap_next_reference", .signature = "\x00\x02\x0f\x11\xb2\x45\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_count_references", MethodRecord{ .library = "WLDAP32", .import = "ldap_count_references", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ldap_parse_referenceW", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_referenceW", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x0f\x11\x05" } },
    .{ "ldap_parse_referenceA", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_referenceA", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x0f\x11\x3d" } },
    .{ "ldap_parse_reference", MethodRecord{ .library = "WLDAP32", .import = "ldap_parse_reference", .signature = "\x00\x03\x09\x0f\x11\xb2\x31\x0f\x11\xb2\x45\x0f\x0f\x11\x3d" } },
    .{ "ldap_extended_operationW", MethodRecord{ .library = "WLDAP32", .import = "ldap_extended_operationW", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x05\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x09" } },
    .{ "ldap_extended_operationA", MethodRecord{ .library = "WLDAP32", .import = "ldap_extended_operationA", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_extended_operation_sA", MethodRecord{ .library = "WLDAP32", .import = "ldap_extended_operation_sA", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x11\x3d\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_extended_operation_sW", MethodRecord{ .library = "WLDAP32", .import = "ldap_extended_operation_sW", .signature = "\x00\x07\x09\x0f\x11\xb2\x31\x11\x05\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x41\x0f\x0f\x11\xb2\x41\x0f\x11\x05\x0f\x0f\x11\xb2\x39" } },
    .{ "ldap_extended_operation", MethodRecord{ .library = "WLDAP32", .import = "ldap_extended_operation", .signature = "\x00\x06\x09\x0f\x11\xb2\x31\x11\x3d\x0f\x11\xb2\x39\x0f\x0f\x11\xb2\x3d\x0f\x0f\x11\xb2\x3d\x0f\x09" } },
    .{ "ldap_close_extended_op", MethodRecord{ .library = "WLDAP32", .import = "ldap_close_extended_op", .signature = "\x00\x02\x09\x0f\x11\xb2\x31\x09" } },
    .{ "LdapGetLastError", MethodRecord{ .library = "WLDAP32", .import = "LdapGetLastError", .signature = "\x00\x00\x09" } },
    .{ "LdapMapErrorToWin32", MethodRecord{ .library = "WLDAP32", .import = "LdapMapErrorToWin32", .signature = "\x00\x01\x11\x81\x01\x09" } },
    .{ "ldap_conn_from_msg", MethodRecord{ .library = "WLDAP32", .import = "ldap_conn_from_msg", .signature = "\x00\x02\x0f\x11\xb2\x31\x0f\x11\xb2\x31\x0f\x11\xb2\x45" } },
    .{ "ber_init", MethodRecord{ .library = "WLDAP32", .import = "ber_init", .signature = "\x00\x01\x0f\x11\xb2\x51\x0f\x11\xb2\x39" } },
    .{ "ber_free", MethodRecord{ .library = "WLDAP32", .import = "ber_free", .signature = "\x00\x02\x01\x0f\x11\xb2\x51\x08" } },
    .{ "ber_bvecfree", MethodRecord{ .library = "WLDAP32", .import = "ber_bvecfree", .signature = "\x00\x01\x01\x0f\x0f\x11\xb2\x39" } },
    .{ "ber_bvdup", MethodRecord{ .library = "WLDAP32", .import = "ber_bvdup", .signature = "\x00\x01\x0f\x11\xb2\x39\x0f\x11\xb2\x39" } },
    .{ "ber_alloc_t", MethodRecord{ .library = "WLDAP32", .import = "ber_alloc_t", .signature = "\x00\x01\x0f\x11\xb2\x51\x08" } },
    .{ "ber_skip_tag", MethodRecord{ .library = "WLDAP32", .import = "ber_skip_tag", .signature = "\x00\x02\x09\x0f\x11\xb2\x51\x0f\x09" } },
    .{ "ber_peek_tag", MethodRecord{ .library = "WLDAP32", .import = "ber_peek_tag", .signature = "\x00\x02\x09\x0f\x11\xb2\x51\x0f\x09" } },
    .{ "ber_first_element", MethodRecord{ .library = "WLDAP32", .import = "ber_first_element", .signature = "\x00\x03\x09\x0f\x11\xb2\x51\x0f\x09\x0f\x0f\x11\x8d\x5d" } },
    .{ "ber_next_element", MethodRecord{ .library = "WLDAP32", .import = "ber_next_element", .signature = "\x00\x03\x09\x0f\x11\xb2\x51\x0f\x09\x11\x3d" } },
    .{ "ber_flatten", MethodRecord{ .library = "WLDAP32", .import = "ber_flatten", .signature = "\x00\x02\x08\x0f\x11\xb2\x51\x0f\x0f\x11\xb2\x39" } },
    .{ "ber_printf", MethodRecord{ .library = "WLDAP32", .import = "ber_printf", .signature = "\x05\x02\x08\x0f\x11\xb2\x51\x11\x3d" } },
    .{ "ber_scanf", MethodRecord{ .library = "WLDAP32", .import = "ber_scanf", .signature = "\x05\x02\x09\x0f\x11\xb2\x51\x11\x3d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xd5d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "CHAR" },
        0x3231 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAP" },
        0x3235 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAP_TIMEVAL" },
        0x3239 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAP_BERVAL" },
        0x323d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPControlA" },
        0x3241 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPControlW" },
        0x3245 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPMessage" },
        0x3249 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPModW" },
        0x324d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPModA" },
        0x3251 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "BerElement" },
        0x3255 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAP_VERSION_INFO" },
        0x3259 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "DBGPRINT" },
        0x325d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPSortKeyA" },
        0x3261 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPSortKeyW" },
        0x3265 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "PLDAPSearch" },
        0x3269 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Ldap", .name = "LDAPVLVInfo" },
        else => null,
    };
}

pub const LBER_ERROR = -1;
pub const LBER_DEFAULT = -1;
pub const LDAP_UNICODE = 1;
pub const LDAP_PORT = 389;
pub const LDAP_SSL_PORT = 636;
pub const LDAP_GC_PORT = 3268;
pub const LDAP_SSL_GC_PORT = 3269;
pub const LDAP_VERSION1 = 1;
pub const LDAP_VERSION2 = 2;
pub const LDAP_VERSION3 = 3;
pub const LDAP_VERSION = 2;
pub const LDAP_BIND_CMD = 96;
pub const LDAP_UNBIND_CMD = 66;
pub const LDAP_SEARCH_CMD = 99;
pub const LDAP_MODIFY_CMD = 102;
pub const LDAP_ADD_CMD = 104;
pub const LDAP_DELETE_CMD = 74;
pub const LDAP_MODRDN_CMD = 108;
pub const LDAP_COMPARE_CMD = 110;
pub const LDAP_ABANDON_CMD = 80;
pub const LDAP_SESSION_CMD = 113;
pub const LDAP_EXTENDED_CMD = 119;
pub const LDAP_RES_BIND = 97;
pub const LDAP_RES_SEARCH_ENTRY = 100;
pub const LDAP_RES_SEARCH_RESULT = 101;
pub const LDAP_RES_MODIFY = 103;
pub const LDAP_RES_ADD = 105;
pub const LDAP_RES_DELETE = 107;
pub const LDAP_RES_MODRDN = 109;
pub const LDAP_RES_COMPARE = 111;
pub const LDAP_RES_SESSION = 114;
pub const LDAP_RES_REFERRAL = 115;
pub const LDAP_RES_EXTENDED = 120;
pub const LDAP_RES_ANY = -1;
pub const LDAP_INVALID_CMD = 255;
pub const LDAP_INVALID_RES = 255;
pub const LDAP_AUTH_SIMPLE = 128;
pub const LDAP_AUTH_SASL = 131;
pub const LDAP_AUTH_OTHERKIND = 134;
pub const LDAP_FILTER_AND = 160;
pub const LDAP_FILTER_OR = 161;
pub const LDAP_FILTER_NOT = 162;
pub const LDAP_FILTER_EQUALITY = 163;
pub const LDAP_FILTER_SUBSTRINGS = 164;
pub const LDAP_FILTER_GE = 165;
pub const LDAP_FILTER_LE = 166;
pub const LDAP_FILTER_PRESENT = 135;
pub const LDAP_FILTER_APPROX = 168;
pub const LDAP_FILTER_EXTENSIBLE = 169;
pub const LDAP_SUBSTRING_INITIAL = 128;
pub const LDAP_SUBSTRING_ANY = 129;
pub const LDAP_SUBSTRING_FINAL = 130;
pub const LDAP_DEREF_NEVER = 0;
pub const LDAP_DEREF_SEARCHING = 1;
pub const LDAP_DEREF_FINDING = 2;
pub const LDAP_DEREF_ALWAYS = 3;
pub const LDAP_NO_LIMIT = 0;
pub const LDAP_OPT_DNS = 1;
pub const LDAP_OPT_CHASE_REFERRALS = 2;
pub const LDAP_OPT_RETURN_REFS = 4;
pub const LDAP_MOD_ADD = 0;
pub const LDAP_MOD_DELETE = 1;
pub const LDAP_MOD_REPLACE = 2;
pub const LDAP_MOD_BVALUES = 128;
pub const LDAP_OPT_API_INFO = 0;
pub const LDAP_OPT_DESC = 1;
pub const LDAP_OPT_DEREF = 2;
pub const LDAP_OPT_SIZELIMIT = 3;
pub const LDAP_OPT_TIMELIMIT = 4;
pub const LDAP_OPT_THREAD_FN_PTRS = 5;
pub const LDAP_OPT_REBIND_FN = 6;
pub const LDAP_OPT_REBIND_ARG = 7;
pub const LDAP_OPT_REFERRALS = 8;
pub const LDAP_OPT_RESTART = 9;
pub const LDAP_OPT_SSL = 10;
pub const LDAP_OPT_IO_FN_PTRS = 11;
pub const LDAP_OPT_CACHE_FN_PTRS = 13;
pub const LDAP_OPT_CACHE_STRATEGY = 14;
pub const LDAP_OPT_CACHE_ENABLE = 15;
pub const LDAP_OPT_REFERRAL_HOP_LIMIT = 16;
pub const LDAP_OPT_PROTOCOL_VERSION = 17;
pub const LDAP_OPT_VERSION = 17;
pub const LDAP_OPT_API_FEATURE_INFO = 21;
pub const LDAP_OPT_HOST_NAME = 48;
pub const LDAP_OPT_ERROR_NUMBER = 49;
pub const LDAP_OPT_ERROR_STRING = 50;
pub const LDAP_OPT_SERVER_ERROR = 51;
pub const LDAP_OPT_SERVER_EXT_ERROR = 52;
pub const LDAP_OPT_HOST_REACHABLE = 62;
pub const LDAP_OPT_PING_KEEP_ALIVE = 54;
pub const LDAP_OPT_PING_WAIT_TIME = 55;
pub const LDAP_OPT_PING_LIMIT = 56;
pub const LDAP_OPT_DNSDOMAIN_NAME = 59;
pub const LDAP_OPT_GETDSNAME_FLAGS = 61;
pub const LDAP_OPT_PROMPT_CREDENTIALS = 63;
pub const LDAP_OPT_AUTO_RECONNECT = 145;
pub const LDAP_OPT_SSPI_FLAGS = 146;
pub const LDAP_OPT_SSL_INFO = 147;
pub const LDAP_OPT_TLS = 10;
pub const LDAP_OPT_TLS_INFO = 147;
pub const LDAP_OPT_SIGN = 149;
pub const LDAP_OPT_ENCRYPT = 150;
pub const LDAP_OPT_SASL_METHOD = 151;
pub const LDAP_OPT_AREC_EXCLUSIVE = 152;
pub const LDAP_OPT_SECURITY_CONTEXT = 153;
pub const LDAP_OPT_ROOTDSE_CACHE = 154;
pub const LDAP_OPT_TCP_KEEPALIVE = 64;
pub const LDAP_OPT_FAST_CONCURRENT_BIND = 65;
pub const LDAP_OPT_SEND_TIMEOUT = 66;
pub const LDAP_OPT_SCH_FLAGS = 67;
pub const LDAP_OPT_SOCKET_BIND_ADDRESSES = 68;
pub const LDAP_OPT_CLDAP_TIMEOUT = 69;
pub const LDAP_OPT_CLDAP_TRIES = 70;
pub const LDAP_OPT_ANONYMOUS_MAX_VAL_RANGE = 71;
pub const LDAP_CHASE_SUBORDINATE_REFERRALS = 32;
pub const LDAP_CHASE_EXTERNAL_REFERRALS = 64;
pub const LDAP_SCOPE_BASE = 0;
pub const LDAP_SCOPE_ONELEVEL = 1;
pub const LDAP_SCOPE_SUBTREE = 2;
pub const LDAP_MSG_ONE = 0;
pub const LDAP_MSG_ALL = 1;
pub const LDAP_MSG_RECEIVED = 2;
pub const LBER_USE_DER = 1;
pub const LBER_USE_INDEFINITE_LEN = 2;
pub const LBER_TRANSLATE_STRINGS = 4;
pub const LAPI_MAJOR_VER1 = 1;
pub const LAPI_MINOR_VER1 = 1;
pub const LDAP_API_INFO_VERSION = 1;
pub const LDAP_API_VERSION = 2004;
pub const LDAP_VERSION_MIN = 2;
pub const LDAP_VERSION_MAX = 3;
pub const LDAP_VENDOR_VERSION = 510;
pub const LDAP_FEATURE_INFO_VERSION = 1;
pub const LDAP_API_FEATURE_VIRTUAL_LIST_VIEW = 1001;
pub const LDAP_VLVINFO_VERSION = 1;
pub const LDAP_OPT_REFERRAL_CALLBACK = 112;
pub const LDAP_OPT_CLIENT_CERTIFICATE = 128;
pub const LDAP_OPT_SERVER_CERTIFICATE = 129;
pub const LDAP_OPT_REF_DEREF_CONN_PER_MSG = 148;
pub const SERVER_SEARCH_FLAG_DOMAIN_SCOPE = 1;
pub const SERVER_SEARCH_FLAG_PHANTOM_ROOT = 2;
pub const LDAP_DIRSYNC_OBJECT_SECURITY = 1;
pub const LDAP_DIRSYNC_ANCESTORS_FIRST_ORDER = 2048;
pub const LDAP_DIRSYNC_PUBLIC_DATA_ONLY = 8192;
pub const LDAP_DIRSYNC_INCREMENTAL_VALUES = 2147483648;
pub const LDAP_DIRSYNC_ROPAS_DATA_ONLY = 1073741824;
pub const LDAP_POLICYHINT_APPLY_FULLPWDPOLICY = 1;
pub const LDAP_SUCCESS = 0;
pub const LDAP_OPERATIONS_ERROR = 1;
pub const LDAP_PROTOCOL_ERROR = 2;
pub const LDAP_TIMELIMIT_EXCEEDED = 3;
pub const LDAP_SIZELIMIT_EXCEEDED = 4;
pub const LDAP_COMPARE_FALSE = 5;
pub const LDAP_COMPARE_TRUE = 6;
pub const LDAP_AUTH_METHOD_NOT_SUPPORTED = 7;
pub const LDAP_STRONG_AUTH_REQUIRED = 8;
pub const LDAP_REFERRAL_V2 = 9;
pub const LDAP_PARTIAL_RESULTS = 9;
pub const LDAP_REFERRAL = 10;
pub const LDAP_ADMIN_LIMIT_EXCEEDED = 11;
pub const LDAP_UNAVAILABLE_CRIT_EXTENSION = 12;
pub const LDAP_CONFIDENTIALITY_REQUIRED = 13;
pub const LDAP_SASL_BIND_IN_PROGRESS = 14;
pub const LDAP_NO_SUCH_ATTRIBUTE = 16;
pub const LDAP_UNDEFINED_TYPE = 17;
pub const LDAP_INAPPROPRIATE_MATCHING = 18;
pub const LDAP_CONSTRAINT_VIOLATION = 19;
pub const LDAP_ATTRIBUTE_OR_VALUE_EXISTS = 20;
pub const LDAP_INVALID_SYNTAX = 21;
pub const LDAP_NO_SUCH_OBJECT = 32;
pub const LDAP_ALIAS_PROBLEM = 33;
pub const LDAP_INVALID_DN_SYNTAX = 34;
pub const LDAP_IS_LEAF = 35;
pub const LDAP_ALIAS_DEREF_PROBLEM = 36;
pub const LDAP_INAPPROPRIATE_AUTH = 48;
pub const LDAP_INVALID_CREDENTIALS = 49;
pub const LDAP_INSUFFICIENT_RIGHTS = 50;
pub const LDAP_BUSY = 51;
pub const LDAP_UNAVAILABLE = 52;
pub const LDAP_UNWILLING_TO_PERFORM = 53;
pub const LDAP_LOOP_DETECT = 54;
pub const LDAP_SORT_CONTROL_MISSING = 60;
pub const LDAP_OFFSET_RANGE_ERROR = 61;
pub const LDAP_NAMING_VIOLATION = 64;
pub const LDAP_OBJECT_CLASS_VIOLATION = 65;
pub const LDAP_NOT_ALLOWED_ON_NONLEAF = 66;
pub const LDAP_NOT_ALLOWED_ON_RDN = 67;
pub const LDAP_ALREADY_EXISTS = 68;
pub const LDAP_NO_OBJECT_CLASS_MODS = 69;
pub const LDAP_RESULTS_TOO_LARGE = 70;
pub const LDAP_AFFECTS_MULTIPLE_DSAS = 71;
pub const LDAP_VIRTUAL_LIST_VIEW_ERROR = 76;
pub const LDAP_OTHER = 80;
pub const LDAP_SERVER_DOWN = 81;
pub const LDAP_LOCAL_ERROR = 82;
pub const LDAP_ENCODING_ERROR = 83;
pub const LDAP_DECODING_ERROR = 84;
pub const LDAP_TIMEOUT = 85;
pub const LDAP_AUTH_UNKNOWN = 86;
pub const LDAP_FILTER_ERROR = 87;
pub const LDAP_USER_CANCELLED = 88;
pub const LDAP_PARAM_ERROR = 89;
pub const LDAP_NO_MEMORY = 90;
pub const LDAP_CONNECT_ERROR = 91;
pub const LDAP_NOT_SUPPORTED = 92;
pub const LDAP_NO_RESULTS_RETURNED = 94;
pub const LDAP_CONTROL_NOT_FOUND = 93;
pub const LDAP_MORE_RESULTS_TO_RETURN = 95;
pub const LDAP_CLIENT_LOOP = 96;
pub const LDAP_REFERRAL_LIMIT_EXCEEDED = 97;

pub const aliases = struct {
    pub const LDAP_RETCODE = i32;
    pub const PLDAPSearch = isize;
};
