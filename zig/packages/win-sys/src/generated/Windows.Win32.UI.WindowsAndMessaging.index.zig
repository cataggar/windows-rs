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
    .{ "LoadStringA", MethodRecord{ .library = "USER32", .import = "LoadStringA", .signature = "\x00\x04\x08\x11\x82\x29\x09\x11\x3d\x08" } },
    .{ "LoadStringW", MethodRecord{ .library = "USER32", .import = "LoadStringW", .signature = "\x00\x04\x08\x11\x82\x29\x09\x11\x05\x08" } },
    .{ "GetWindowLongPtrA", MethodRecord{ .library = "USER32", .import = "GetWindowLongPtrA", .signature = "\x00\x02\x18\x11\x25\x11\xa7\x5d" } },
    .{ "GetWindowLongPtrW", MethodRecord{ .library = "USER32", .import = "GetWindowLongPtrW", .signature = "\x00\x02\x18\x11\x25\x11\xa7\x5d" } },
    .{ "SetWindowLongPtrA", MethodRecord{ .library = "USER32", .import = "SetWindowLongPtrA", .signature = "\x00\x03\x18\x11\x25\x11\xa7\x5d\x18" } },
    .{ "SetWindowLongPtrW", MethodRecord{ .library = "USER32", .import = "SetWindowLongPtrW", .signature = "\x00\x03\x18\x11\x25\x11\xa7\x5d\x18" } },
    .{ "GetClassLongPtrA", MethodRecord{ .library = "USER32", .import = "GetClassLongPtrA", .signature = "\x00\x02\x19\x11\x25\x11\xa7\x55" } },
    .{ "GetClassLongPtrW", MethodRecord{ .library = "USER32", .import = "GetClassLongPtrW", .signature = "\x00\x02\x19\x11\x25\x11\xa7\x55" } },
    .{ "SetClassLongPtrA", MethodRecord{ .library = "USER32", .import = "SetClassLongPtrA", .signature = "\x00\x03\x19\x11\x25\x11\xa7\x55\x18" } },
    .{ "SetClassLongPtrW", MethodRecord{ .library = "USER32", .import = "SetClassLongPtrW", .signature = "\x00\x03\x19\x11\x25\x11\xa7\x55\x18" } },
    .{ "wvsprintfA", MethodRecord{ .library = "USER32", .import = "wvsprintfA", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x0f\x04" } },
    .{ "wvsprintfW", MethodRecord{ .library = "USER32", .import = "wvsprintfW", .signature = "\x00\x03\x08\x11\x05\x11\x05\x0f\x04" } },
    .{ "wsprintfA", MethodRecord{ .library = "USER32", .import = "wsprintfA", .signature = "\x05\x02\x08\x11\x3d\x11\x3d" } },
    .{ "wsprintfW", MethodRecord{ .library = "USER32", .import = "wsprintfW", .signature = "\x05\x02\x08\x11\x05\x11\x05" } },
    .{ "IsHungAppWindow", MethodRecord{ .library = "USER32", .import = "IsHungAppWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "DisableProcessWindowsGhosting", MethodRecord{ .library = "USER32", .import = "DisableProcessWindowsGhosting", .signature = "\x00\x00\x01" } },
    .{ "RegisterWindowMessageA", MethodRecord{ .library = "USER32", .import = "RegisterWindowMessageA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "RegisterWindowMessageW", MethodRecord{ .library = "USER32", .import = "RegisterWindowMessageW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "GetMessageA", MethodRecord{ .library = "USER32", .import = "GetMessageA", .signature = "\x00\x04\x11\x59\x0f\x11\x99\xe9\x11\x25\x09\x09" } },
    .{ "GetMessageW", MethodRecord{ .library = "USER32", .import = "GetMessageW", .signature = "\x00\x04\x11\x59\x0f\x11\x99\xe9\x11\x25\x09\x09" } },
    .{ "TranslateMessage", MethodRecord{ .library = "USER32", .import = "TranslateMessage", .signature = "\x00\x01\x11\x59\x0f\x11\x99\xe9" } },
    .{ "DispatchMessageA", MethodRecord{ .library = "USER32", .import = "DispatchMessageA", .signature = "\x00\x01\x11\x82\x35\x0f\x11\x99\xe9" } },
    .{ "DispatchMessageW", MethodRecord{ .library = "USER32", .import = "DispatchMessageW", .signature = "\x00\x01\x11\x82\x35\x0f\x11\x99\xe9" } },
    .{ "SetMessageQueue", MethodRecord{ .library = "USER32", .import = "SetMessageQueue", .signature = "\x00\x01\x11\x59\x08" } },
    .{ "PeekMessageA", MethodRecord{ .library = "USER32", .import = "PeekMessageA", .signature = "\x00\x05\x11\x59\x0f\x11\x99\xe9\x11\x25\x09\x09\x11\xa7\x91" } },
    .{ "PeekMessageW", MethodRecord{ .library = "USER32", .import = "PeekMessageW", .signature = "\x00\x05\x11\x59\x0f\x11\x99\xe9\x11\x25\x09\x09\x11\xa7\x91" } },
    .{ "GetMessagePos", MethodRecord{ .library = "USER32", .import = "GetMessagePos", .signature = "\x00\x00\x09" } },
    .{ "GetMessageTime", MethodRecord{ .library = "USER32", .import = "GetMessageTime", .signature = "\x00\x00\x08" } },
    .{ "GetMessageExtraInfo", MethodRecord{ .library = "USER32", .import = "GetMessageExtraInfo", .signature = "\x00\x00\x11\x82\x2d" } },
    .{ "IsWow64Message", MethodRecord{ .library = "USER32", .import = "IsWow64Message", .signature = "\x00\x00\x11\x59" } },
    .{ "SetMessageExtraInfo", MethodRecord{ .library = "USER32", .import = "SetMessageExtraInfo", .signature = "\x00\x01\x11\x82\x2d\x11\x82\x2d" } },
    .{ "SendMessageA", MethodRecord{ .library = "USER32", .import = "SendMessageA", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SendMessageW", MethodRecord{ .library = "USER32", .import = "SendMessageW", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SendMessageTimeoutA", MethodRecord{ .library = "USER32", .import = "SendMessageTimeoutA", .signature = "\x00\x07\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d\x11\xa7\x8d\x09\x0f\x19" } },
    .{ "SendMessageTimeoutW", MethodRecord{ .library = "USER32", .import = "SendMessageTimeoutW", .signature = "\x00\x07\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d\x11\xa7\x8d\x09\x0f\x19" } },
    .{ "SendNotifyMessageA", MethodRecord{ .library = "USER32", .import = "SendNotifyMessageA", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SendNotifyMessageW", MethodRecord{ .library = "USER32", .import = "SendNotifyMessageW", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SendMessageCallbackA", MethodRecord{ .library = "USER32", .import = "SendMessageCallbackA", .signature = "\x00\x06\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d\x12\xc0\x00\x47\xbd\x19" } },
    .{ "SendMessageCallbackW", MethodRecord{ .library = "USER32", .import = "SendMessageCallbackW", .signature = "\x00\x06\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d\x12\xc0\x00\x47\xbd\x19" } },
    .{ "RegisterDeviceNotificationA", MethodRecord{ .library = "USER32", .import = "RegisterDeviceNotificationA", .signature = "\x00\x03\x11\xc0\x00\x47\xc1\x11\x80\x85\x0f\x01\x11\xa7\x81" } },
    .{ "RegisterDeviceNotificationW", MethodRecord{ .library = "USER32", .import = "RegisterDeviceNotificationW", .signature = "\x00\x03\x11\xc0\x00\x47\xc1\x11\x80\x85\x0f\x01\x11\xa7\x81" } },
    .{ "UnregisterDeviceNotification", MethodRecord{ .library = "USER32", .import = "UnregisterDeviceNotification", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\xc1" } },
    .{ "PostMessageA", MethodRecord{ .library = "USER32", .import = "PostMessageA", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "PostMessageW", MethodRecord{ .library = "USER32", .import = "PostMessageW", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "PostThreadMessageA", MethodRecord{ .library = "USER32", .import = "PostThreadMessageA", .signature = "\x00\x04\x11\x59\x09\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "PostThreadMessageW", MethodRecord{ .library = "USER32", .import = "PostThreadMessageW", .signature = "\x00\x04\x11\x59\x09\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "ReplyMessage", MethodRecord{ .library = "USER32", .import = "ReplyMessage", .signature = "\x00\x01\x11\x59\x11\x82\x35" } },
    .{ "WaitMessage", MethodRecord{ .library = "USER32", .import = "WaitMessage", .signature = "\x00\x00\x11\x59" } },
    .{ "DefWindowProcA", MethodRecord{ .library = "USER32", .import = "DefWindowProcA", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "DefWindowProcW", MethodRecord{ .library = "USER32", .import = "DefWindowProcW", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "PostQuitMessage", MethodRecord{ .library = "USER32", .import = "PostQuitMessage", .signature = "\x00\x01\x01\x08" } },
    .{ "CallWindowProcA", MethodRecord{ .library = "USER32", .import = "CallWindowProcA", .signature = "\x00\x05\x11\x82\x35\x12\xc0\x00\x47\xc5\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "CallWindowProcW", MethodRecord{ .library = "USER32", .import = "CallWindowProcW", .signature = "\x00\x05\x11\x82\x35\x12\xc0\x00\x47\xc5\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "InSendMessage", MethodRecord{ .library = "USER32", .import = "InSendMessage", .signature = "\x00\x00\x11\x59" } },
    .{ "InSendMessageEx", MethodRecord{ .library = "USER32", .import = "InSendMessageEx", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "RegisterClassA", MethodRecord{ .library = "USER32", .import = "RegisterClassA", .signature = "\x00\x01\x07\x0f\x11\xc0\x00\x47\xc9" } },
    .{ "RegisterClassW", MethodRecord{ .library = "USER32", .import = "RegisterClassW", .signature = "\x00\x01\x07\x0f\x11\xc0\x00\x47\xcd" } },
    .{ "UnregisterClassA", MethodRecord{ .library = "USER32", .import = "UnregisterClassA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x82\x29" } },
    .{ "UnregisterClassW", MethodRecord{ .library = "USER32", .import = "UnregisterClassW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x82\x29" } },
    .{ "GetClassInfoA", MethodRecord{ .library = "USER32", .import = "GetClassInfoA", .signature = "\x00\x03\x11\x59\x11\x82\x29\x11\x3d\x0f\x11\xc0\x00\x47\xc9" } },
    .{ "GetClassInfoW", MethodRecord{ .library = "USER32", .import = "GetClassInfoW", .signature = "\x00\x03\x11\x59\x11\x82\x29\x11\x05\x0f\x11\xc0\x00\x47\xcd" } },
    .{ "RegisterClassExA", MethodRecord{ .library = "USER32", .import = "RegisterClassExA", .signature = "\x00\x01\x07\x0f\x11\xc0\x00\x47\xd1" } },
    .{ "RegisterClassExW", MethodRecord{ .library = "USER32", .import = "RegisterClassExW", .signature = "\x00\x01\x07\x0f\x11\xc0\x00\x47\xd5" } },
    .{ "GetClassInfoExA", MethodRecord{ .library = "USER32", .import = "GetClassInfoExA", .signature = "\x00\x03\x11\x59\x11\x82\x29\x11\x3d\x0f\x11\xc0\x00\x47\xd1" } },
    .{ "GetClassInfoExW", MethodRecord{ .library = "USER32", .import = "GetClassInfoExW", .signature = "\x00\x03\x11\x59\x11\x82\x29\x11\x05\x0f\x11\xc0\x00\x47\xd5" } },
    .{ "CreateWindowExA", MethodRecord{ .library = "USER32", .import = "CreateWindowExA", .signature = "\x00\x0c\x11\x25\x11\x93\x45\x11\x3d\x11\x3d\x11\x93\x41\x08\x08\x08\x08\x11\x25\x11\x83\x91\x11\x82\x29\x0f\x01" } },
    .{ "CreateWindowExW", MethodRecord{ .library = "USER32", .import = "CreateWindowExW", .signature = "\x00\x0c\x11\x25\x11\x93\x45\x11\x05\x11\x05\x11\x93\x41\x08\x08\x08\x08\x11\x25\x11\x83\x91\x11\x82\x29\x0f\x01" } },
    .{ "IsWindow", MethodRecord{ .library = "USER32", .import = "IsWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "IsMenu", MethodRecord{ .library = "USER32", .import = "IsMenu", .signature = "\x00\x01\x11\x59\x11\x83\x91" } },
    .{ "IsChild", MethodRecord{ .library = "USER32", .import = "IsChild", .signature = "\x00\x02\x11\x59\x11\x25\x11\x25" } },
    .{ "DestroyWindow", MethodRecord{ .library = "USER32", .import = "DestroyWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "ShowWindow", MethodRecord{ .library = "USER32", .import = "ShowWindow", .signature = "\x00\x02\x11\x59\x11\x25\x11\x9e\xf1" } },
    .{ "AnimateWindow", MethodRecord{ .library = "USER32", .import = "AnimateWindow", .signature = "\x00\x03\x11\x59\x11\x25\x09\x11\xa7\x61" } },
    .{ "UpdateLayeredWindow", MethodRecord{ .library = "USER32", .import = "UpdateLayeredWindow", .signature = "\x00\x09\x11\x59\x11\x25\x11\x83\x5d\x0f\x11\x83\x71\x0f\x11\x83\xe9\x11\x83\x5d\x0f\x11\x83\x71\x11\x83\x59\x0f\x11\x8e\x29\x11\xa7\x59" } },
    .{ "UpdateLayeredWindowIndirect", MethodRecord{ .library = "USER32", .import = "UpdateLayeredWindowIndirect", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x47\xd9" } },
    .{ "GetLayeredWindowAttributes", MethodRecord{ .library = "USER32", .import = "GetLayeredWindowAttributes", .signature = "\x00\x04\x11\x59\x11\x25\x0f\x11\x83\x59\x0f\x05\x0f\x11\xa7\x89" } },
    .{ "SetLayeredWindowAttributes", MethodRecord{ .library = "USER32", .import = "SetLayeredWindowAttributes", .signature = "\x00\x04\x11\x59\x11\x25\x11\x83\x59\x05\x11\xa7\x89" } },
    .{ "ShowWindowAsync", MethodRecord{ .library = "USER32", .import = "ShowWindowAsync", .signature = "\x00\x02\x11\x59\x11\x25\x11\x9e\xf1" } },
    .{ "FlashWindow", MethodRecord{ .library = "USER32", .import = "FlashWindow", .signature = "\x00\x02\x11\x59\x11\x25\x11\x59" } },
    .{ "FlashWindowEx", MethodRecord{ .library = "USER32", .import = "FlashWindowEx", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\xdd" } },
    .{ "ShowOwnedPopups", MethodRecord{ .library = "USER32", .import = "ShowOwnedPopups", .signature = "\x00\x02\x11\x59\x11\x25\x11\x59" } },
    .{ "OpenIcon", MethodRecord{ .library = "USER32", .import = "OpenIcon", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "CloseWindow", MethodRecord{ .library = "USER32", .import = "CloseWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "MoveWindow", MethodRecord{ .library = "USER32", .import = "MoveWindow", .signature = "\x00\x06\x11\x59\x11\x25\x08\x08\x08\x08\x11\x59" } },
    .{ "SetWindowPos", MethodRecord{ .library = "USER32", .import = "SetWindowPos", .signature = "\x00\x07\x11\x59\x11\x25\x11\x25\x08\x08\x08\x08\x11\xa7\x75" } },
    .{ "GetWindowPlacement", MethodRecord{ .library = "USER32", .import = "GetWindowPlacement", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x47\xe1" } },
    .{ "SetWindowPlacement", MethodRecord{ .library = "USER32", .import = "SetWindowPlacement", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x47\xe1" } },
    .{ "GetWindowDisplayAffinity", MethodRecord{ .library = "USER32", .import = "GetWindowDisplayAffinity", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x09" } },
    .{ "SetWindowDisplayAffinity", MethodRecord{ .library = "USER32", .import = "SetWindowDisplayAffinity", .signature = "\x00\x02\x11\x59\x11\x25\x11\xa7\xa1" } },
    .{ "BeginDeferWindowPos", MethodRecord{ .library = "USER32", .import = "BeginDeferWindowPos", .signature = "\x00\x01\x11\xc0\x00\x47\xe5\x08" } },
    .{ "DeferWindowPos", MethodRecord{ .library = "USER32", .import = "DeferWindowPos", .signature = "\x00\x08\x11\xc0\x00\x47\xe5\x11\xc0\x00\x47\xe5\x11\x25\x11\x25\x08\x08\x08\x08\x11\xa7\x75" } },
    .{ "EndDeferWindowPos", MethodRecord{ .library = "USER32", .import = "EndDeferWindowPos", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\xe5" } },
    .{ "IsWindowVisible", MethodRecord{ .library = "USER32", .import = "IsWindowVisible", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "IsIconic", MethodRecord{ .library = "USER32", .import = "IsIconic", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "AnyPopup", MethodRecord{ .library = "USER32", .import = "AnyPopup", .signature = "\x00\x00\x11\x59" } },
    .{ "BringWindowToTop", MethodRecord{ .library = "USER32", .import = "BringWindowToTop", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "IsZoomed", MethodRecord{ .library = "USER32", .import = "IsZoomed", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "CreateDialogParamA", MethodRecord{ .library = "USER32", .import = "CreateDialogParamA", .signature = "\x00\x05\x11\x25\x11\x82\x29\x11\x3d\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "CreateDialogParamW", MethodRecord{ .library = "USER32", .import = "CreateDialogParamW", .signature = "\x00\x05\x11\x25\x11\x82\x29\x11\x05\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "CreateDialogIndirectParamA", MethodRecord{ .library = "USER32", .import = "CreateDialogIndirectParamA", .signature = "\x00\x05\x11\x25\x11\x82\x29\x0f\x11\xc0\x00\x47\xed\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "CreateDialogIndirectParamW", MethodRecord{ .library = "USER32", .import = "CreateDialogIndirectParamW", .signature = "\x00\x05\x11\x25\x11\x82\x29\x0f\x11\xc0\x00\x47\xed\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "DialogBoxParamA", MethodRecord{ .library = "USER32", .import = "DialogBoxParamA", .signature = "\x00\x05\x18\x11\x82\x29\x11\x3d\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "DialogBoxParamW", MethodRecord{ .library = "USER32", .import = "DialogBoxParamW", .signature = "\x00\x05\x18\x11\x82\x29\x11\x05\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "DialogBoxIndirectParamA", MethodRecord{ .library = "USER32", .import = "DialogBoxIndirectParamA", .signature = "\x00\x05\x18\x11\x82\x29\x0f\x11\xc0\x00\x47\xed\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "DialogBoxIndirectParamW", MethodRecord{ .library = "USER32", .import = "DialogBoxIndirectParamW", .signature = "\x00\x05\x18\x11\x82\x29\x0f\x11\xc0\x00\x47\xed\x11\x25\x12\xc0\x00\x47\xe9\x11\x82\x2d" } },
    .{ "EndDialog", MethodRecord{ .library = "USER32", .import = "EndDialog", .signature = "\x00\x02\x11\x59\x11\x25\x18" } },
    .{ "GetDlgItem", MethodRecord{ .library = "USER32", .import = "GetDlgItem", .signature = "\x00\x02\x11\x25\x11\x25\x08" } },
    .{ "SetDlgItemInt", MethodRecord{ .library = "USER32", .import = "SetDlgItemInt", .signature = "\x00\x04\x11\x59\x11\x25\x08\x09\x11\x59" } },
    .{ "GetDlgItemInt", MethodRecord{ .library = "USER32", .import = "GetDlgItemInt", .signature = "\x00\x04\x09\x11\x25\x08\x0f\x11\x59\x11\x59" } },
    .{ "SetDlgItemTextA", MethodRecord{ .library = "USER32", .import = "SetDlgItemTextA", .signature = "\x00\x03\x11\x59\x11\x25\x08\x11\x3d" } },
    .{ "SetDlgItemTextW", MethodRecord{ .library = "USER32", .import = "SetDlgItemTextW", .signature = "\x00\x03\x11\x59\x11\x25\x08\x11\x05" } },
    .{ "GetDlgItemTextA", MethodRecord{ .library = "USER32", .import = "GetDlgItemTextA", .signature = "\x00\x04\x09\x11\x25\x08\x11\x3d\x08" } },
    .{ "GetDlgItemTextW", MethodRecord{ .library = "USER32", .import = "GetDlgItemTextW", .signature = "\x00\x04\x09\x11\x25\x08\x11\x05\x08" } },
    .{ "SendDlgItemMessageA", MethodRecord{ .library = "USER32", .import = "SendDlgItemMessageA", .signature = "\x00\x05\x11\x82\x35\x11\x25\x08\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SendDlgItemMessageW", MethodRecord{ .library = "USER32", .import = "SendDlgItemMessageW", .signature = "\x00\x05\x11\x82\x35\x11\x25\x08\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "GetNextDlgGroupItem", MethodRecord{ .library = "USER32", .import = "GetNextDlgGroupItem", .signature = "\x00\x03\x11\x25\x11\x25\x11\x25\x11\x59" } },
    .{ "GetNextDlgTabItem", MethodRecord{ .library = "USER32", .import = "GetNextDlgTabItem", .signature = "\x00\x03\x11\x25\x11\x25\x11\x25\x11\x59" } },
    .{ "GetDlgCtrlID", MethodRecord{ .library = "USER32", .import = "GetDlgCtrlID", .signature = "\x00\x01\x08\x11\x25" } },
    .{ "GetDialogBaseUnits", MethodRecord{ .library = "USER32", .import = "GetDialogBaseUnits", .signature = "\x00\x00\x08" } },
    .{ "DefDlgProcA", MethodRecord{ .library = "USER32", .import = "DefDlgProcA", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "DefDlgProcW", MethodRecord{ .library = "USER32", .import = "DefDlgProcW", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "CallMsgFilterA", MethodRecord{ .library = "USER32", .import = "CallMsgFilterA", .signature = "\x00\x02\x11\x59\x0f\x11\x99\xe9\x08" } },
    .{ "CallMsgFilterW", MethodRecord{ .library = "USER32", .import = "CallMsgFilterW", .signature = "\x00\x02\x11\x59\x0f\x11\x99\xe9\x08" } },
    .{ "CharToOemA", MethodRecord{ .library = "USER32", .import = "CharToOemA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "CharToOemW", MethodRecord{ .library = "USER32", .import = "CharToOemW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x3d" } },
    .{ "OemToCharA", MethodRecord{ .library = "USER32", .import = "OemToCharA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "OemToCharW", MethodRecord{ .library = "USER32", .import = "OemToCharW", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x05" } },
    .{ "CharToOemBuffA", MethodRecord{ .library = "USER32", .import = "CharToOemBuffA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "CharToOemBuffW", MethodRecord{ .library = "USER32", .import = "CharToOemBuffW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x3d\x09" } },
    .{ "OemToCharBuffA", MethodRecord{ .library = "USER32", .import = "OemToCharBuffA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "OemToCharBuffW", MethodRecord{ .library = "USER32", .import = "OemToCharBuffW", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x05\x09" } },
    .{ "CharUpperA", MethodRecord{ .library = "USER32", .import = "CharUpperA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "CharUpperW", MethodRecord{ .library = "USER32", .import = "CharUpperW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "CharUpperBuffA", MethodRecord{ .library = "USER32", .import = "CharUpperBuffA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "CharUpperBuffW", MethodRecord{ .library = "USER32", .import = "CharUpperBuffW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "CharLowerA", MethodRecord{ .library = "USER32", .import = "CharLowerA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "CharLowerW", MethodRecord{ .library = "USER32", .import = "CharLowerW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "CharLowerBuffA", MethodRecord{ .library = "USER32", .import = "CharLowerBuffA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "CharLowerBuffW", MethodRecord{ .library = "USER32", .import = "CharLowerBuffW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "CharNextA", MethodRecord{ .library = "USER32", .import = "CharNextA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "CharNextW", MethodRecord{ .library = "USER32", .import = "CharNextW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "CharPrevA", MethodRecord{ .library = "USER32", .import = "CharPrevA", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "CharPrevW", MethodRecord{ .library = "USER32", .import = "CharPrevW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "CharNextExA", MethodRecord{ .library = "USER32", .import = "CharNextExA", .signature = "\x00\x03\x11\x3d\x07\x11\x3d\x09" } },
    .{ "CharPrevExA", MethodRecord{ .library = "USER32", .import = "CharPrevExA", .signature = "\x00\x04\x11\x3d\x07\x11\x3d\x11\x3d\x09" } },
    .{ "IsCharAlphaA", MethodRecord{ .library = "USER32", .import = "IsCharAlphaA", .signature = "\x00\x01\x11\x59\x11\x8d\x5d" } },
    .{ "IsCharAlphaW", MethodRecord{ .library = "USER32", .import = "IsCharAlphaW", .signature = "\x00\x01\x11\x59\x03" } },
    .{ "IsCharAlphaNumericA", MethodRecord{ .library = "USER32", .import = "IsCharAlphaNumericA", .signature = "\x00\x01\x11\x59\x11\x8d\x5d" } },
    .{ "IsCharAlphaNumericW", MethodRecord{ .library = "USER32", .import = "IsCharAlphaNumericW", .signature = "\x00\x01\x11\x59\x03" } },
    .{ "IsCharUpperA", MethodRecord{ .library = "USER32", .import = "IsCharUpperA", .signature = "\x00\x01\x11\x59\x11\x8d\x5d" } },
    .{ "IsCharUpperW", MethodRecord{ .library = "USER32", .import = "IsCharUpperW", .signature = "\x00\x01\x11\x59\x03" } },
    .{ "IsCharLowerA", MethodRecord{ .library = "USER32", .import = "IsCharLowerA", .signature = "\x00\x01\x11\x59\x11\x8d\x5d" } },
    .{ "IsCharLowerW", MethodRecord{ .library = "USER32", .import = "IsCharLowerW", .signature = "\x00\x01\x11\x59\x03" } },
    .{ "GetInputState", MethodRecord{ .library = "USER32", .import = "GetInputState", .signature = "\x00\x00\x11\x59" } },
    .{ "GetQueueStatus", MethodRecord{ .library = "USER32", .import = "GetQueueStatus", .signature = "\x00\x01\x09\x11\xa7\x7d" } },
    .{ "MsgWaitForMultipleObjects", MethodRecord{ .library = "USER32", .import = "MsgWaitForMultipleObjects", .signature = "\x00\x05\x11\x8d\x15\x09\x0f\x11\x80\x85\x11\x59\x09\x11\xa7\x7d" } },
    .{ "MsgWaitForMultipleObjectsEx", MethodRecord{ .library = "USER32", .import = "MsgWaitForMultipleObjectsEx", .signature = "\x00\x05\x11\x8d\x15\x09\x0f\x11\x80\x85\x09\x11\xa7\x7d\x11\xa7\x79" } },
    .{ "SetTimer", MethodRecord{ .library = "USER32", .import = "SetTimer", .signature = "\x00\x04\x19\x11\x25\x19\x09\x12\xc0\x00\x47\xf1" } },
    .{ "SetCoalescableTimer", MethodRecord{ .library = "USER32", .import = "SetCoalescableTimer", .signature = "\x00\x05\x19\x11\x25\x19\x09\x12\xc0\x00\x47\xf1\x09" } },
    .{ "KillTimer", MethodRecord{ .library = "USER32", .import = "KillTimer", .signature = "\x00\x02\x11\x59\x11\x25\x19" } },
    .{ "IsWindowUnicode", MethodRecord{ .library = "USER32", .import = "IsWindowUnicode", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "LoadAcceleratorsA", MethodRecord{ .library = "USER32", .import = "LoadAcceleratorsA", .signature = "\x00\x02\x11\x9a\x05\x11\x82\x29\x11\x3d" } },
    .{ "LoadAcceleratorsW", MethodRecord{ .library = "USER32", .import = "LoadAcceleratorsW", .signature = "\x00\x02\x11\x9a\x05\x11\x82\x29\x11\x05" } },
    .{ "CreateAcceleratorTableA", MethodRecord{ .library = "USER32", .import = "CreateAcceleratorTableA", .signature = "\x00\x02\x11\x9a\x05\x0f\x11\xc0\x00\x47\xf5\x08" } },
    .{ "CreateAcceleratorTableW", MethodRecord{ .library = "USER32", .import = "CreateAcceleratorTableW", .signature = "\x00\x02\x11\x9a\x05\x0f\x11\xc0\x00\x47\xf5\x08" } },
    .{ "DestroyAcceleratorTable", MethodRecord{ .library = "USER32", .import = "DestroyAcceleratorTable", .signature = "\x00\x01\x11\x59\x11\x9a\x05" } },
    .{ "CopyAcceleratorTableA", MethodRecord{ .library = "USER32", .import = "CopyAcceleratorTableA", .signature = "\x00\x03\x08\x11\x9a\x05\x0f\x11\xc0\x00\x47\xf5\x08" } },
    .{ "CopyAcceleratorTableW", MethodRecord{ .library = "USER32", .import = "CopyAcceleratorTableW", .signature = "\x00\x03\x08\x11\x9a\x05\x0f\x11\xc0\x00\x47\xf5\x08" } },
    .{ "TranslateAcceleratorA", MethodRecord{ .library = "USER32", .import = "TranslateAcceleratorA", .signature = "\x00\x03\x08\x11\x25\x11\x9a\x05\x0f\x11\x99\xe9" } },
    .{ "TranslateAcceleratorW", MethodRecord{ .library = "USER32", .import = "TranslateAcceleratorW", .signature = "\x00\x03\x08\x11\x25\x11\x9a\x05\x0f\x11\x99\xe9" } },
    .{ "GetSystemMetrics", MethodRecord{ .library = "USER32", .import = "GetSystemMetrics", .signature = "\x00\x01\x08\x11\x93\x3d" } },
    .{ "LoadMenuA", MethodRecord{ .library = "USER32", .import = "LoadMenuA", .signature = "\x00\x02\x11\x83\x91\x11\x82\x29\x11\x3d" } },
    .{ "LoadMenuW", MethodRecord{ .library = "USER32", .import = "LoadMenuW", .signature = "\x00\x02\x11\x83\x91\x11\x82\x29\x11\x05" } },
    .{ "LoadMenuIndirectA", MethodRecord{ .library = "USER32", .import = "LoadMenuIndirectA", .signature = "\x00\x01\x11\x83\x91\x0f\x01" } },
    .{ "LoadMenuIndirectW", MethodRecord{ .library = "USER32", .import = "LoadMenuIndirectW", .signature = "\x00\x01\x11\x83\x91\x0f\x01" } },
    .{ "GetMenu", MethodRecord{ .library = "USER32", .import = "GetMenu", .signature = "\x00\x01\x11\x83\x91\x11\x25" } },
    .{ "SetMenu", MethodRecord{ .library = "USER32", .import = "SetMenu", .signature = "\x00\x02\x11\x59\x11\x25\x11\x83\x91" } },
    .{ "ChangeMenuA", MethodRecord{ .library = "USER32", .import = "ChangeMenuA", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x11\x3d\x09\x09" } },
    .{ "ChangeMenuW", MethodRecord{ .library = "USER32", .import = "ChangeMenuW", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x11\x05\x09\x09" } },
    .{ "HiliteMenuItem", MethodRecord{ .library = "USER32", .import = "HiliteMenuItem", .signature = "\x00\x04\x11\x59\x11\x25\x11\x83\x91\x09\x09" } },
    .{ "GetMenuStringA", MethodRecord{ .library = "USER32", .import = "GetMenuStringA", .signature = "\x00\x05\x08\x11\x83\x91\x09\x11\x3d\x08\x11\xa7\x35" } },
    .{ "GetMenuStringW", MethodRecord{ .library = "USER32", .import = "GetMenuStringW", .signature = "\x00\x05\x08\x11\x83\x91\x09\x11\x05\x08\x11\xa7\x35" } },
    .{ "GetMenuState", MethodRecord{ .library = "USER32", .import = "GetMenuState", .signature = "\x00\x03\x09\x11\x83\x91\x09\x11\xa7\x35" } },
    .{ "DrawMenuBar", MethodRecord{ .library = "USER32", .import = "DrawMenuBar", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "GetSystemMenu", MethodRecord{ .library = "USER32", .import = "GetSystemMenu", .signature = "\x00\x02\x11\x83\x91\x11\x25\x11\x59" } },
    .{ "CreateMenu", MethodRecord{ .library = "USER32", .import = "CreateMenu", .signature = "\x00\x00\x11\x83\x91" } },
    .{ "CreatePopupMenu", MethodRecord{ .library = "USER32", .import = "CreatePopupMenu", .signature = "\x00\x00\x11\x83\x91" } },
    .{ "DestroyMenu", MethodRecord{ .library = "USER32", .import = "DestroyMenu", .signature = "\x00\x01\x11\x59\x11\x83\x91" } },
    .{ "CheckMenuItem", MethodRecord{ .library = "USER32", .import = "CheckMenuItem", .signature = "\x00\x03\x09\x11\x83\x91\x09\x09" } },
    .{ "EnableMenuItem", MethodRecord{ .library = "USER32", .import = "EnableMenuItem", .signature = "\x00\x03\x11\x59\x11\x83\x91\x09\x11\xa7\x35" } },
    .{ "GetSubMenu", MethodRecord{ .library = "USER32", .import = "GetSubMenu", .signature = "\x00\x02\x11\x83\x91\x11\x83\x91\x08" } },
    .{ "GetMenuItemID", MethodRecord{ .library = "USER32", .import = "GetMenuItemID", .signature = "\x00\x02\x09\x11\x83\x91\x08" } },
    .{ "GetMenuItemCount", MethodRecord{ .library = "USER32", .import = "GetMenuItemCount", .signature = "\x00\x01\x08\x11\x83\x91" } },
    .{ "InsertMenuA", MethodRecord{ .library = "USER32", .import = "InsertMenuA", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x11\xa7\x35\x19\x11\x3d" } },
    .{ "InsertMenuW", MethodRecord{ .library = "USER32", .import = "InsertMenuW", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x11\xa7\x35\x19\x11\x05" } },
    .{ "AppendMenuA", MethodRecord{ .library = "USER32", .import = "AppendMenuA", .signature = "\x00\x04\x11\x59\x11\x83\x91\x11\xa7\x35\x19\x11\x3d" } },
    .{ "AppendMenuW", MethodRecord{ .library = "USER32", .import = "AppendMenuW", .signature = "\x00\x04\x11\x59\x11\x83\x91\x11\xa7\x35\x19\x11\x05" } },
    .{ "ModifyMenuA", MethodRecord{ .library = "USER32", .import = "ModifyMenuA", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x11\xa7\x35\x19\x11\x3d" } },
    .{ "ModifyMenuW", MethodRecord{ .library = "USER32", .import = "ModifyMenuW", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x11\xa7\x35\x19\x11\x05" } },
    .{ "RemoveMenu", MethodRecord{ .library = "USER32", .import = "RemoveMenu", .signature = "\x00\x03\x11\x59\x11\x83\x91\x09\x11\xa7\x35" } },
    .{ "DeleteMenu", MethodRecord{ .library = "USER32", .import = "DeleteMenu", .signature = "\x00\x03\x11\x59\x11\x83\x91\x09\x11\xa7\x35" } },
    .{ "SetMenuItemBitmaps", MethodRecord{ .library = "USER32", .import = "SetMenuItemBitmaps", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x11\xa7\x35\x11\x83\x51\x11\x83\x51" } },
    .{ "GetMenuCheckMarkDimensions", MethodRecord{ .library = "USER32", .import = "GetMenuCheckMarkDimensions", .signature = "\x00\x00\x08" } },
    .{ "TrackPopupMenu", MethodRecord{ .library = "USER32", .import = "TrackPopupMenu", .signature = "\x00\x07\x11\x59\x11\x83\x91\x11\xa7\x45\x08\x08\x08\x11\x25\x0f\x11\x83\x89" } },
    .{ "TrackPopupMenuEx", MethodRecord{ .library = "USER32", .import = "TrackPopupMenuEx", .signature = "\x00\x06\x11\x59\x11\x83\x91\x09\x08\x08\x11\x25\x0f\x11\xc0\x00\x47\xf9" } },
    .{ "CalculatePopupWindowPosition", MethodRecord{ .library = "USER32", .import = "CalculatePopupWindowPosition", .signature = "\x00\x05\x11\x59\x0f\x11\x83\x71\x0f\x11\x83\xe9\x09\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "GetMenuInfo", MethodRecord{ .library = "USER32", .import = "GetMenuInfo", .signature = "\x00\x02\x11\x59\x11\x83\x91\x0f\x11\xc0\x00\x47\xfd" } },
    .{ "SetMenuInfo", MethodRecord{ .library = "USER32", .import = "SetMenuInfo", .signature = "\x00\x02\x11\x59\x11\x83\x91\x0f\x11\xc0\x00\x47\xfd" } },
    .{ "EndMenu", MethodRecord{ .library = "USER32", .import = "EndMenu", .signature = "\x00\x00\x11\x59" } },
    .{ "InsertMenuItemA", MethodRecord{ .library = "USER32", .import = "InsertMenuItemA", .signature = "\x00\x04\x11\x59\x11\x83\x91\x09\x11\x59\x0f\x11\xc0\x00\x48\x01" } },
    .{ "InsertMenuItemW", MethodRecord{ .library = "USER32", .import = "InsertMenuItemW", .signature = "\x00\x04\x11\x59\x11\x83\x91\x09\x11\x59\x0f\x11\xc0\x00\x48\x05" } },
    .{ "GetMenuItemInfoA", MethodRecord{ .library = "USER32", .import = "GetMenuItemInfoA", .signature = "\x00\x04\x11\x59\x11\x83\x91\x09\x11\x59\x0f\x11\xc0\x00\x48\x01" } },
    .{ "GetMenuItemInfoW", MethodRecord{ .library = "USER32", .import = "GetMenuItemInfoW", .signature = "\x00\x04\x11\x59\x11\x83\x91\x09\x11\x59\x0f\x11\xc0\x00\x48\x05" } },
    .{ "SetMenuItemInfoA", MethodRecord{ .library = "USER32", .import = "SetMenuItemInfoA", .signature = "\x00\x04\x11\x59\x11\x83\x91\x09\x11\x59\x0f\x11\xc0\x00\x48\x01" } },
    .{ "SetMenuItemInfoW", MethodRecord{ .library = "USER32", .import = "SetMenuItemInfoW", .signature = "\x00\x04\x11\x59\x11\x83\x91\x09\x11\x59\x0f\x11\xc0\x00\x48\x05" } },
    .{ "GetMenuDefaultItem", MethodRecord{ .library = "USER32", .import = "GetMenuDefaultItem", .signature = "\x00\x03\x09\x11\x83\x91\x09\x11\xa7\xb1" } },
    .{ "SetMenuDefaultItem", MethodRecord{ .library = "USER32", .import = "SetMenuDefaultItem", .signature = "\x00\x03\x11\x59\x11\x83\x91\x09\x09" } },
    .{ "GetMenuItemRect", MethodRecord{ .library = "USER32", .import = "GetMenuItemRect", .signature = "\x00\x04\x11\x59\x11\x25\x11\x83\x91\x09\x0f\x11\x83\x89" } },
    .{ "MenuItemFromPoint", MethodRecord{ .library = "USER32", .import = "MenuItemFromPoint", .signature = "\x00\x03\x08\x11\x25\x11\x83\x91\x11\x83\x71" } },
    .{ "DragObject", MethodRecord{ .library = "USER32", .import = "DragObject", .signature = "\x00\x05\x09\x11\x25\x11\x25\x09\x19\x11\x9a\x2d" } },
    .{ "DrawIcon", MethodRecord{ .library = "USER32", .import = "DrawIcon", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x11\x83\x55" } },
    .{ "GetForegroundWindow", MethodRecord{ .library = "USER32", .import = "GetForegroundWindow", .signature = "\x00\x00\x11\x25" } },
    .{ "SwitchToThisWindow", MethodRecord{ .library = "USER32", .import = "SwitchToThisWindow", .signature = "\x00\x02\x01\x11\x25\x11\x59" } },
    .{ "SetForegroundWindow", MethodRecord{ .library = "USER32", .import = "SetForegroundWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "AllowSetForegroundWindow", MethodRecord{ .library = "USER32", .import = "AllowSetForegroundWindow", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "LockSetForegroundWindow", MethodRecord{ .library = "USER32", .import = "LockSetForegroundWindow", .signature = "\x00\x01\x11\x59\x11\xa7\xa5" } },
    .{ "ScrollWindow", MethodRecord{ .library = "USER32", .import = "ScrollWindow", .signature = "\x00\x05\x11\x59\x11\x25\x08\x08\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "ScrollDC", MethodRecord{ .library = "USER32", .import = "ScrollDC", .signature = "\x00\x07\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x89\x0f\x11\x83\x89\x11\x83\xe1\x0f\x11\x83\x89" } },
    .{ "ScrollWindowEx", MethodRecord{ .library = "USER32", .import = "ScrollWindowEx", .signature = "\x00\x08\x08\x11\x25\x08\x08\x0f\x11\x83\x89\x0f\x11\x83\x89\x11\x83\xe1\x0f\x11\x83\x89\x11\xa7\x3d" } },
    .{ "GetScrollPos", MethodRecord{ .library = "USER32", .import = "GetScrollPos", .signature = "\x00\x02\x08\x11\x25\x11\x83\xb5" } },
    .{ "GetScrollRange", MethodRecord{ .library = "USER32", .import = "GetScrollRange", .signature = "\x00\x04\x11\x59\x11\x25\x11\x83\xb5\x0f\x08\x0f\x08" } },
    .{ "SetPropA", MethodRecord{ .library = "USER32", .import = "SetPropA", .signature = "\x00\x03\x11\x59\x11\x25\x11\x3d\x11\x80\x85" } },
    .{ "SetPropW", MethodRecord{ .library = "USER32", .import = "SetPropW", .signature = "\x00\x03\x11\x59\x11\x25\x11\x05\x11\x80\x85" } },
    .{ "GetPropA", MethodRecord{ .library = "USER32", .import = "GetPropA", .signature = "\x00\x02\x11\x80\x85\x11\x25\x11\x3d" } },
    .{ "GetPropW", MethodRecord{ .library = "USER32", .import = "GetPropW", .signature = "\x00\x02\x11\x80\x85\x11\x25\x11\x05" } },
    .{ "RemovePropA", MethodRecord{ .library = "USER32", .import = "RemovePropA", .signature = "\x00\x02\x11\x80\x85\x11\x25\x11\x3d" } },
    .{ "RemovePropW", MethodRecord{ .library = "USER32", .import = "RemovePropW", .signature = "\x00\x02\x11\x80\x85\x11\x25\x11\x05" } },
    .{ "EnumPropsExA", MethodRecord{ .library = "USER32", .import = "EnumPropsExA", .signature = "\x00\x03\x08\x11\x25\x12\xc0\x00\x48\x09\x11\x82\x2d" } },
    .{ "EnumPropsExW", MethodRecord{ .library = "USER32", .import = "EnumPropsExW", .signature = "\x00\x03\x08\x11\x25\x12\xc0\x00\x48\x0d\x11\x82\x2d" } },
    .{ "EnumPropsA", MethodRecord{ .library = "USER32", .import = "EnumPropsA", .signature = "\x00\x02\x08\x11\x25\x12\xc0\x00\x48\x11" } },
    .{ "EnumPropsW", MethodRecord{ .library = "USER32", .import = "EnumPropsW", .signature = "\x00\x02\x08\x11\x25\x12\xc0\x00\x48\x15" } },
    .{ "SetWindowTextA", MethodRecord{ .library = "USER32", .import = "SetWindowTextA", .signature = "\x00\x02\x11\x59\x11\x25\x11\x3d" } },
    .{ "SetWindowTextW", MethodRecord{ .library = "USER32", .import = "SetWindowTextW", .signature = "\x00\x02\x11\x59\x11\x25\x11\x05" } },
    .{ "GetWindowTextA", MethodRecord{ .library = "USER32", .import = "GetWindowTextA", .signature = "\x00\x03\x08\x11\x25\x11\x3d\x08" } },
    .{ "GetWindowTextW", MethodRecord{ .library = "USER32", .import = "GetWindowTextW", .signature = "\x00\x03\x08\x11\x25\x11\x05\x08" } },
    .{ "GetWindowTextLengthA", MethodRecord{ .library = "USER32", .import = "GetWindowTextLengthA", .signature = "\x00\x01\x08\x11\x25" } },
    .{ "GetWindowTextLengthW", MethodRecord{ .library = "USER32", .import = "GetWindowTextLengthW", .signature = "\x00\x01\x08\x11\x25" } },
    .{ "GetClientRect", MethodRecord{ .library = "USER32", .import = "GetClientRect", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x89" } },
    .{ "GetWindowRect", MethodRecord{ .library = "USER32", .import = "GetWindowRect", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x89" } },
    .{ "AdjustWindowRect", MethodRecord{ .library = "USER32", .import = "AdjustWindowRect", .signature = "\x00\x03\x11\x59\x0f\x11\x83\x89\x11\x93\x41\x11\x59" } },
    .{ "AdjustWindowRectEx", MethodRecord{ .library = "USER32", .import = "AdjustWindowRectEx", .signature = "\x00\x04\x11\x59\x0f\x11\x83\x89\x11\x93\x41\x11\x59\x11\x93\x45" } },
    .{ "MessageBoxA", MethodRecord{ .library = "USER32", .import = "MessageBoxA", .signature = "\x00\x04\x11\x9a\xd9\x11\x25\x11\x3d\x11\x3d\x11\x89\x29" } },
    .{ "MessageBoxW", MethodRecord{ .library = "USER32", .import = "MessageBoxW", .signature = "\x00\x04\x11\x9a\xd9\x11\x25\x11\x05\x11\x05\x11\x89\x29" } },
    .{ "MessageBoxExA", MethodRecord{ .library = "USER32", .import = "MessageBoxExA", .signature = "\x00\x05\x11\x9a\xd9\x11\x25\x11\x3d\x11\x3d\x11\x89\x29\x07" } },
    .{ "MessageBoxExW", MethodRecord{ .library = "USER32", .import = "MessageBoxExW", .signature = "\x00\x05\x11\x9a\xd9\x11\x25\x11\x05\x11\x05\x11\x89\x29\x07" } },
    .{ "MessageBoxIndirectA", MethodRecord{ .library = "USER32", .import = "MessageBoxIndirectA", .signature = "\x00\x01\x11\x9a\xd9\x0f\x11\xc0\x00\x48\x19" } },
    .{ "MessageBoxIndirectW", MethodRecord{ .library = "USER32", .import = "MessageBoxIndirectW", .signature = "\x00\x01\x11\x9a\xd9\x0f\x11\xc0\x00\x48\x1d" } },
    .{ "ShowCursor", MethodRecord{ .library = "USER32", .import = "ShowCursor", .signature = "\x00\x01\x08\x11\x59" } },
    .{ "SetCursorPos", MethodRecord{ .library = "USER32", .import = "SetCursorPos", .signature = "\x00\x02\x11\x59\x08\x08" } },
    .{ "SetPhysicalCursorPos", MethodRecord{ .library = "USER32", .import = "SetPhysicalCursorPos", .signature = "\x00\x02\x11\x59\x08\x08" } },
    .{ "SetCursor", MethodRecord{ .library = "USER32", .import = "SetCursor", .signature = "\x00\x01\x11\x9a\x2d\x11\x9a\x2d" } },
    .{ "GetCursorPos", MethodRecord{ .library = "USER32", .import = "GetCursorPos", .signature = "\x00\x01\x11\x59\x0f\x11\x83\x71" } },
    .{ "GetPhysicalCursorPos", MethodRecord{ .library = "USER32", .import = "GetPhysicalCursorPos", .signature = "\x00\x01\x11\x59\x0f\x11\x83\x71" } },
    .{ "GetClipCursor", MethodRecord{ .library = "USER32", .import = "GetClipCursor", .signature = "\x00\x01\x11\x59\x0f\x11\x83\x89" } },
    .{ "GetCursor", MethodRecord{ .library = "USER32", .import = "GetCursor", .signature = "\x00\x00\x11\x9a\x2d" } },
    .{ "CreateCaret", MethodRecord{ .library = "USER32", .import = "CreateCaret", .signature = "\x00\x04\x11\x59\x11\x25\x11\x83\x51\x08\x08" } },
    .{ "GetCaretBlinkTime", MethodRecord{ .library = "USER32", .import = "GetCaretBlinkTime", .signature = "\x00\x00\x09" } },
    .{ "SetCaretBlinkTime", MethodRecord{ .library = "USER32", .import = "SetCaretBlinkTime", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "DestroyCaret", MethodRecord{ .library = "USER32", .import = "DestroyCaret", .signature = "\x00\x00\x11\x59" } },
    .{ "HideCaret", MethodRecord{ .library = "USER32", .import = "HideCaret", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "ShowCaret", MethodRecord{ .library = "USER32", .import = "ShowCaret", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "SetCaretPos", MethodRecord{ .library = "USER32", .import = "SetCaretPos", .signature = "\x00\x02\x11\x59\x08\x08" } },
    .{ "GetCaretPos", MethodRecord{ .library = "USER32", .import = "GetCaretPos", .signature = "\x00\x01\x11\x59\x0f\x11\x83\x71" } },
    .{ "LogicalToPhysicalPoint", MethodRecord{ .library = "USER32", .import = "LogicalToPhysicalPoint", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x71" } },
    .{ "PhysicalToLogicalPoint", MethodRecord{ .library = "USER32", .import = "PhysicalToLogicalPoint", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x71" } },
    .{ "WindowFromPoint", MethodRecord{ .library = "USER32", .import = "WindowFromPoint", .signature = "\x00\x01\x11\x25\x11\x83\x71" } },
    .{ "WindowFromPhysicalPoint", MethodRecord{ .library = "USER32", .import = "WindowFromPhysicalPoint", .signature = "\x00\x01\x11\x25\x11\x83\x71" } },
    .{ "ChildWindowFromPoint", MethodRecord{ .library = "USER32", .import = "ChildWindowFromPoint", .signature = "\x00\x02\x11\x25\x11\x25\x11\x83\x71" } },
    .{ "ClipCursor", MethodRecord{ .library = "USER32", .import = "ClipCursor", .signature = "\x00\x01\x11\x59\x0f\x11\x83\x89" } },
    .{ "ChildWindowFromPointEx", MethodRecord{ .library = "USER32", .import = "ChildWindowFromPointEx", .signature = "\x00\x03\x11\x25\x11\x25\x11\x83\x71\x11\xa7\x31" } },
    .{ "GetWindowWord", MethodRecord{ .library = "USER32", .import = "GetWindowWord", .signature = "\x00\x02\x07\x11\x25\x08" } },
    .{ "SetWindowWord", MethodRecord{ .library = "USER32", .import = "SetWindowWord", .signature = "\x00\x03\x07\x11\x25\x08\x07" } },
    .{ "GetWindowLongA", MethodRecord{ .library = "USER32", .import = "GetWindowLongA", .signature = "\x00\x02\x08\x11\x25\x11\xa7\x5d" } },
    .{ "GetWindowLongW", MethodRecord{ .library = "USER32", .import = "GetWindowLongW", .signature = "\x00\x02\x08\x11\x25\x11\xa7\x5d" } },
    .{ "SetWindowLongA", MethodRecord{ .library = "USER32", .import = "SetWindowLongA", .signature = "\x00\x03\x08\x11\x25\x11\xa7\x5d\x08" } },
    .{ "SetWindowLongW", MethodRecord{ .library = "USER32", .import = "SetWindowLongW", .signature = "\x00\x03\x08\x11\x25\x11\xa7\x5d\x08" } },
    .{ "GetClassWord", MethodRecord{ .library = "USER32", .import = "GetClassWord", .signature = "\x00\x02\x07\x11\x25\x08" } },
    .{ "SetClassWord", MethodRecord{ .library = "USER32", .import = "SetClassWord", .signature = "\x00\x03\x07\x11\x25\x08\x07" } },
    .{ "GetClassLongA", MethodRecord{ .library = "USER32", .import = "GetClassLongA", .signature = "\x00\x02\x09\x11\x25\x11\xa7\x55" } },
    .{ "GetClassLongW", MethodRecord{ .library = "USER32", .import = "GetClassLongW", .signature = "\x00\x02\x09\x11\x25\x11\xa7\x55" } },
    .{ "SetClassLongA", MethodRecord{ .library = "USER32", .import = "SetClassLongA", .signature = "\x00\x03\x09\x11\x25\x11\xa7\x55\x08" } },
    .{ "SetClassLongW", MethodRecord{ .library = "USER32", .import = "SetClassLongW", .signature = "\x00\x03\x09\x11\x25\x11\xa7\x55\x08" } },
    .{ "GetProcessDefaultLayout", MethodRecord{ .library = "USER32", .import = "GetProcessDefaultLayout", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "SetProcessDefaultLayout", MethodRecord{ .library = "USER32", .import = "SetProcessDefaultLayout", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetDesktopWindow", MethodRecord{ .library = "USER32", .import = "GetDesktopWindow", .signature = "\x00\x00\x11\x25" } },
    .{ "GetParent", MethodRecord{ .library = "USER32", .import = "GetParent", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "SetParent", MethodRecord{ .library = "USER32", .import = "SetParent", .signature = "\x00\x02\x11\x25\x11\x25\x11\x25" } },
    .{ "EnumChildWindows", MethodRecord{ .library = "USER32", .import = "EnumChildWindows", .signature = "\x00\x03\x11\x59\x11\x25\x12\xc0\x00\x48\x21\x11\x82\x2d" } },
    .{ "FindWindowA", MethodRecord{ .library = "USER32", .import = "FindWindowA", .signature = "\x00\x02\x11\x25\x11\x3d\x11\x3d" } },
    .{ "FindWindowW", MethodRecord{ .library = "USER32", .import = "FindWindowW", .signature = "\x00\x02\x11\x25\x11\x05\x11\x05" } },
    .{ "FindWindowExA", MethodRecord{ .library = "USER32", .import = "FindWindowExA", .signature = "\x00\x04\x11\x25\x11\x25\x11\x25\x11\x3d\x11\x3d" } },
    .{ "FindWindowExW", MethodRecord{ .library = "USER32", .import = "FindWindowExW", .signature = "\x00\x04\x11\x25\x11\x25\x11\x25\x11\x05\x11\x05" } },
    .{ "GetShellWindow", MethodRecord{ .library = "USER32", .import = "GetShellWindow", .signature = "\x00\x00\x11\x25" } },
    .{ "RegisterShellHookWindow", MethodRecord{ .library = "USER32", .import = "RegisterShellHookWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "DeregisterShellHookWindow", MethodRecord{ .library = "USER32", .import = "DeregisterShellHookWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "EnumWindows", MethodRecord{ .library = "USER32", .import = "EnumWindows", .signature = "\x00\x02\x11\x59\x12\xc0\x00\x48\x21\x11\x82\x2d" } },
    .{ "EnumThreadWindows", MethodRecord{ .library = "USER32", .import = "EnumThreadWindows", .signature = "\x00\x03\x11\x59\x09\x12\xc0\x00\x48\x21\x11\x82\x2d" } },
    .{ "GetClassNameA", MethodRecord{ .library = "USER32", .import = "GetClassNameA", .signature = "\x00\x03\x08\x11\x25\x11\x3d\x08" } },
    .{ "GetClassNameW", MethodRecord{ .library = "USER32", .import = "GetClassNameW", .signature = "\x00\x03\x08\x11\x25\x11\x05\x08" } },
    .{ "GetTopWindow", MethodRecord{ .library = "USER32", .import = "GetTopWindow", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "GetWindowThreadProcessId", MethodRecord{ .library = "USER32", .import = "GetWindowThreadProcessId", .signature = "\x00\x02\x09\x11\x25\x0f\x09" } },
    .{ "IsGUIThread", MethodRecord{ .library = "USER32", .import = "IsGUIThread", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "GetLastActivePopup", MethodRecord{ .library = "USER32", .import = "GetLastActivePopup", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "GetWindow", MethodRecord{ .library = "USER32", .import = "GetWindow", .signature = "\x00\x02\x11\x25\x11\x25\x11\xa7\x95" } },
    .{ "SetWindowsHookA", MethodRecord{ .library = "USER32", .import = "SetWindowsHookA", .signature = "\x00\x02\x11\xc0\x00\x48\x25\x08\x12\xc0\x00\x48\x29" } },
    .{ "SetWindowsHookW", MethodRecord{ .library = "USER32", .import = "SetWindowsHookW", .signature = "\x00\x02\x11\xc0\x00\x48\x25\x08\x12\xc0\x00\x48\x29" } },
    .{ "UnhookWindowsHook", MethodRecord{ .library = "USER32", .import = "UnhookWindowsHook", .signature = "\x00\x02\x11\x59\x08\x12\xc0\x00\x48\x29" } },
    .{ "SetWindowsHookExA", MethodRecord{ .library = "USER32", .import = "SetWindowsHookExA", .signature = "\x00\x04\x11\xc0\x00\x48\x25\x11\xa7\x6d\x12\xc0\x00\x48\x29\x11\x82\x29\x09" } },
    .{ "SetWindowsHookExW", MethodRecord{ .library = "USER32", .import = "SetWindowsHookExW", .signature = "\x00\x04\x11\xc0\x00\x48\x25\x11\xa7\x6d\x12\xc0\x00\x48\x29\x11\x82\x29\x09" } },
    .{ "UnhookWindowsHookEx", MethodRecord{ .library = "USER32", .import = "UnhookWindowsHookEx", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x48\x25" } },
    .{ "CallNextHookEx", MethodRecord{ .library = "USER32", .import = "CallNextHookEx", .signature = "\x00\x04\x11\x82\x35\x11\xc0\x00\x48\x25\x08\x11\x83\x8d\x11\x82\x2d" } },
    .{ "CheckMenuRadioItem", MethodRecord{ .library = "USER32", .import = "CheckMenuRadioItem", .signature = "\x00\x05\x11\x59\x11\x83\x91\x09\x09\x09\x09" } },
    .{ "LoadCursorA", MethodRecord{ .library = "USER32", .import = "LoadCursorA", .signature = "\x00\x02\x11\x9a\x2d\x11\x82\x29\x11\x3d" } },
    .{ "LoadCursorW", MethodRecord{ .library = "USER32", .import = "LoadCursorW", .signature = "\x00\x02\x11\x9a\x2d\x11\x82\x29\x11\x05" } },
    .{ "LoadCursorFromFileA", MethodRecord{ .library = "USER32", .import = "LoadCursorFromFileA", .signature = "\x00\x01\x11\x9a\x2d\x11\x3d" } },
    .{ "LoadCursorFromFileW", MethodRecord{ .library = "USER32", .import = "LoadCursorFromFileW", .signature = "\x00\x01\x11\x9a\x2d\x11\x05" } },
    .{ "CreateCursor", MethodRecord{ .library = "USER32", .import = "CreateCursor", .signature = "\x00\x07\x11\x9a\x2d\x11\x82\x29\x08\x08\x08\x08\x0f\x01\x0f\x01" } },
    .{ "DestroyCursor", MethodRecord{ .library = "USER32", .import = "DestroyCursor", .signature = "\x00\x01\x11\x59\x11\x9a\x2d" } },
    .{ "SetSystemCursor", MethodRecord{ .library = "USER32", .import = "SetSystemCursor", .signature = "\x00\x02\x11\x59\x11\x9a\x2d\x11\xa7\x85" } },
    .{ "LoadIconA", MethodRecord{ .library = "USER32", .import = "LoadIconA", .signature = "\x00\x02\x11\x83\x55\x11\x82\x29\x11\x3d" } },
    .{ "LoadIconW", MethodRecord{ .library = "USER32", .import = "LoadIconW", .signature = "\x00\x02\x11\x83\x55\x11\x82\x29\x11\x05" } },
    .{ "PrivateExtractIconsA", MethodRecord{ .library = "USER32", .import = "PrivateExtractIconsA", .signature = "\x00\x08\x09\x11\x3d\x08\x08\x08\x0f\x11\x83\x55\x0f\x09\x09\x09" } },
    .{ "PrivateExtractIconsW", MethodRecord{ .library = "USER32", .import = "PrivateExtractIconsW", .signature = "\x00\x08\x09\x11\x05\x08\x08\x08\x0f\x11\x83\x55\x0f\x09\x09\x09" } },
    .{ "CreateIcon", MethodRecord{ .library = "USER32", .import = "CreateIcon", .signature = "\x00\x07\x11\x83\x55\x11\x82\x29\x08\x08\x05\x05\x0f\x05\x0f\x05" } },
    .{ "DestroyIcon", MethodRecord{ .library = "USER32", .import = "DestroyIcon", .signature = "\x00\x01\x11\x59\x11\x83\x55" } },
    .{ "LookupIconIdFromDirectory", MethodRecord{ .library = "USER32", .import = "LookupIconIdFromDirectory", .signature = "\x00\x02\x08\x0f\x05\x11\x59" } },
    .{ "LookupIconIdFromDirectoryEx", MethodRecord{ .library = "USER32", .import = "LookupIconIdFromDirectoryEx", .signature = "\x00\x05\x08\x0f\x05\x11\x59\x08\x08\x11\x83\x69" } },
    .{ "CreateIconFromResource", MethodRecord{ .library = "USER32", .import = "CreateIconFromResource", .signature = "\x00\x04\x11\x83\x55\x0f\x05\x09\x11\x59\x09" } },
    .{ "CreateIconFromResourceEx", MethodRecord{ .library = "USER32", .import = "CreateIconFromResourceEx", .signature = "\x00\x07\x11\x83\x55\x0f\x05\x09\x11\x59\x09\x08\x08\x11\x83\x69" } },
    .{ "LoadImageA", MethodRecord{ .library = "USER32", .import = "LoadImageA", .signature = "\x00\x06\x11\x80\x85\x11\x82\x29\x11\x3d\x11\xa7\x69\x08\x08\x11\x83\x69" } },
    .{ "LoadImageW", MethodRecord{ .library = "USER32", .import = "LoadImageW", .signature = "\x00\x06\x11\x80\x85\x11\x82\x29\x11\x05\x11\xa7\x69\x08\x08\x11\x83\x69" } },
    .{ "CopyImage", MethodRecord{ .library = "USER32", .import = "CopyImage", .signature = "\x00\x05\x11\x80\x85\x11\x80\x85\x11\xa7\x69\x08\x08\x11\x83\x69" } },
    .{ "DrawIconEx", MethodRecord{ .library = "USER32", .import = "DrawIconEx", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x08\x08\x11\x83\x55\x08\x08\x09\x11\x84\x0d\x11\xc0\x00\x48\x2d" } },
    .{ "CreateIconIndirect", MethodRecord{ .library = "USER32", .import = "CreateIconIndirect", .signature = "\x00\x01\x11\x83\x55\x0f\x11\xc0\x00\x48\x31" } },
    .{ "CopyIcon", MethodRecord{ .library = "USER32", .import = "CopyIcon", .signature = "\x00\x01\x11\x83\x55\x11\x83\x55" } },
    .{ "GetIconInfo", MethodRecord{ .library = "USER32", .import = "GetIconInfo", .signature = "\x00\x02\x11\x59\x11\x83\x55\x0f\x11\xc0\x00\x48\x31" } },
    .{ "GetIconInfoExA", MethodRecord{ .library = "USER32", .import = "GetIconInfoExA", .signature = "\x00\x02\x11\x59\x11\x83\x55\x0f\x11\xc0\x00\x48\x35" } },
    .{ "GetIconInfoExW", MethodRecord{ .library = "USER32", .import = "GetIconInfoExW", .signature = "\x00\x02\x11\x59\x11\x83\x55\x0f\x11\xc0\x00\x48\x39" } },
    .{ "IsDialogMessageA", MethodRecord{ .library = "USER32", .import = "IsDialogMessageA", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x99\xe9" } },
    .{ "IsDialogMessageW", MethodRecord{ .library = "USER32", .import = "IsDialogMessageW", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x99\xe9" } },
    .{ "MapDialogRect", MethodRecord{ .library = "USER32", .import = "MapDialogRect", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x89" } },
    .{ "GetScrollInfo", MethodRecord{ .library = "USER32", .import = "GetScrollInfo", .signature = "\x00\x03\x11\x59\x11\x25\x11\x83\xb5\x0f\x11\x83\xb9" } },
    .{ "DefFrameProcA", MethodRecord{ .library = "USER32", .import = "DefFrameProcA", .signature = "\x00\x05\x11\x82\x35\x11\x25\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "DefFrameProcW", MethodRecord{ .library = "USER32", .import = "DefFrameProcW", .signature = "\x00\x05\x11\x82\x35\x11\x25\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "DefMDIChildProcA", MethodRecord{ .library = "USER32", .import = "DefMDIChildProcA", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "DefMDIChildProcW", MethodRecord{ .library = "USER32", .import = "DefMDIChildProcW", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "TranslateMDISysAccel", MethodRecord{ .library = "USER32", .import = "TranslateMDISysAccel", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x99\xe9" } },
    .{ "ArrangeIconicWindows", MethodRecord{ .library = "USER32", .import = "ArrangeIconicWindows", .signature = "\x00\x01\x09\x11\x25" } },
    .{ "CreateMDIWindowA", MethodRecord{ .library = "USER32", .import = "CreateMDIWindowA", .signature = "\x00\x0a\x11\x25\x11\x3d\x11\x3d\x11\x93\x41\x08\x08\x08\x08\x11\x25\x11\x82\x29\x11\x82\x2d" } },
    .{ "CreateMDIWindowW", MethodRecord{ .library = "USER32", .import = "CreateMDIWindowW", .signature = "\x00\x0a\x11\x25\x11\x05\x11\x05\x11\x93\x41\x08\x08\x08\x08\x11\x25\x11\x82\x29\x11\x82\x2d" } },
    .{ "TileWindows", MethodRecord{ .library = "USER32", .import = "TileWindows", .signature = "\x00\x05\x07\x11\x25\x11\xa7\x9d\x0f\x11\x83\x89\x09\x0f\x11\x25" } },
    .{ "CascadeWindows", MethodRecord{ .library = "USER32", .import = "CascadeWindows", .signature = "\x00\x05\x07\x11\x25\x11\xa7\xa9\x0f\x11\x83\x89\x09\x0f\x11\x25" } },
    .{ "SystemParametersInfoA", MethodRecord{ .library = "USER32", .import = "SystemParametersInfoA", .signature = "\x00\x04\x11\x59\x11\xa7\x41\x09\x0f\x01\x11\xa7\x71" } },
    .{ "SystemParametersInfoW", MethodRecord{ .library = "USER32", .import = "SystemParametersInfoW", .signature = "\x00\x04\x11\x59\x11\xa7\x41\x09\x0f\x01\x11\xa7\x71" } },
    .{ "SoundSentry", MethodRecord{ .library = "USER32", .import = "SoundSentry", .signature = "\x00\x00\x11\x59" } },
    .{ "SetDebugErrorLevel", MethodRecord{ .library = "USER32", .import = "SetDebugErrorLevel", .signature = "\x00\x01\x01\x09" } },
    .{ "InternalGetWindowText", MethodRecord{ .library = "USER32", .import = "InternalGetWindowText", .signature = "\x00\x03\x08\x11\x25\x11\x05\x08" } },
    .{ "CancelShutdown", MethodRecord{ .library = "USER32", .import = "CancelShutdown", .signature = "\x00\x00\x11\x59" } },
    .{ "GetGUIThreadInfo", MethodRecord{ .library = "USER32", .import = "GetGUIThreadInfo", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xc0\x00\x48\x3d" } },
    .{ "SetProcessDPIAware", MethodRecord{ .library = "USER32", .import = "SetProcessDPIAware", .signature = "\x00\x00\x11\x59" } },
    .{ "IsProcessDPIAware", MethodRecord{ .library = "USER32", .import = "IsProcessDPIAware", .signature = "\x00\x00\x11\x59" } },
    .{ "InheritWindowMonitor", MethodRecord{ .library = "USER32", .import = "InheritWindowMonitor", .signature = "\x00\x02\x11\x59\x11\x25\x11\x25" } },
    .{ "GetWindowModuleFileNameA", MethodRecord{ .library = "USER32", .import = "GetWindowModuleFileNameA", .signature = "\x00\x03\x09\x11\x25\x11\x3d\x09" } },
    .{ "GetWindowModuleFileNameW", MethodRecord{ .library = "USER32", .import = "GetWindowModuleFileNameW", .signature = "\x00\x03\x09\x11\x25\x11\x05\x09" } },
    .{ "GetCursorInfo", MethodRecord{ .library = "USER32", .import = "GetCursorInfo", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x48\x41" } },
    .{ "GetWindowInfo", MethodRecord{ .library = "USER32", .import = "GetWindowInfo", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x48\x45" } },
    .{ "GetTitleBarInfo", MethodRecord{ .library = "USER32", .import = "GetTitleBarInfo", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x48\x49" } },
    .{ "GetMenuBarInfo", MethodRecord{ .library = "USER32", .import = "GetMenuBarInfo", .signature = "\x00\x04\x11\x59\x11\x25\x11\xa7\x49\x08\x0f\x11\xc0\x00\x48\x4d" } },
    .{ "GetScrollBarInfo", MethodRecord{ .library = "USER32", .import = "GetScrollBarInfo", .signature = "\x00\x03\x11\x59\x11\x25\x11\xa7\x49\x0f\x11\xc0\x00\x48\x51" } },
    .{ "GetAncestor", MethodRecord{ .library = "USER32", .import = "GetAncestor", .signature = "\x00\x02\x11\x25\x11\x25\x11\xa7\x99" } },
    .{ "RealChildWindowFromPoint", MethodRecord{ .library = "USER32", .import = "RealChildWindowFromPoint", .signature = "\x00\x02\x11\x25\x11\x25\x11\x83\x71" } },
    .{ "RealGetWindowClassA", MethodRecord{ .library = "USER32", .import = "RealGetWindowClassA", .signature = "\x00\x03\x09\x11\x25\x11\x3d\x09" } },
    .{ "RealGetWindowClassW", MethodRecord{ .library = "USER32", .import = "RealGetWindowClassW", .signature = "\x00\x03\x09\x11\x25\x11\x05\x09" } },
    .{ "GetAltTabInfoA", MethodRecord{ .library = "USER32", .import = "GetAltTabInfoA", .signature = "\x00\x05\x11\x59\x11\x25\x08\x0f\x11\xc0\x00\x48\x55\x11\x3d\x09" } },
    .{ "GetAltTabInfoW", MethodRecord{ .library = "USER32", .import = "GetAltTabInfoW", .signature = "\x00\x05\x11\x59\x11\x25\x08\x0f\x11\xc0\x00\x48\x55\x11\x05\x09" } },
    .{ "ChangeWindowMessageFilter", MethodRecord{ .library = "USER32", .import = "ChangeWindowMessageFilter", .signature = "\x00\x02\x11\x59\x09\x11\xa7\x65" } },
    .{ "ChangeWindowMessageFilterEx", MethodRecord{ .library = "USER32", .import = "ChangeWindowMessageFilterEx", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\xa7\xad\x0f\x11\xc0\x00\x48\x59" } },
    .{ "ConvertToInterceptWindow", MethodRecord{ .library = "USER32", .import = "ConvertToInterceptWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "IsInterceptWindow", MethodRecord{ .library = "USER32", .import = "IsInterceptWindow", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x59" } },
    .{ "ApplyWindowAction", MethodRecord{ .library = "USER32", .import = "ApplyWindowAction", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x48\x5d" } },
    .{ "SetAdditionalForegroundBoostProcesses", MethodRecord{ .library = "USER32", .import = "SetAdditionalForegroundBoostProcesses", .signature = "\x00\x03\x11\x59\x11\x25\x09\x0f\x11\x80\x85" } },
    .{ "RegisterForTooltipDismissNotification", MethodRecord{ .library = "USER32", .import = "RegisterForTooltipDismissNotification", .signature = "\x00\x02\x11\x59\x11\x25\x11\xc0\x00\x48\x61" } },
    .{ "ConvertPrimaryPointerToMouseDrag", MethodRecord{ .library = "USER32", .import = "ConvertPrimaryPointerToMouseDrag", .signature = "\x00\x00\x11\x59" } },
    .{ "IsWindowArranged", MethodRecord{ .library = "USER32", .import = "IsWindowArranged", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "GetCurrentMonitorTopologyId", MethodRecord{ .library = "USER32", .import = "GetCurrentMonitorTopologyId", .signature = "\x00\x00\x09" } },
    .{ "RegisterCloakedNotification", MethodRecord{ .library = "USER32", .import = "RegisterCloakedNotification", .signature = "\x00\x02\x11\x59\x11\x25\x11\x59" } },
    .{ "EnterMoveSizeLoop", MethodRecord{ .library = "USER32", .import = "EnterMoveSizeLoop", .signature = "\x00\x03\x11\x59\x11\x25\x11\x83\x71\x11\xc0\x00\x48\x65" } },
    .{ "CreateResourceIndexer", MethodRecord{ .library = "MrmSupport", .import = "CreateResourceIndexer", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "DestroyResourceIndexer", MethodRecord{ .library = "MrmSupport", .import = "DestroyResourceIndexer", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "IndexFilePath", MethodRecord{ .library = "MrmSupport", .import = "IndexFilePath", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x05\x0f\x11\x05\x0f\x09\x0f\x0f\x11\xc0\x00\x48\x69" } },
    .{ "DestroyIndexedResults", MethodRecord{ .library = "MrmSupport", .import = "DestroyIndexedResults", .signature = "\x00\x03\x01\x11\x05\x09\x0f\x11\xc0\x00\x48\x69" } },
    .{ "MrmCreateResourceIndexer", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceIndexer", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\xc0\x00\x48\x6d\x11\x05\x0f\x11\xc0\x00\x48\x71" } },
    .{ "MrmCreateResourceIndexerFromPreviousSchemaFile", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceIndexerFromPreviousSchemaFile", .signature = "\x00\x05\x11\x79\x11\x05\x11\xc0\x00\x48\x6d\x11\x05\x11\x05\x0f\x11\xc0\x00\x48\x71" } },
    .{ "MrmCreateResourceIndexerFromPreviousPriFile", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceIndexerFromPreviousPriFile", .signature = "\x00\x05\x11\x79\x11\x05\x11\xc0\x00\x48\x6d\x11\x05\x11\x05\x0f\x11\xc0\x00\x48\x71" } },
    .{ "MrmCreateResourceIndexerFromPreviousSchemaData", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceIndexerFromPreviousSchemaData", .signature = "\x00\x06\x11\x79\x11\x05\x11\xc0\x00\x48\x6d\x11\x05\x0f\x05\x09\x0f\x11\xc0\x00\x48\x71" } },
    .{ "MrmCreateResourceIndexerFromPreviousPriData", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceIndexerFromPreviousPriData", .signature = "\x00\x06\x11\x79\x11\x05\x11\xc0\x00\x48\x6d\x11\x05\x0f\x05\x09\x0f\x11\xc0\x00\x48\x71" } },
    .{ "MrmCreateResourceIndexerWithFlags", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceIndexerWithFlags", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\xc0\x00\x48\x6d\x11\x05\x11\xc0\x00\x48\x75\x0f\x11\xc0\x00\x48\x71" } },
    .{ "MrmIndexString", MethodRecord{ .library = "MrmSupport", .import = "MrmIndexString", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x48\x71\x11\x05\x11\x05\x11\x05" } },
    .{ "MrmIndexEmbeddedData", MethodRecord{ .library = "MrmSupport", .import = "MrmIndexEmbeddedData", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x48\x71\x11\x05\x0f\x05\x09\x11\x05" } },
    .{ "MrmIndexFile", MethodRecord{ .library = "MrmSupport", .import = "MrmIndexFile", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x48\x71\x11\x05\x11\x05\x11\x05" } },
    .{ "MrmIndexFileAutoQualifiers", MethodRecord{ .library = "MrmSupport", .import = "MrmIndexFileAutoQualifiers", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x48\x71\x11\x05" } },
    .{ "MrmIndexResourceContainerAutoQualifiers", MethodRecord{ .library = "MrmSupport", .import = "MrmIndexResourceContainerAutoQualifiers", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x48\x71\x11\x05" } },
    .{ "MrmCreateResourceFile", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceFile", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x48\x71\x11\xc0\x00\x48\x79\x11\xc0\x00\x48\x7d\x11\x05" } },
    .{ "MrmCreateResourceFileWithChecksum", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceFileWithChecksum", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x48\x71\x11\xc0\x00\x48\x79\x11\xc0\x00\x48\x7d\x09\x11\x05" } },
    .{ "MrmCreateResourceFileInMemory", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateResourceFileInMemory", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x48\x71\x11\xc0\x00\x48\x79\x11\xc0\x00\x48\x7d\x0f\x0f\x05\x0f\x09" } },
    .{ "MrmPeekResourceIndexerMessages", MethodRecord{ .library = "MrmSupport", .import = "MrmPeekResourceIndexerMessages", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x48\x71\x0f\x0f\x11\xc0\x00\x48\x81\x0f\x09" } },
    .{ "MrmDestroyIndexerAndMessages", MethodRecord{ .library = "MrmSupport", .import = "MrmDestroyIndexerAndMessages", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x48\x71" } },
    .{ "MrmFreeMemory", MethodRecord{ .library = "MrmSupport", .import = "MrmFreeMemory", .signature = "\x00\x01\x11\x79\x0f\x05" } },
    .{ "MrmDumpPriFile", MethodRecord{ .library = "MrmSupport", .import = "MrmDumpPriFile", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\xc0\x00\x48\x85\x11\x05" } },
    .{ "MrmDumpPriFileInMemory", MethodRecord{ .library = "MrmSupport", .import = "MrmDumpPriFileInMemory", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\xc0\x00\x48\x85\x0f\x0f\x05\x0f\x09" } },
    .{ "MrmDumpPriDataInMemory", MethodRecord{ .library = "MrmSupport", .import = "MrmDumpPriDataInMemory", .signature = "\x00\x07\x11\x79\x0f\x05\x09\x0f\x05\x09\x11\xc0\x00\x48\x85\x0f\x0f\x05\x0f\x09" } },
    .{ "MrmCreateConfig", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateConfig", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x48\x6d\x11\x05\x11\x05" } },
    .{ "MrmCreateConfigInMemory", MethodRecord{ .library = "MrmSupport", .import = "MrmCreateConfigInMemory", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x48\x6d\x11\x05\x0f\x0f\x05\x0f\x09" } },
    .{ "MrmGetPriFileContentChecksum", MethodRecord{ .library = "MrmSupport", .import = "MrmGetPriFileContentChecksum", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x351 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBITMAP" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x359 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "COLORREF" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x369 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "IMAGE_FLAGS" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0x391 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HMENU" },
        0x3b5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SCROLLBAR_CONSTANTS" },
        0x3b9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SCROLLINFO" },
        0x3e1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HRGN" },
        0x3e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SIZE" },
        0x40d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBRUSH" },
        0x929 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MESSAGEBOX_STYLE" },
        0xd15 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WAIT_EVENT" },
        0xd5d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "CHAR" },
        0xe29 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "BLENDFUNCTION" },
        0x133d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SYSTEM_METRICS_INDEX" },
        0x1341 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_STYLE" },
        0x1345 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_EX_STYLE" },
        0x19e9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MSG" },
        0x1a05 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HACCEL" },
        0x1a2d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HCURSOR" },
        0x1ad9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MESSAGEBOX_RESULT" },
        0x1ef1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SHOW_WINDOW_CMD" },
        0x2731 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "CWP_FLAGS" },
        0x2735 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MENU_ITEM_FLAGS" },
        0x273d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SCROLL_WINDOW_FLAGS" },
        0x2741 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SYSTEM_PARAMETERS_INFO_ACTION" },
        0x2745 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "TRACK_POPUP_MENU_FLAGS" },
        0x2749 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "OBJECT_IDENTIFIER" },
        0x2755 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "GET_CLASS_LONG_INDEX" },
        0x2759 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "UPDATE_LAYERED_WINDOW_FLAGS" },
        0x275d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_LONG_PTR_INDEX" },
        0x2761 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "ANIMATE_WINDOW_FLAGS" },
        0x2765 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "CHANGE_WINDOW_MESSAGE_FILTER_FLAGS" },
        0x2769 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "GDI_IMAGE_TYPE" },
        0x276d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOWS_HOOK_ID" },
        0x2771 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS" },
        0x2775 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SET_WINDOW_POS_FLAGS" },
        0x2779 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS" },
        0x277d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "QUEUE_STATUS_FLAGS" },
        0x2781 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "REGISTER_NOTIFICATION_FLAGS" },
        0x2785 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SYSTEM_CURSOR_ID" },
        0x2789 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "LAYERED_WINDOW_ATTRIBUTES_FLAGS" },
        0x278d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SEND_MESSAGE_TIMEOUT_FLAGS" },
        0x2791 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "PEEK_MESSAGE_REMOVE_TYPE" },
        0x2795 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "GET_WINDOW_CMD" },
        0x2799 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "GET_ANCESTOR_FLAGS" },
        0x279d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "TILE_WINDOWS_HOW" },
        0x27a1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_DISPLAY_AFFINITY" },
        0x27a5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "FOREGROUND_WINDOW_LOCK_CODE" },
        0x27a9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "CASCADE_WINDOWS_HOW" },
        0x27ad => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_MESSAGE_FILTER_ACTION" },
        0x27b1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "GET_MENU_DEFAULT_ITEM_FLAGS" },
        0x47bd => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SENDASYNCPROC" },
        0x47c1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HDEVNOTIFY" },
        0x47c5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WNDPROC" },
        0x47c9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WNDCLASSA" },
        0x47cd => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WNDCLASSW" },
        0x47d1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WNDCLASSEXA" },
        0x47d5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WNDCLASSEXW" },
        0x47d9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "UPDATELAYEREDWINDOWINFO" },
        0x47dd => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "FLASHWINFO" },
        0x47e1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOWPLACEMENT" },
        0x47e5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HDWP" },
        0x47e9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "DLGPROC" },
        0x47ed => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "DLGTEMPLATE" },
        0x47f1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "TIMERPROC" },
        0x47f5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "ACCEL" },
        0x47f9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "TPMPARAMS" },
        0x47fd => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MENUINFO" },
        0x4801 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MENUITEMINFOA" },
        0x4805 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MENUITEMINFOW" },
        0x4809 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "PROPENUMPROCEXA" },
        0x480d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "PROPENUMPROCEXW" },
        0x4811 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "PROPENUMPROCA" },
        0x4815 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "PROPENUMPROCW" },
        0x4819 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MSGBOXPARAMSA" },
        0x481d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MSGBOXPARAMSW" },
        0x4821 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WNDENUMPROC" },
        0x4825 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HHOOK" },
        0x4829 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HOOKPROC" },
        0x482d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "DI_FLAGS" },
        0x4831 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "ICONINFO" },
        0x4835 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "ICONINFOEXA" },
        0x4839 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "ICONINFOEXW" },
        0x483d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "GUITHREADINFO" },
        0x4841 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "CURSORINFO" },
        0x4845 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOWINFO" },
        0x4849 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "TITLEBARINFO" },
        0x484d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MENUBARINFO" },
        0x4851 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SCROLLBARINFO" },
        0x4855 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "ALTTABINFO" },
        0x4859 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "CHANGEFILTERSTRUCT" },
        0x485d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_ACTION" },
        0x4861 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "TOOLTIP_DISMISS_FLAGS" },
        0x4865 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MOVESIZE_OPERATION" },
        0x4869 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "IndexedResourceQualifier" },
        0x486d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MrmPlatformVersion" },
        0x4871 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MrmResourceIndexerHandle" },
        0x4875 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MrmIndexerFlags" },
        0x4879 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MrmPackagingMode" },
        0x487d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MrmPackagingOptions" },
        0x4881 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MrmResourceIndexerMessage" },
        0x4885 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MrmDumpType" },
        else => null,
    };
}

pub const CS_VREDRAW = 1;
pub const CS_HREDRAW = 2;
pub const CS_DBLCLKS = 8;
pub const CS_OWNDC = 32;
pub const CS_CLASSDC = 64;
pub const CS_PARENTDC = 128;
pub const CS_NOCLOSE = 512;
pub const CS_SAVEBITS = 2048;
pub const CS_BYTEALIGNCLIENT = 4096;
pub const CS_BYTEALIGNWINDOW = 8192;
pub const CS_GLOBALCLASS = 16384;
pub const CS_IME = 65536;
pub const CS_DROPSHADOW = 131072;
pub const CWP_ALL = 0;
pub const CWP_SKIPINVISIBLE = 1;
pub const CWP_SKIPDISABLED = 2;
pub const CWP_SKIPTRANSPARENT = 4;
pub const MB_ABORTRETRYIGNORE = 2;
pub const MB_CANCELTRYCONTINUE = 6;
pub const MB_HELP = 16384;
pub const MB_OK = 0;
pub const MB_OKCANCEL = 1;
pub const MB_RETRYCANCEL = 5;
pub const MB_YESNO = 4;
pub const MB_YESNOCANCEL = 3;
pub const MB_ICONHAND = 16;
pub const MB_ICONQUESTION = 32;
pub const MB_ICONEXCLAMATION = 48;
pub const MB_ICONASTERISK = 64;
pub const MB_USERICON = 128;
pub const MB_ICONWARNING = 48;
pub const MB_ICONERROR = 16;
pub const MB_ICONINFORMATION = 64;
pub const MB_ICONSTOP = 16;
pub const MB_DEFBUTTON1 = 0;
pub const MB_DEFBUTTON2 = 256;
pub const MB_DEFBUTTON3 = 512;
pub const MB_DEFBUTTON4 = 768;
pub const MB_APPLMODAL = 0;
pub const MB_SYSTEMMODAL = 4096;
pub const MB_TASKMODAL = 8192;
pub const MB_NOFOCUS = 32768;
pub const MB_SETFOREGROUND = 65536;
pub const MB_DEFAULT_DESKTOP_ONLY = 131072;
pub const MB_TOPMOST = 262144;
pub const MB_RIGHT = 524288;
pub const MB_RTLREADING = 1048576;
pub const MB_SERVICE_NOTIFICATION = 2097152;
pub const MB_SERVICE_NOTIFICATION_NT3X = 262144;
pub const MB_TYPEMASK = 15;
pub const MB_ICONMASK = 240;
pub const MB_DEFMASK = 3840;
pub const MB_MODEMASK = 12288;
pub const MB_MISCMASK = 49152;
pub const MF_BYCOMMAND = 0;
pub const MF_BYPOSITION = 1024;
pub const MF_BITMAP = 4;
pub const MF_CHECKED = 8;
pub const MF_DISABLED = 2;
pub const MF_ENABLED = 0;
pub const MF_GRAYED = 1;
pub const MF_MENUBARBREAK = 32;
pub const MF_MENUBREAK = 64;
pub const MF_OWNERDRAW = 256;
pub const MF_POPUP = 16;
pub const MF_SEPARATOR = 2048;
pub const MF_STRING = 0;
pub const MF_UNCHECKED = 0;
pub const MF_INSERT = 0;
pub const MF_CHANGE = 128;
pub const MF_APPEND = 256;
pub const MF_DELETE = 512;
pub const MF_REMOVE = 4096;
pub const MF_USECHECKBITMAPS = 512;
pub const MF_UNHILITE = 0;
pub const MF_HILITE = 128;
pub const MF_DEFAULT = 4096;
pub const MF_SYSMENU = 8192;
pub const MF_HELP = 16384;
pub const MF_RIGHTJUSTIFY = 16384;
pub const MF_MOUSESELECT = 32768;
pub const MF_END = 128;
pub const SW_HIDE = 0;
pub const SW_SHOWNORMAL = 1;
pub const SW_NORMAL = 1;
pub const SW_SHOWMINIMIZED = 2;
pub const SW_SHOWMAXIMIZED = 3;
pub const SW_MAXIMIZE = 3;
pub const SW_SHOWNOACTIVATE = 4;
pub const SW_SHOW = 5;
pub const SW_MINIMIZE = 6;
pub const SW_SHOWMINNOACTIVE = 7;
pub const SW_SHOWNA = 8;
pub const SW_RESTORE = 9;
pub const SW_SHOWDEFAULT = 10;
pub const SW_FORCEMINIMIZE = 11;
pub const SW_MAX = 11;
pub const SW_PARENTCLOSING = 1;
pub const SW_OTHERZOOM = 2;
pub const SW_PARENTOPENING = 3;
pub const SW_OTHERUNZOOM = 4;
pub const SW_SCROLLCHILDREN = 1;
pub const SW_INVALIDATE = 2;
pub const SW_ERASE = 4;
pub const SW_SMOOTHSCROLL = 16;
pub const SPI_GETBEEP = 1;
pub const SPI_SETBEEP = 2;
pub const SPI_GETMOUSE = 3;
pub const SPI_SETMOUSE = 4;
pub const SPI_GETBORDER = 5;
pub const SPI_SETBORDER = 6;
pub const SPI_GETKEYBOARDSPEED = 10;
pub const SPI_SETKEYBOARDSPEED = 11;
pub const SPI_LANGDRIVER = 12;
pub const SPI_ICONHORIZONTALSPACING = 13;
pub const SPI_GETSCREENSAVETIMEOUT = 14;
pub const SPI_SETSCREENSAVETIMEOUT = 15;
pub const SPI_GETSCREENSAVEACTIVE = 16;
pub const SPI_SETSCREENSAVEACTIVE = 17;
pub const SPI_GETGRIDGRANULARITY = 18;
pub const SPI_SETGRIDGRANULARITY = 19;
pub const SPI_SETDESKWALLPAPER = 20;
pub const SPI_SETDESKPATTERN = 21;
pub const SPI_GETKEYBOARDDELAY = 22;
pub const SPI_SETKEYBOARDDELAY = 23;
pub const SPI_ICONVERTICALSPACING = 24;
pub const SPI_GETICONTITLEWRAP = 25;
pub const SPI_SETICONTITLEWRAP = 26;
pub const SPI_GETMENUDROPALIGNMENT = 27;
pub const SPI_SETMENUDROPALIGNMENT = 28;
pub const SPI_SETDOUBLECLKWIDTH = 29;
pub const SPI_SETDOUBLECLKHEIGHT = 30;
pub const SPI_GETICONTITLELOGFONT = 31;
pub const SPI_SETDOUBLECLICKTIME = 32;
pub const SPI_SETMOUSEBUTTONSWAP = 33;
pub const SPI_SETICONTITLELOGFONT = 34;
pub const SPI_GETFASTTASKSWITCH = 35;
pub const SPI_SETFASTTASKSWITCH = 36;
pub const SPI_SETDRAGFULLWINDOWS = 37;
pub const SPI_GETDRAGFULLWINDOWS = 38;
pub const SPI_GETNONCLIENTMETRICS = 41;
pub const SPI_SETNONCLIENTMETRICS = 42;
pub const SPI_GETMINIMIZEDMETRICS = 43;
pub const SPI_SETMINIMIZEDMETRICS = 44;
pub const SPI_GETICONMETRICS = 45;
pub const SPI_SETICONMETRICS = 46;
pub const SPI_SETWORKAREA = 47;
pub const SPI_GETWORKAREA = 48;
pub const SPI_SETPENWINDOWS = 49;
pub const SPI_GETHIGHCONTRAST = 66;
pub const SPI_SETHIGHCONTRAST = 67;
pub const SPI_GETKEYBOARDPREF = 68;
pub const SPI_SETKEYBOARDPREF = 69;
pub const SPI_GETSCREENREADER = 70;
pub const SPI_SETSCREENREADER = 71;
pub const SPI_GETANIMATION = 72;
pub const SPI_SETANIMATION = 73;
pub const SPI_GETFONTSMOOTHING = 74;
pub const SPI_SETFONTSMOOTHING = 75;
pub const SPI_SETDRAGWIDTH = 76;
pub const SPI_SETDRAGHEIGHT = 77;
pub const SPI_SETHANDHELD = 78;
pub const SPI_GETLOWPOWERTIMEOUT = 79;
pub const SPI_GETPOWEROFFTIMEOUT = 80;
pub const SPI_SETLOWPOWERTIMEOUT = 81;
pub const SPI_SETPOWEROFFTIMEOUT = 82;
pub const SPI_GETLOWPOWERACTIVE = 83;
pub const SPI_GETPOWEROFFACTIVE = 84;
pub const SPI_SETLOWPOWERACTIVE = 85;
pub const SPI_SETPOWEROFFACTIVE = 86;
pub const SPI_SETCURSORS = 87;
pub const SPI_SETICONS = 88;
pub const SPI_GETDEFAULTINPUTLANG = 89;
pub const SPI_SETDEFAULTINPUTLANG = 90;
pub const SPI_SETLANGTOGGLE = 91;
pub const SPI_GETWINDOWSEXTENSION = 92;
pub const SPI_SETMOUSETRAILS = 93;
pub const SPI_GETMOUSETRAILS = 94;
pub const SPI_SETSCREENSAVERRUNNING = 97;
pub const SPI_SCREENSAVERRUNNING = 97;
pub const SPI_GETFILTERKEYS = 50;
pub const SPI_SETFILTERKEYS = 51;
pub const SPI_GETTOGGLEKEYS = 52;
pub const SPI_SETTOGGLEKEYS = 53;
pub const SPI_GETMOUSEKEYS = 54;
pub const SPI_SETMOUSEKEYS = 55;
pub const SPI_GETSHOWSOUNDS = 56;
pub const SPI_SETSHOWSOUNDS = 57;
pub const SPI_GETSTICKYKEYS = 58;
pub const SPI_SETSTICKYKEYS = 59;
pub const SPI_GETACCESSTIMEOUT = 60;
pub const SPI_SETACCESSTIMEOUT = 61;
pub const SPI_GETSERIALKEYS = 62;
pub const SPI_SETSERIALKEYS = 63;
pub const SPI_GETSOUNDSENTRY = 64;
pub const SPI_SETSOUNDSENTRY = 65;
pub const SPI_GETSNAPTODEFBUTTON = 95;
pub const SPI_SETSNAPTODEFBUTTON = 96;
pub const SPI_GETMOUSEHOVERWIDTH = 98;
pub const SPI_SETMOUSEHOVERWIDTH = 99;
pub const SPI_GETMOUSEHOVERHEIGHT = 100;
pub const SPI_SETMOUSEHOVERHEIGHT = 101;
pub const SPI_GETMOUSEHOVERTIME = 102;
pub const SPI_SETMOUSEHOVERTIME = 103;
pub const SPI_GETWHEELSCROLLLINES = 104;
pub const SPI_SETWHEELSCROLLLINES = 105;
pub const SPI_GETMENUSHOWDELAY = 106;
pub const SPI_SETMENUSHOWDELAY = 107;
pub const SPI_GETWHEELSCROLLCHARS = 108;
pub const SPI_SETWHEELSCROLLCHARS = 109;
pub const SPI_GETSHOWIMEUI = 110;
pub const SPI_SETSHOWIMEUI = 111;
pub const SPI_GETMOUSESPEED = 112;
pub const SPI_SETMOUSESPEED = 113;
pub const SPI_GETSCREENSAVERRUNNING = 114;
pub const SPI_GETDESKWALLPAPER = 115;
pub const SPI_GETAUDIODESCRIPTION = 116;
pub const SPI_SETAUDIODESCRIPTION = 117;
pub const SPI_GETSCREENSAVESECURE = 118;
pub const SPI_SETSCREENSAVESECURE = 119;
pub const SPI_GETHUNGAPPTIMEOUT = 120;
pub const SPI_SETHUNGAPPTIMEOUT = 121;
pub const SPI_GETWAITTOKILLTIMEOUT = 122;
pub const SPI_SETWAITTOKILLTIMEOUT = 123;
pub const SPI_GETWAITTOKILLSERVICETIMEOUT = 124;
pub const SPI_SETWAITTOKILLSERVICETIMEOUT = 125;
pub const SPI_GETMOUSEDOCKTHRESHOLD = 126;
pub const SPI_SETMOUSEDOCKTHRESHOLD = 127;
pub const SPI_GETPENDOCKTHRESHOLD = 128;
pub const SPI_SETPENDOCKTHRESHOLD = 129;
pub const SPI_GETWINARRANGING = 130;
pub const SPI_SETWINARRANGING = 131;
pub const SPI_GETMOUSEDRAGOUTTHRESHOLD = 132;
pub const SPI_SETMOUSEDRAGOUTTHRESHOLD = 133;
pub const SPI_GETPENDRAGOUTTHRESHOLD = 134;
pub const SPI_SETPENDRAGOUTTHRESHOLD = 135;
pub const SPI_GETMOUSESIDEMOVETHRESHOLD = 136;
pub const SPI_SETMOUSESIDEMOVETHRESHOLD = 137;
pub const SPI_GETPENSIDEMOVETHRESHOLD = 138;
pub const SPI_SETPENSIDEMOVETHRESHOLD = 139;
pub const SPI_GETDRAGFROMMAXIMIZE = 140;
pub const SPI_SETDRAGFROMMAXIMIZE = 141;
pub const SPI_GETSNAPSIZING = 142;
pub const SPI_SETSNAPSIZING = 143;
pub const SPI_GETDOCKMOVING = 144;
pub const SPI_SETDOCKMOVING = 145;
pub const SPI_GETTOUCHPREDICTIONPARAMETERS = 156;
pub const SPI_SETTOUCHPREDICTIONPARAMETERS = 157;
pub const SPI_GETLOGICALDPIOVERRIDE = 158;
pub const SPI_SETLOGICALDPIOVERRIDE = 159;
pub const SPI_GETMENURECT = 162;
pub const SPI_SETMENURECT = 163;
pub const SPI_GETTOUCHPADPARAMETERS = 174;
pub const SPI_SETTOUCHPADPARAMETERS = 175;
pub const SPI_GETACTIVEWINDOWTRACKING = 4096;
pub const SPI_SETACTIVEWINDOWTRACKING = 4097;
pub const SPI_GETMENUANIMATION = 4098;
pub const SPI_SETMENUANIMATION = 4099;
pub const SPI_GETCOMBOBOXANIMATION = 4100;
pub const SPI_SETCOMBOBOXANIMATION = 4101;
pub const SPI_GETLISTBOXSMOOTHSCROLLING = 4102;
pub const SPI_SETLISTBOXSMOOTHSCROLLING = 4103;
pub const SPI_GETGRADIENTCAPTIONS = 4104;
pub const SPI_SETGRADIENTCAPTIONS = 4105;
pub const SPI_GETKEYBOARDCUES = 4106;
pub const SPI_SETKEYBOARDCUES = 4107;
pub const SPI_GETMENUUNDERLINES = 4106;
pub const SPI_SETMENUUNDERLINES = 4107;
pub const SPI_GETACTIVEWNDTRKZORDER = 4108;
pub const SPI_SETACTIVEWNDTRKZORDER = 4109;
pub const SPI_GETHOTTRACKING = 4110;
pub const SPI_SETHOTTRACKING = 4111;
pub const SPI_GETMENUFADE = 4114;
pub const SPI_SETMENUFADE = 4115;
pub const SPI_GETSELECTIONFADE = 4116;
pub const SPI_SETSELECTIONFADE = 4117;
pub const SPI_GETTOOLTIPANIMATION = 4118;
pub const SPI_SETTOOLTIPANIMATION = 4119;
pub const SPI_GETTOOLTIPFADE = 4120;
pub const SPI_SETTOOLTIPFADE = 4121;
pub const SPI_GETCURSORSHADOW = 4122;
pub const SPI_SETCURSORSHADOW = 4123;
pub const SPI_GETMOUSESONAR = 4124;
pub const SPI_SETMOUSESONAR = 4125;
pub const SPI_GETMOUSECLICKLOCK = 4126;
pub const SPI_SETMOUSECLICKLOCK = 4127;
pub const SPI_GETMOUSEVANISH = 4128;
pub const SPI_SETMOUSEVANISH = 4129;
pub const SPI_GETFLATMENU = 4130;
pub const SPI_SETFLATMENU = 4131;
pub const SPI_GETDROPSHADOW = 4132;
pub const SPI_SETDROPSHADOW = 4133;
pub const SPI_GETBLOCKSENDINPUTRESETS = 4134;
pub const SPI_SETBLOCKSENDINPUTRESETS = 4135;
pub const SPI_GETUIEFFECTS = 4158;
pub const SPI_SETUIEFFECTS = 4159;
pub const SPI_GETDISABLEOVERLAPPEDCONTENT = 4160;
pub const SPI_SETDISABLEOVERLAPPEDCONTENT = 4161;
pub const SPI_GETCLIENTAREAANIMATION = 4162;
pub const SPI_SETCLIENTAREAANIMATION = 4163;
pub const SPI_GETCLEARTYPE = 4168;
pub const SPI_SETCLEARTYPE = 4169;
pub const SPI_GETSPEECHRECOGNITION = 4170;
pub const SPI_SETSPEECHRECOGNITION = 4171;
pub const SPI_GETCARETBROWSING = 4172;
pub const SPI_SETCARETBROWSING = 4173;
pub const SPI_GETTHREADLOCALINPUTSETTINGS = 4174;
pub const SPI_SETTHREADLOCALINPUTSETTINGS = 4175;
pub const SPI_GETSYSTEMLANGUAGEBAR = 4176;
pub const SPI_SETSYSTEMLANGUAGEBAR = 4177;
pub const SPI_GETFOREGROUNDLOCKTIMEOUT = 8192;
pub const SPI_SETFOREGROUNDLOCKTIMEOUT = 8193;
pub const SPI_GETACTIVEWNDTRKTIMEOUT = 8194;
pub const SPI_SETACTIVEWNDTRKTIMEOUT = 8195;
pub const SPI_GETFOREGROUNDFLASHCOUNT = 8196;
pub const SPI_SETFOREGROUNDFLASHCOUNT = 8197;
pub const SPI_GETCARETWIDTH = 8198;
pub const SPI_SETCARETWIDTH = 8199;
pub const SPI_GETMOUSECLICKLOCKTIME = 8200;
pub const SPI_SETMOUSECLICKLOCKTIME = 8201;
pub const SPI_GETFONTSMOOTHINGTYPE = 8202;
pub const SPI_SETFONTSMOOTHINGTYPE = 8203;
pub const SPI_GETFONTSMOOTHINGCONTRAST = 8204;
pub const SPI_SETFONTSMOOTHINGCONTRAST = 8205;
pub const SPI_GETFOCUSBORDERWIDTH = 8206;
pub const SPI_SETFOCUSBORDERWIDTH = 8207;
pub const SPI_GETFOCUSBORDERHEIGHT = 8208;
pub const SPI_SETFOCUSBORDERHEIGHT = 8209;
pub const SPI_GETFONTSMOOTHINGORIENTATION = 8210;
pub const SPI_SETFONTSMOOTHINGORIENTATION = 8211;
pub const SPI_GETMINIMUMHITRADIUS = 8212;
pub const SPI_SETMINIMUMHITRADIUS = 8213;
pub const SPI_GETMESSAGEDURATION = 8214;
pub const SPI_SETMESSAGEDURATION = 8215;
pub const SPI_GETCONTACTVISUALIZATION = 8216;
pub const SPI_SETCONTACTVISUALIZATION = 8217;
pub const SPI_GETGESTUREVISUALIZATION = 8218;
pub const SPI_SETGESTUREVISUALIZATION = 8219;
pub const SPI_GETMOUSEWHEELROUTING = 8220;
pub const SPI_SETMOUSEWHEELROUTING = 8221;
pub const SPI_GETPENVISUALIZATION = 8222;
pub const SPI_SETPENVISUALIZATION = 8223;
pub const SPI_GETPENARBITRATIONTYPE = 8224;
pub const SPI_SETPENARBITRATIONTYPE = 8225;
pub const SPI_GETCARETTIMEOUT = 8226;
pub const SPI_SETCARETTIMEOUT = 8227;
pub const SPI_GETHANDEDNESS = 8228;
pub const SPI_SETHANDEDNESS = 8229;
pub const TPM_LEFTBUTTON = 0;
pub const TPM_RIGHTBUTTON = 2;
pub const TPM_LEFTALIGN = 0;
pub const TPM_CENTERALIGN = 4;
pub const TPM_RIGHTALIGN = 8;
pub const TPM_TOPALIGN = 0;
pub const TPM_VCENTERALIGN = 16;
pub const TPM_BOTTOMALIGN = 32;
pub const TPM_HORIZONTAL = 0;
pub const TPM_VERTICAL = 64;
pub const TPM_NONOTIFY = 128;
pub const TPM_RETURNCMD = 256;
pub const TPM_RECURSE = 1;
pub const TPM_HORPOSANIMATION = 1024;
pub const TPM_HORNEGANIMATION = 2048;
pub const TPM_VERPOSANIMATION = 4096;
pub const TPM_VERNEGANIMATION = 8192;
pub const TPM_NOANIMATION = 16384;
pub const TPM_LAYOUTRTL = 32768;
pub const TPM_WORKAREA = 65536;
pub const WS_EX_DLGMODALFRAME = 1;
pub const WS_EX_NOPARENTNOTIFY = 4;
pub const WS_EX_TOPMOST = 8;
pub const WS_EX_ACCEPTFILES = 16;
pub const WS_EX_TRANSPARENT = 32;
pub const WS_EX_MDICHILD = 64;
pub const WS_EX_TOOLWINDOW = 128;
pub const WS_EX_WINDOWEDGE = 256;
pub const WS_EX_CLIENTEDGE = 512;
pub const WS_EX_CONTEXTHELP = 1024;
pub const WS_EX_RIGHT = 4096;
pub const WS_EX_LEFT = 0;
pub const WS_EX_RTLREADING = 8192;
pub const WS_EX_LTRREADING = 0;
pub const WS_EX_LEFTSCROLLBAR = 16384;
pub const WS_EX_RIGHTSCROLLBAR = 0;
pub const WS_EX_CONTROLPARENT = 65536;
pub const WS_EX_STATICEDGE = 131072;
pub const WS_EX_APPWINDOW = 262144;
pub const WS_EX_OVERLAPPEDWINDOW = 768;
pub const WS_EX_PALETTEWINDOW = 392;
pub const WS_EX_LAYERED = 524288;
pub const WS_EX_NOINHERITLAYOUT = 1048576;
pub const WS_EX_NOREDIRECTIONBITMAP = 2097152;
pub const WS_EX_LAYOUTRTL = 4194304;
pub const WS_EX_COMPOSITED = 33554432;
pub const WS_EX_NOACTIVATE = 134217728;
pub const WS_OVERLAPPED = 0;
pub const WS_POPUP = 2147483648;
pub const WS_CHILD = 1073741824;
pub const WS_MINIMIZE = 536870912;
pub const WS_VISIBLE = 268435456;
pub const WS_DISABLED = 134217728;
pub const WS_CLIPSIBLINGS = 67108864;
pub const WS_CLIPCHILDREN = 33554432;
pub const WS_MAXIMIZE = 16777216;
pub const WS_CAPTION = 12582912;
pub const WS_BORDER = 8388608;
pub const WS_DLGFRAME = 4194304;
pub const WS_VSCROLL = 2097152;
pub const WS_HSCROLL = 1048576;
pub const WS_SYSMENU = 524288;
pub const WS_THICKFRAME = 262144;
pub const WS_GROUP = 131072;
pub const WS_TABSTOP = 65536;
pub const WS_MINIMIZEBOX = 131072;
pub const WS_MAXIMIZEBOX = 65536;
pub const WS_TILED = 0;
pub const WS_ICONIC = 536870912;
pub const WS_SIZEBOX = 262144;
pub const WS_TILEDWINDOW = 13565952;
pub const WS_OVERLAPPEDWINDOW = 13565952;
pub const WS_POPUPWINDOW = 2156396544;
pub const WS_CHILDWINDOW = 1073741824;
pub const WS_ACTIVECAPTION = 1;
pub const OBJID_WINDOW = 0;
pub const OBJID_SYSMENU = -1;
pub const OBJID_TITLEBAR = -2;
pub const OBJID_MENU = -3;
pub const OBJID_CLIENT = -4;
pub const OBJID_VSCROLL = -5;
pub const OBJID_HSCROLL = -6;
pub const OBJID_SIZEGRIP = -7;
pub const OBJID_CARET = -8;
pub const OBJID_CURSOR = -9;
pub const OBJID_ALERT = -10;
pub const OBJID_SOUND = -11;
pub const OBJID_QUERYCLASSNAMEIDX = -12;
pub const OBJID_NATIVEOM = -16;
pub const MFT_BITMAP = 4;
pub const MFT_MENUBARBREAK = 32;
pub const MFT_MENUBREAK = 64;
pub const MFT_OWNERDRAW = 256;
pub const MFT_RADIOCHECK = 512;
pub const MFT_RIGHTJUSTIFY = 16384;
pub const MFT_RIGHTORDER = 8192;
pub const MFT_SEPARATOR = 2048;
pub const MFT_STRING = 0;
pub const IDOK = 1;
pub const IDCANCEL = 2;
pub const IDABORT = 3;
pub const IDRETRY = 4;
pub const IDIGNORE = 5;
pub const IDYES = 6;
pub const IDNO = 7;
pub const IDCLOSE = 8;
pub const IDHELP = 9;
pub const IDTRYAGAIN = 10;
pub const IDCONTINUE = 11;
pub const IDASYNC = 32001;
pub const IDTIMEOUT = 32000;
pub const MFS_GRAYED = 3;
pub const MFS_DISABLED = 3;
pub const MFS_CHECKED = 8;
pub const MFS_HILITE = 128;
pub const MFS_ENABLED = 0;
pub const MFS_UNCHECKED = 0;
pub const MFS_UNHILITE = 0;
pub const MFS_DEFAULT = 4096;
pub const SB_CTL = 2;
pub const SB_HORZ = 0;
pub const SB_VERT = 1;
pub const SB_BOTH = 3;
pub const GCW_ATOM = -32;
pub const GCL_CBCLSEXTRA = -20;
pub const GCL_CBWNDEXTRA = -18;
pub const GCL_HBRBACKGROUND = -10;
pub const GCL_HCURSOR = -12;
pub const GCL_HICON = -14;
pub const GCL_HICONSM = -34;
pub const GCL_HMODULE = -16;
pub const GCL_MENUNAME = -8;
pub const GCL_STYLE = -26;
pub const GCL_WNDPROC = -24;
pub const GCLP_HBRBACKGROUND = -10;
pub const GCLP_HCURSOR = -12;
pub const GCLP_HICON = -14;
pub const GCLP_HICONSM = -34;
pub const GCLP_HMODULE = -16;
pub const GCLP_MENUNAME = -8;
pub const GCLP_WNDPROC = -24;
pub const ULW_ALPHA = 2;
pub const ULW_COLORKEY = 1;
pub const ULW_OPAQUE = 4;
pub const ULW_EX_NORESIZE = 8;
pub const GWL_EXSTYLE = -20;
pub const GWLP_HINSTANCE = -6;
pub const GWLP_HWNDPARENT = -8;
pub const GWLP_ID = -12;
pub const GWL_STYLE = -16;
pub const GWLP_USERDATA = -21;
pub const GWLP_WNDPROC = -4;
pub const GWL_HINSTANCE = -6;
pub const GWL_ID = -12;
pub const GWL_USERDATA = -21;
pub const GWL_WNDPROC = -4;
pub const GWL_HWNDPARENT = -8;
pub const AW_ACTIVATE = 131072;
pub const AW_BLEND = 524288;
pub const AW_CENTER = 16;
pub const AW_HIDE = 65536;
pub const AW_HOR_POSITIVE = 1;
pub const AW_HOR_NEGATIVE = 2;
pub const AW_SLIDE = 262144;
pub const AW_VER_POSITIVE = 4;
pub const AW_VER_NEGATIVE = 8;
pub const MSGFLT_ADD = 1;
pub const MSGFLT_REMOVE = 2;
pub const IMAGE_BITMAP = 0;
pub const IMAGE_CURSOR = 2;
pub const IMAGE_ICON = 1;
pub const WH_CALLWNDPROC = 4;
pub const WH_CALLWNDPROCRET = 12;
pub const WH_CBT = 5;
pub const WH_DEBUG = 9;
pub const WH_FOREGROUNDIDLE = 11;
pub const WH_GETMESSAGE = 3;
pub const WH_JOURNALPLAYBACK = 1;
pub const WH_JOURNALRECORD = 0;
pub const WH_KEYBOARD = 2;
pub const WH_KEYBOARD_LL = 13;
pub const WH_MOUSE = 7;
pub const WH_MOUSE_LL = 14;
pub const WH_MSGFILTER = -1;
pub const WH_SHELL = 10;
pub const WH_SYSMSGFILTER = 6;
pub const LR_CREATEDIBSECTION = 8192;
pub const LR_DEFAULTCOLOR = 0;
pub const LR_DEFAULTSIZE = 64;
pub const LR_LOADFROMFILE = 16;
pub const LR_LOADMAP3DCOLORS = 4096;
pub const LR_LOADTRANSPARENT = 32;
pub const LR_MONOCHROME = 1;
pub const LR_SHARED = 32768;
pub const LR_VGACOLOR = 128;
pub const LR_COPYDELETEORG = 8;
pub const LR_COPYFROMRESOURCE = 16384;
pub const LR_COPYRETURNORG = 4;
pub const SPIF_UPDATEINIFILE = 1;
pub const SPIF_SENDCHANGE = 2;
pub const SPIF_SENDWININICHANGE = 2;
pub const SWP_ASYNCWINDOWPOS = 16384;
pub const SWP_DEFERERASE = 8192;
pub const SWP_DRAWFRAME = 32;
pub const SWP_FRAMECHANGED = 32;
pub const SWP_HIDEWINDOW = 128;
pub const SWP_NOACTIVATE = 16;
pub const SWP_NOCOPYBITS = 256;
pub const SWP_NOMOVE = 2;
pub const SWP_NOOWNERZORDER = 512;
pub const SWP_NOREDRAW = 8;
pub const SWP_NOREPOSITION = 512;
pub const SWP_NOSENDCHANGING = 1024;
pub const SWP_NOSIZE = 1;
pub const SWP_NOZORDER = 4;
pub const SWP_SHOWWINDOW = 64;
pub const MWMO_NONE = 0;
pub const MWMO_ALERTABLE = 2;
pub const MWMO_INPUTAVAILABLE = 4;
pub const MWMO_WAITALL = 1;
pub const QS_ALLEVENTS = 1215;
pub const QS_ALLINPUT = 1279;
pub const QS_ALLPOSTMESSAGE = 256;
pub const QS_HOTKEY = 128;
pub const QS_INPUT = 1031;
pub const QS_KEY = 1;
pub const QS_MOUSE = 6;
pub const QS_MOUSEBUTTON = 4;
pub const QS_MOUSEMOVE = 2;
pub const QS_PAINT = 32;
pub const QS_POSTMESSAGE = 8;
pub const QS_RAWINPUT = 1024;
pub const QS_SENDMESSAGE = 64;
pub const QS_TIMER = 16;
pub const DEVICE_NOTIFY_SERVICE_HANDLE = 1;
pub const DEVICE_NOTIFY_CALLBACK = 2;
pub const DEVICE_NOTIFY_WINDOW_HANDLE = 0;
pub const DEVICE_NOTIFY_ALL_INTERFACE_CLASSES = 4;
pub const OCR_APPSTARTING = 32650;
pub const OCR_NORMAL = 32512;
pub const OCR_CROSS = 32515;
pub const OCR_HAND = 32649;
pub const OCR_HELP = 32651;
pub const OCR_IBEAM = 32513;
pub const OCR_NO = 32648;
pub const OCR_SIZEALL = 32646;
pub const OCR_SIZENESW = 32643;
pub const OCR_SIZENS = 32645;
pub const OCR_SIZENWSE = 32642;
pub const OCR_SIZEWE = 32644;
pub const OCR_UP = 32516;
pub const OCR_WAIT = 32514;
pub const LWA_ALPHA = 2;
pub const LWA_COLORKEY = 1;
pub const SMTO_ABORTIFHUNG = 2;
pub const SMTO_BLOCK = 1;
pub const SMTO_NORMAL = 0;
pub const SMTO_NOTIMEOUTIFNOTHUNG = 8;
pub const SMTO_ERRORONEXIT = 32;
pub const PM_NOREMOVE = 0;
pub const PM_REMOVE = 1;
pub const PM_NOYIELD = 2;
pub const PM_QS_INPUT = 67567616;
pub const PM_QS_POSTMESSAGE = 9961472;
pub const PM_QS_PAINT = 2097152;
pub const PM_QS_SENDMESSAGE = 4194304;
pub const GW_CHILD = 5;
pub const GW_ENABLEDPOPUP = 6;
pub const GW_HWNDFIRST = 0;
pub const GW_HWNDLAST = 1;
pub const GW_HWNDNEXT = 2;
pub const GW_HWNDPREV = 3;
pub const GW_OWNER = 4;
pub const SM_ARRANGE = 56;
pub const SM_CLEANBOOT = 67;
pub const SM_CMONITORS = 80;
pub const SM_CMOUSEBUTTONS = 43;
pub const SM_CONVERTIBLESLATEMODE = 8195;
pub const SM_CXBORDER = 5;
pub const SM_CXCURSOR = 13;
pub const SM_CXDLGFRAME = 7;
pub const SM_CXDOUBLECLK = 36;
pub const SM_CXDRAG = 68;
pub const SM_CXEDGE = 45;
pub const SM_CXFIXEDFRAME = 7;
pub const SM_CXFOCUSBORDER = 83;
pub const SM_CXFRAME = 32;
pub const SM_CXFULLSCREEN = 16;
pub const SM_CXHSCROLL = 21;
pub const SM_CXHTHUMB = 10;
pub const SM_CXICON = 11;
pub const SM_CXICONSPACING = 38;
pub const SM_CXMAXIMIZED = 61;
pub const SM_CXMAXTRACK = 59;
pub const SM_CXMENUCHECK = 71;
pub const SM_CXMENUSIZE = 54;
pub const SM_CXMIN = 28;
pub const SM_CXMINIMIZED = 57;
pub const SM_CXMINSPACING = 47;
pub const SM_CXMINTRACK = 34;
pub const SM_CXPADDEDBORDER = 92;
pub const SM_CXSCREEN = 0;
pub const SM_CXSIZE = 30;
pub const SM_CXSIZEFRAME = 32;
pub const SM_CXSMICON = 49;
pub const SM_CXSMSIZE = 52;
pub const SM_CXVIRTUALSCREEN = 78;
pub const SM_CXVSCROLL = 2;
pub const SM_CYBORDER = 6;
pub const SM_CYCAPTION = 4;
pub const SM_CYCURSOR = 14;
pub const SM_CYDLGFRAME = 8;
pub const SM_CYDOUBLECLK = 37;
pub const SM_CYDRAG = 69;
pub const SM_CYEDGE = 46;
pub const SM_CYFIXEDFRAME = 8;
pub const SM_CYFOCUSBORDER = 84;
pub const SM_CYFRAME = 33;
pub const SM_CYFULLSCREEN = 17;
pub const SM_CYHSCROLL = 3;
pub const SM_CYICON = 12;
pub const SM_CYICONSPACING = 39;
pub const SM_CYKANJIWINDOW = 18;
pub const SM_CYMAXIMIZED = 62;
pub const SM_CYMAXTRACK = 60;
pub const SM_CYMENU = 15;
pub const SM_CYMENUCHECK = 72;
pub const SM_CYMENUSIZE = 55;
pub const SM_CYMIN = 29;
pub const SM_CYMINIMIZED = 58;
pub const SM_CYMINSPACING = 48;
pub const SM_CYMINTRACK = 35;
pub const SM_CYSCREEN = 1;
pub const SM_CYSIZE = 31;
pub const SM_CYSIZEFRAME = 33;
pub const SM_CYSMCAPTION = 51;
pub const SM_CYSMICON = 50;
pub const SM_CYSMSIZE = 53;
pub const SM_CYVIRTUALSCREEN = 79;
pub const SM_CYVSCROLL = 20;
pub const SM_CYVTHUMB = 9;
pub const SM_DBCSENABLED = 42;
pub const SM_DEBUG = 22;
pub const SM_DIGITIZER = 94;
pub const SM_IMMENABLED = 82;
pub const SM_MAXIMUMTOUCHES = 95;
pub const SM_MEDIACENTER = 87;
pub const SM_MENUDROPALIGNMENT = 40;
pub const SM_MIDEASTENABLED = 74;
pub const SM_MOUSEPRESENT = 19;
pub const SM_MOUSEHORIZONTALWHEELPRESENT = 91;
pub const SM_MOUSEWHEELPRESENT = 75;
pub const SM_NETWORK = 63;
pub const SM_PENWINDOWS = 41;
pub const SM_REMOTECONTROL = 8193;
pub const SM_REMOTESESSION = 4096;
pub const SM_SAMEDISPLAYFORMAT = 81;
pub const SM_SECURE = 44;
pub const SM_SERVERR2 = 89;
pub const SM_SHOWSOUNDS = 70;
pub const SM_SHUTTINGDOWN = 8192;
pub const SM_SLOWMACHINE = 73;
pub const SM_STARTER = 88;
pub const SM_SWAPBUTTON = 23;
pub const SM_SYSTEMDOCKED = 8196;
pub const SM_TABLETPC = 86;
pub const SM_XVIRTUALSCREEN = 76;
pub const SM_YVIRTUALSCREEN = 77;
pub const GA_PARENT = 1;
pub const GA_ROOT = 2;
pub const GA_ROOTOWNER = 3;
pub const MDITILE_HORIZONTAL = 1;
pub const MDITILE_VERTICAL = 0;
pub const WDA_NONE = 0;
pub const WDA_MONITOR = 1;
pub const WDA_EXCLUDEFROMCAPTURE = 17;
pub const LSFW_LOCK = 1;
pub const LSFW_UNLOCK = 2;
pub const MDITILE_SKIPDISABLED = 2;
pub const MDITILE_ZORDER = 4;
pub const MSGFLT_ALLOW = 1;
pub const MSGFLT_DISALLOW = 2;
pub const MSGFLT_RESET = 0;
pub const GMDI_GOINTOPOPUPS = 2;
pub const GMDI_USEDISABLED = 1;
pub const MSGFLTINFO_NONE = 0;
pub const MSGFLTINFO_ALLOWED_HIGHER = 3;
pub const MSGFLTINFO_ALREADYALLOWED_FORWND = 1;
pub const MSGFLTINFO_ALREADYDISALLOWED_FORWND = 2;
pub const MIIM_BITMAP = 128;
pub const MIIM_CHECKMARKS = 8;
pub const MIIM_DATA = 32;
pub const MIIM_FTYPE = 256;
pub const MIIM_ID = 2;
pub const MIIM_STATE = 1;
pub const MIIM_STRING = 64;
pub const MIIM_SUBMENU = 4;
pub const MIIM_TYPE = 16;
pub const FLASHW_ALL = 3;
pub const FLASHW_CAPTION = 1;
pub const FLASHW_STOP = 0;
pub const FLASHW_TIMER = 4;
pub const FLASHW_TIMERNOFG = 12;
pub const FLASHW_TRAY = 2;
pub const CURSOR_SHOWING = 1;
pub const CURSOR_SUPPRESSED = 2;
pub const MNS_AUTODISMISS = 268435456;
pub const MNS_CHECKORBMP = 67108864;
pub const MNS_DRAGDROP = 536870912;
pub const MNS_MODELESS = 1073741824;
pub const MNS_NOCHECK = 2147483648;
pub const MNS_NOTIFYBYPOS = 134217728;
pub const WPF_ASYNCWINDOWPLACEMENT = 4;
pub const WPF_RESTORETOMAXIMIZED = 2;
pub const WPF_SETMINPOSITION = 1;
pub const MIM_APPLYTOSUBMENUS = 2147483648;
pub const MIM_BACKGROUND = 2;
pub const MIM_HELPID = 4;
pub const MIM_MAXHEIGHT = 1;
pub const MIM_MENUDATA = 8;
pub const MIM_STYLE = 16;
pub const DBT_DEVTYP_DEVICEINTERFACE = 5;
pub const DBT_DEVTYP_HANDLE = 6;
pub const DBT_DEVTYP_OEM = 0;
pub const DBT_DEVTYP_PORT = 3;
pub const DBT_DEVTYP_VOLUME = 2;
pub const ARW_BOTTOMLEFT = 0;
pub const ARW_BOTTOMRIGHT = 1;
pub const ARW_TOPLEFT = 2;
pub const ARW_TOPRIGHT = 3;
pub const DBTF_MEDIA = 1;
pub const DBTF_NET = 2;
pub const SIF_ALL = 23;
pub const SIF_DISABLENOSCROLL = 8;
pub const SIF_PAGE = 2;
pub const SIF_POS = 4;
pub const SIF_RANGE = 1;
pub const SIF_TRACKPOS = 16;
pub const MNGOF_BOTTOMGAP = 2;
pub const MNGOF_TOPGAP = 1;
pub const GUI_CARETBLINKING = 1;
pub const GUI_INMENUMODE = 4;
pub const GUI_INMOVESIZE = 2;
pub const GUI_POPUPMENUMODE = 16;
pub const GUI_SYSTEMMENUMODE = 8;
pub const LLKHF_EXTENDED = 1;
pub const LLKHF_ALTDOWN = 32;
pub const LLKHF_UP = 128;
pub const LLKHF_INJECTED = 16;
pub const LLKHF_LOWER_IL_INJECTED = 2;
pub const FVIRTKEY = 1;
pub const FNOINVERT = 2;
pub const FSHIFT = 4;
pub const FCONTROL = 8;
pub const FALT = 16;
pub const SB_LINEUP = 0;
pub const SB_LINELEFT = 0;
pub const SB_LINEDOWN = 1;
pub const SB_LINERIGHT = 1;
pub const SB_PAGEUP = 2;
pub const SB_PAGELEFT = 2;
pub const SB_PAGEDOWN = 3;
pub const SB_PAGERIGHT = 3;
pub const SB_THUMBPOSITION = 4;
pub const SB_THUMBTRACK = 5;
pub const SB_TOP = 6;
pub const SB_LEFT = 6;
pub const SB_RIGHT = 7;
pub const SB_BOTTOM = 7;
pub const SB_ENDSCROLL = 8;
pub const WM_CONTEXTMENU = 123;
pub const WM_UNICHAR = 265;
pub const WM_PRINTCLIENT = 792;
pub const WM_NOTIFY = 78;
pub const STRSAFE_USE_SECURE_CRT = 0;
pub const STRSAFE_MAX_CCH = 2147483647;
pub const STRSAFE_MAX_LENGTH = 2147483646;
pub const STRSAFE_IGNORE_NULLS = 256;
pub const STRSAFE_FILL_BEHIND_NULL = 512;
pub const STRSAFE_FILL_ON_FAILURE = 1024;
pub const STRSAFE_NULL_ON_FAILURE = 2048;
pub const STRSAFE_NO_TRUNCATION = 4096;
pub const STRSAFE_E_INSUFFICIENT_BUFFER = -2147024774;
pub const STRSAFE_E_INVALID_PARAMETER = -2147024809;
pub const STRSAFE_E_END_OF_FILE = -2147024858;
pub const __WARNING_CYCLOMATIC_COMPLEXITY = 28734;
pub const __WARNING_USING_UNINIT_VAR = 6001;
pub const __WARNING_RETURN_UNINIT_VAR = 6101;
pub const __WARNING_DEREF_NULL_PTR = 6011;
pub const __WARNING_MISSING_ZERO_TERMINATION2 = 6054;
pub const __WARNING_INVALID_PARAM_VALUE_1 = 6387;
pub const __WARNING_UNSAFE_STRING_FUNCTION = 25025;
pub const __WARNING_INCORRECT_ANNOTATION = 26007;
pub const __WARNING_POTENTIAL_BUFFER_OVERFLOW_HIGH_PRIORITY = 26015;
pub const __WARNING_PRECONDITION_NULLTERMINATION_VIOLATION = 26035;
pub const __WARNING_POSTCONDITION_NULLTERMINATION_VIOLATION = 26036;
pub const __WARNING_HIGH_PRIORITY_OVERFLOW_POSTCONDITION = 26045;
pub const __WARNING_RANGE_POSTCONDITION_VIOLATION = 26061;
pub const __WARNING_POTENTIAL_RANGE_POSTCONDITION_VIOLATION = 26071;
pub const __WARNING_INVALID_PARAM_VALUE_3 = 28183;
pub const __WARNING_RETURNING_BAD_RESULT = 28196;
pub const __WARNING_BANNED_API_USAGE = 28719;
pub const __WARNING_POST_EXPECTED = 28210;
pub const WM_DEVICECHANGE = 537;
pub const BSF_MSGSRV32ISOK = 2147483648;
pub const BSF_MSGSRV32ISOK_BIT = 31;
pub const BSM_VXDS = 1;
pub const BSM_NETDRIVER = 2;
pub const BSM_INSTALLABLEDRIVERS = 4;
pub const DBT_APPYBEGIN = 0;
pub const DBT_APPYEND = 1;
pub const DBT_DEVNODES_CHANGED = 7;
pub const DBT_QUERYCHANGECONFIG = 23;
pub const DBT_CONFIGCHANGED = 24;
pub const DBT_CONFIGCHANGECANCELED = 25;
pub const DBT_MONITORCHANGE = 27;
pub const DBT_SHELLLOGGEDON = 32;
pub const DBT_CONFIGMGAPI32 = 34;
pub const DBT_VXDINITCOMPLETE = 35;
pub const DBT_VOLLOCKQUERYLOCK = 32833;
pub const DBT_VOLLOCKLOCKTAKEN = 32834;
pub const DBT_VOLLOCKLOCKFAILED = 32835;
pub const DBT_VOLLOCKQUERYUNLOCK = 32836;
pub const DBT_VOLLOCKLOCKRELEASED = 32837;
pub const DBT_VOLLOCKUNLOCKFAILED = 32838;
pub const LOCKP_ALLOW_WRITES = 1;
pub const LOCKP_FAIL_WRITES = 0;
pub const LOCKP_FAIL_MEM_MAPPING = 2;
pub const LOCKP_ALLOW_MEM_MAPPING = 0;
pub const LOCKP_USER_MASK = 3;
pub const LOCKP_LOCK_FOR_FORMAT = 4;
pub const LOCKF_LOGICAL_LOCK = 0;
pub const LOCKF_PHYSICAL_LOCK = 1;
pub const DBT_NO_DISK_SPACE = 71;
pub const DBT_LOW_DISK_SPACE = 72;
pub const DBT_CONFIGMGPRIVATE = 32767;
pub const DBT_DEVICEARRIVAL = 32768;
pub const DBT_DEVICEQUERYREMOVE = 32769;
pub const DBT_DEVICEQUERYREMOVEFAILED = 32770;
pub const DBT_DEVICEREMOVEPENDING = 32771;
pub const DBT_DEVICEREMOVECOMPLETE = 32772;
pub const DBT_DEVICETYPESPECIFIC = 32773;
pub const DBT_CUSTOMEVENT = 32774;
pub const DBT_DEVTYP_DEVNODE = 1;
pub const DBT_DEVTYP_NET = 4;
pub const DBTF_RESOURCE = 1;
pub const DBTF_XPORT = 2;
pub const DBTF_SLOWNET = 4;
pub const DBT_VPOWERDAPI = 33024;
pub const DBT_USERDEFINED = 65535;
pub const RT_CURSOR = 1;
pub const RT_BITMAP = 2;
pub const RT_ICON = 3;
pub const RT_MENU = 4;
pub const RT_DIALOG = 5;
pub const RT_FONTDIR = 7;
pub const RT_FONT = 8;
pub const RT_ACCELERATOR = 9;
pub const RT_MESSAGETABLE = 11;
pub const DIFFERENCE = 11;
pub const RT_VERSION = 16;
pub const RT_DLGINCLUDE = 17;
pub const RT_PLUGPLAY = 19;
pub const RT_VXD = 20;
pub const RT_ANICURSOR = 21;
pub const RT_ANIICON = 22;
pub const RT_HTML = 23;
pub const CREATEPROCESS_MANIFEST_RESOURCE_ID = 1;
pub const ISOLATIONAWARE_MANIFEST_RESOURCE_ID = 2;
pub const ISOLATIONAWARE_NOSTATICIMPORT_MANIFEST_RESOURCE_ID = 3;
pub const ISOLATIONPOLICY_MANIFEST_RESOURCE_ID = 4;
pub const ISOLATIONPOLICY_BROWSER_MANIFEST_RESOURCE_ID = 5;
pub const MINIMUM_RESERVED_MANIFEST_RESOURCE_ID = 1;
pub const MAXIMUM_RESERVED_MANIFEST_RESOURCE_ID = 16;
pub const SB_MIN = 0;
pub const HIDE_WINDOW = 0;
pub const SHOW_OPENWINDOW = 1;
pub const SHOW_ICONWINDOW = 2;
pub const SHOW_FULLSCREEN = 3;
pub const SHOW_OPENNOACTIVATE = 4;
pub const KF_EXTENDED = 256;
pub const KF_DLGMODE = 2048;
pub const KF_MENUMODE = 4096;
pub const KF_ALTDOWN = 8192;
pub const KF_REPEAT = 16384;
pub const KF_UP = 32768;
pub const WH_MIN = -1;
pub const WH_HARDWARE = 8;
pub const WH_MAX = 14;
pub const WH_MINHOOK = -1;
pub const WH_MAXHOOK = 14;
pub const HC_ACTION = 0;
pub const HC_GETNEXT = 1;
pub const HC_SKIP = 2;
pub const HC_NOREMOVE = 3;
pub const HC_NOREM = 3;
pub const HC_SYSMODALON = 4;
pub const HC_SYSMODALOFF = 5;
pub const HCBT_MOVESIZE = 0;
pub const HCBT_MINMAX = 1;
pub const HCBT_QS = 2;
pub const HCBT_CREATEWND = 3;
pub const HCBT_DESTROYWND = 4;
pub const HCBT_ACTIVATE = 5;
pub const HCBT_CLICKSKIPPED = 6;
pub const HCBT_KEYSKIPPED = 7;
pub const HCBT_SYSCOMMAND = 8;
pub const HCBT_SETFOCUS = 9;
pub const WTS_CONSOLE_CONNECT = 1;
pub const WTS_CONSOLE_DISCONNECT = 2;
pub const WTS_REMOTE_CONNECT = 3;
pub const WTS_REMOTE_DISCONNECT = 4;
pub const WTS_SESSION_LOGON = 5;
pub const WTS_SESSION_LOGOFF = 6;
pub const WTS_SESSION_LOCK = 7;
pub const WTS_SESSION_UNLOCK = 8;
pub const WTS_SESSION_REMOTE_CONTROL = 9;
pub const WTS_SESSION_CREATE = 10;
pub const WTS_SESSION_TERMINATE = 11;
pub const WTS_SESSION_DESKTOP_READY = 15;
pub const MSGF_DIALOGBOX = 0;
pub const MSGF_MESSAGEBOX = 1;
pub const MSGF_MENU = 2;
pub const MSGF_SCROLLBAR = 5;
pub const MSGF_NEXTWINDOW = 6;
pub const MSGF_MAX = 8;
pub const MSGF_USER = 4096;
pub const HSHELL_WINDOWCREATED = 1;
pub const HSHELL_WINDOWDESTROYED = 2;
pub const HSHELL_ACTIVATESHELLWINDOW = 3;
pub const HSHELL_WINDOWACTIVATED = 4;
pub const HSHELL_GETMINRECT = 5;
pub const HSHELL_REDRAW = 6;
pub const HSHELL_TASKMAN = 7;
pub const HSHELL_LANGUAGE = 8;
pub const HSHELL_SYSMENU = 9;
pub const HSHELL_ENDTASK = 10;
pub const HSHELL_ACCESSIBILITYSTATE = 11;
pub const HSHELL_APPCOMMAND = 12;
pub const HSHELL_WINDOWREPLACED = 13;
pub const HSHELL_WINDOWREPLACING = 14;
pub const HSHELL_MONITORCHANGED = 16;
pub const HSHELL_HIGHBIT = 32768;
pub const FAPPCOMMAND_MOUSE = 32768;
pub const FAPPCOMMAND_KEY = 0;
pub const FAPPCOMMAND_OEM = 4096;
pub const FAPPCOMMAND_MASK = 61440;
pub const LLMHF_INJECTED = 1;
pub const LLMHF_LOWER_IL_INJECTED = 2;
pub const HKL_PREV = 0;
pub const HKL_NEXT = 1;
pub const INPUTLANGCHANGE_SYSCHARSET = 1;
pub const INPUTLANGCHANGE_FORWARD = 2;
pub const INPUTLANGCHANGE_BACKWARD = 4;
pub const KL_NAMELENGTH = 9;
pub const WINSTA_ENUMDESKTOPS = 1;
pub const WINSTA_READATTRIBUTES = 2;
pub const WINSTA_ACCESSCLIPBOARD = 4;
pub const WINSTA_CREATEDESKTOP = 8;
pub const WINSTA_WRITEATTRIBUTES = 16;
pub const WINSTA_ACCESSGLOBALATOMS = 32;
pub const WINSTA_EXITWINDOWS = 64;
pub const WINSTA_ENUMERATE = 256;
pub const WINSTA_READSCREEN = 512;
pub const CWF_CREATE_ONLY = 1;
pub const WSF_VISIBLE = 1;
pub const UOI_TIMERPROC_EXCEPTION_SUPPRESSION = 7;
pub const WM_NULL = 0;
pub const WM_CREATE = 1;
pub const WM_DESTROY = 2;
pub const WM_MOVE = 3;
pub const WM_SIZE = 5;
pub const WM_ACTIVATE = 6;
pub const WA_INACTIVE = 0;
pub const WA_ACTIVE = 1;
pub const WA_CLICKACTIVE = 2;
pub const WM_SETFOCUS = 7;
pub const WM_KILLFOCUS = 8;
pub const WM_ENABLE = 10;
pub const WM_SETREDRAW = 11;
pub const WM_SETTEXT = 12;
pub const WM_GETTEXT = 13;
pub const WM_GETTEXTLENGTH = 14;
pub const WM_PAINT = 15;
pub const WM_CLOSE = 16;
pub const WM_QUERYENDSESSION = 17;
pub const WM_QUERYOPEN = 19;
pub const WM_ENDSESSION = 22;
pub const WM_QUIT = 18;
pub const WM_ERASEBKGND = 20;
pub const WM_SYSCOLORCHANGE = 21;
pub const WM_SHOWWINDOW = 24;
pub const WM_WININICHANGE = 26;
pub const WM_SETTINGCHANGE = 26;
pub const WM_DEVMODECHANGE = 27;
pub const WM_ACTIVATEAPP = 28;
pub const WM_FONTCHANGE = 29;
pub const WM_TIMECHANGE = 30;
pub const WM_CANCELMODE = 31;
pub const WM_SETCURSOR = 32;
pub const WM_MOUSEACTIVATE = 33;
pub const WM_CHILDACTIVATE = 34;
pub const WM_QUEUESYNC = 35;
pub const WM_GETMINMAXINFO = 36;
pub const WM_PAINTICON = 38;
pub const WM_ICONERASEBKGND = 39;
pub const WM_NEXTDLGCTL = 40;
pub const WM_SPOOLERSTATUS = 42;
pub const WM_DRAWITEM = 43;
pub const WM_MEASUREITEM = 44;
pub const WM_DELETEITEM = 45;
pub const WM_VKEYTOITEM = 46;
pub const WM_CHARTOITEM = 47;
pub const WM_SETFONT = 48;
pub const WM_GETFONT = 49;
pub const WM_SETHOTKEY = 50;
pub const WM_GETHOTKEY = 51;
pub const WM_QUERYDRAGICON = 55;
pub const WM_COMPAREITEM = 57;
pub const WM_GETOBJECT = 61;
pub const WM_COMPACTING = 65;
pub const WM_COMMNOTIFY = 68;
pub const WM_WINDOWPOSCHANGING = 70;
pub const WM_WINDOWPOSCHANGED = 71;
pub const WM_POWER = 72;
pub const PWR_OK = 1;
pub const PWR_FAIL = -1;
pub const PWR_SUSPENDREQUEST = 1;
pub const PWR_SUSPENDRESUME = 2;
pub const PWR_CRITICALRESUME = 3;
pub const WM_COPYDATA = 74;
pub const WM_CANCELJOURNAL = 75;
pub const WM_INPUTLANGCHANGEREQUEST = 80;
pub const WM_INPUTLANGCHANGE = 81;
pub const WM_TCARD = 82;
pub const WM_HELP = 83;
pub const WM_USERCHANGED = 84;
pub const WM_NOTIFYFORMAT = 85;
pub const NFR_ANSI = 1;
pub const NFR_UNICODE = 2;
pub const NF_QUERY = 3;
pub const NF_REQUERY = 4;
pub const WM_STYLECHANGING = 124;
pub const WM_STYLECHANGED = 125;
pub const WM_DISPLAYCHANGE = 126;
pub const WM_GETICON = 127;
pub const WM_SETICON = 128;
pub const WM_NCCREATE = 129;
pub const WM_NCDESTROY = 130;
pub const WM_NCCALCSIZE = 131;
pub const WM_NCHITTEST = 132;
pub const WM_NCPAINT = 133;
pub const WM_NCACTIVATE = 134;
pub const WM_GETDLGCODE = 135;
pub const WM_SYNCPAINT = 136;
pub const WM_NCMOUSEMOVE = 160;
pub const WM_NCLBUTTONDOWN = 161;
pub const WM_NCLBUTTONUP = 162;
pub const WM_NCLBUTTONDBLCLK = 163;
pub const WM_NCRBUTTONDOWN = 164;
pub const WM_NCRBUTTONUP = 165;
pub const WM_NCRBUTTONDBLCLK = 166;
pub const WM_NCMBUTTONDOWN = 167;
pub const WM_NCMBUTTONUP = 168;
pub const WM_NCMBUTTONDBLCLK = 169;
pub const WM_NCXBUTTONDOWN = 171;
pub const WM_NCXBUTTONUP = 172;
pub const WM_NCXBUTTONDBLCLK = 173;
pub const WM_INPUT_DEVICE_CHANGE = 254;
pub const WM_INPUT = 255;
pub const WM_KEYFIRST = 256;
pub const WM_KEYDOWN = 256;
pub const WM_KEYUP = 257;
pub const WM_CHAR = 258;
pub const WM_DEADCHAR = 259;
pub const WM_SYSKEYDOWN = 260;
pub const WM_SYSKEYUP = 261;
pub const WM_SYSCHAR = 262;
pub const WM_SYSDEADCHAR = 263;
pub const WM_KEYLAST = 265;
pub const UNICODE_NOCHAR = 65535;
pub const WM_IME_STARTCOMPOSITION = 269;
pub const WM_IME_ENDCOMPOSITION = 270;
pub const WM_IME_COMPOSITION = 271;
pub const WM_IME_KEYLAST = 271;
pub const WM_INITDIALOG = 272;
pub const WM_COMMAND = 273;
pub const WM_SYSCOMMAND = 274;
pub const WM_TIMER = 275;
pub const WM_HSCROLL = 276;
pub const WM_VSCROLL = 277;
pub const WM_INITMENU = 278;
pub const WM_INITMENUPOPUP = 279;
pub const WM_GESTURE = 281;
pub const WM_GESTURENOTIFY = 282;
pub const WM_MENUSELECT = 287;
pub const WM_MENUCHAR = 288;
pub const WM_ENTERIDLE = 289;
pub const WM_MENURBUTTONUP = 290;
pub const WM_MENUDRAG = 291;
pub const WM_MENUGETOBJECT = 292;
pub const WM_UNINITMENUPOPUP = 293;
pub const WM_MENUCOMMAND = 294;
pub const WM_CHANGEUISTATE = 295;
pub const WM_UPDATEUISTATE = 296;
pub const WM_QUERYUISTATE = 297;
pub const UIS_SET = 1;
pub const UIS_CLEAR = 2;
pub const UIS_INITIALIZE = 3;
pub const UISF_HIDEFOCUS = 1;
pub const UISF_HIDEACCEL = 2;
pub const UISF_ACTIVE = 4;
pub const WM_CTLCOLORMSGBOX = 306;
pub const WM_CTLCOLOREDIT = 307;
pub const WM_CTLCOLORLISTBOX = 308;
pub const WM_CTLCOLORBTN = 309;
pub const WM_CTLCOLORDLG = 310;
pub const WM_CTLCOLORSCROLLBAR = 311;
pub const WM_CTLCOLORSTATIC = 312;
pub const MN_GETHMENU = 481;
pub const WM_MOUSEFIRST = 512;
pub const WM_MOUSEMOVE = 512;
pub const WM_LBUTTONDOWN = 513;
pub const WM_LBUTTONUP = 514;
pub const WM_LBUTTONDBLCLK = 515;
pub const WM_RBUTTONDOWN = 516;
pub const WM_RBUTTONUP = 517;
pub const WM_RBUTTONDBLCLK = 518;
pub const WM_MBUTTONDOWN = 519;
pub const WM_MBUTTONUP = 520;
pub const WM_MBUTTONDBLCLK = 521;
pub const WM_MOUSEWHEEL = 522;
pub const WM_XBUTTONDOWN = 523;
pub const WM_XBUTTONUP = 524;
pub const WM_XBUTTONDBLCLK = 525;
pub const WM_MOUSEHWHEEL = 526;
pub const WM_MOUSELAST = 526;
pub const WHEEL_DELTA = 120;
pub const XBUTTON1 = 1;
pub const XBUTTON2 = 2;
pub const WM_PARENTNOTIFY = 528;
pub const WM_ENTERMENULOOP = 529;
pub const WM_EXITMENULOOP = 530;
pub const WM_NEXTMENU = 531;
pub const WM_SIZING = 532;
pub const WM_CAPTURECHANGED = 533;
pub const WM_MOVING = 534;
pub const WM_POWERBROADCAST = 536;
pub const PBT_APMQUERYSUSPEND = 0;
pub const PBT_APMQUERYSTANDBY = 1;
pub const PBT_APMQUERYSUSPENDFAILED = 2;
pub const PBT_APMQUERYSTANDBYFAILED = 3;
pub const PBT_APMSUSPEND = 4;
pub const PBT_APMSTANDBY = 5;
pub const PBT_APMRESUMECRITICAL = 6;
pub const PBT_APMRESUMESUSPEND = 7;
pub const PBT_APMRESUMESTANDBY = 8;
pub const PBTF_APMRESUMEFROMFAILURE = 1;
pub const PBT_APMBATTERYLOW = 9;
pub const PBT_APMPOWERSTATUSCHANGE = 10;
pub const PBT_APMOEMEVENT = 11;
pub const PBT_APMRESUMEAUTOMATIC = 18;
pub const PBT_POWERSETTINGCHANGE = 32787;
pub const WM_MDICREATE = 544;
pub const WM_MDIDESTROY = 545;
pub const WM_MDIACTIVATE = 546;
pub const WM_MDIRESTORE = 547;
pub const WM_MDINEXT = 548;
pub const WM_MDIMAXIMIZE = 549;
pub const WM_MDITILE = 550;
pub const WM_MDICASCADE = 551;
pub const WM_MDIICONARRANGE = 552;
pub const WM_MDIGETACTIVE = 553;
pub const WM_MDISETMENU = 560;
pub const WM_ENTERSIZEMOVE = 561;
pub const WM_EXITSIZEMOVE = 562;
pub const WM_DROPFILES = 563;
pub const WM_MDIREFRESHMENU = 564;
pub const WM_POINTERDEVICECHANGE = 568;
pub const WM_POINTERDEVICEINRANGE = 569;
pub const WM_POINTERDEVICEOUTOFRANGE = 570;
pub const WM_TOUCH = 576;
pub const WM_NCPOINTERUPDATE = 577;
pub const WM_NCPOINTERDOWN = 578;
pub const WM_NCPOINTERUP = 579;
pub const WM_POINTERUPDATE = 581;
pub const WM_POINTERDOWN = 582;
pub const WM_POINTERUP = 583;
pub const WM_POINTERENTER = 585;
pub const WM_POINTERLEAVE = 586;
pub const WM_POINTERACTIVATE = 587;
pub const WM_POINTERCAPTURECHANGED = 588;
pub const WM_TOUCHHITTESTING = 589;
pub const WM_POINTERWHEEL = 590;
pub const WM_POINTERHWHEEL = 591;
pub const DM_POINTERHITTEST = 592;
pub const WM_POINTERROUTEDTO = 593;
pub const WM_POINTERROUTEDAWAY = 594;
pub const WM_POINTERROUTEDRELEASED = 595;
pub const WM_IME_SETCONTEXT = 641;
pub const WM_IME_NOTIFY = 642;
pub const WM_IME_CONTROL = 643;
pub const WM_IME_COMPOSITIONFULL = 644;
pub const WM_IME_SELECT = 645;
pub const WM_IME_CHAR = 646;
pub const WM_IME_REQUEST = 648;
pub const WM_IME_KEYDOWN = 656;
pub const WM_IME_KEYUP = 657;
pub const WM_NCMOUSEHOVER = 672;
pub const WM_NCMOUSELEAVE = 674;
pub const WM_WTSSESSION_CHANGE = 689;
pub const WM_TABLET_FIRST = 704;
pub const WM_TABLET_LAST = 735;
pub const WM_DPICHANGED = 736;
pub const WM_DPICHANGED_BEFOREPARENT = 738;
pub const WM_DPICHANGED_AFTERPARENT = 739;
pub const WM_GETDPISCALEDSIZE = 740;
pub const WM_CUT = 768;
pub const WM_COPY = 769;
pub const WM_PASTE = 770;
pub const WM_CLEAR = 771;
pub const WM_UNDO = 772;
pub const WM_RENDERFORMAT = 773;
pub const WM_RENDERALLFORMATS = 774;
pub const WM_DESTROYCLIPBOARD = 775;
pub const WM_DRAWCLIPBOARD = 776;
pub const WM_PAINTCLIPBOARD = 777;
pub const WM_VSCROLLCLIPBOARD = 778;
pub const WM_SIZECLIPBOARD = 779;
pub const WM_ASKCBFORMATNAME = 780;
pub const WM_CHANGECBCHAIN = 781;
pub const WM_HSCROLLCLIPBOARD = 782;
pub const WM_QUERYNEWPALETTE = 783;
pub const WM_PALETTEISCHANGING = 784;
pub const WM_PALETTECHANGED = 785;
pub const WM_HOTKEY = 786;
pub const WM_PRINT = 791;
pub const WM_APPCOMMAND = 793;
pub const WM_THEMECHANGED = 794;
pub const WM_CLIPBOARDUPDATE = 797;
pub const WM_DWMCOMPOSITIONCHANGED = 798;
pub const WM_DWMNCRENDERINGCHANGED = 799;
pub const WM_DWMCOLORIZATIONCOLORCHANGED = 800;
pub const WM_DWMWINDOWMAXIMIZEDCHANGE = 801;
pub const WM_DWMSENDICONICTHUMBNAIL = 803;
pub const WM_DWMSENDICONICLIVEPREVIEWBITMAP = 806;
pub const WM_GETTITLEBARINFOEX = 831;
pub const WM_HANDHELDFIRST = 856;
pub const WM_HANDHELDLAST = 863;
pub const WM_AFXFIRST = 864;
pub const WM_AFXLAST = 895;
pub const WM_PENWINFIRST = 896;
pub const WM_PENWINLAST = 911;
pub const WM_APP = 32768;
pub const WM_USER = 1024;
pub const WMSZ_LEFT = 1;
pub const WMSZ_RIGHT = 2;
pub const WMSZ_TOP = 3;
pub const WMSZ_TOPLEFT = 4;
pub const WMSZ_TOPRIGHT = 5;
pub const WMSZ_BOTTOM = 6;
pub const WMSZ_BOTTOMLEFT = 7;
pub const WMSZ_BOTTOMRIGHT = 8;
pub const HTERROR = -2;
pub const HTTRANSPARENT = -1;
pub const HTNOWHERE = 0;
pub const HTCLIENT = 1;
pub const HTCAPTION = 2;
pub const HTSYSMENU = 3;
pub const HTGROWBOX = 4;
pub const HTSIZE = 4;
pub const HTMENU = 5;
pub const HTHSCROLL = 6;
pub const HTVSCROLL = 7;
pub const HTMINBUTTON = 8;
pub const HTMAXBUTTON = 9;
pub const HTLEFT = 10;
pub const HTRIGHT = 11;
pub const HTTOP = 12;
pub const HTTOPLEFT = 13;
pub const HTTOPRIGHT = 14;
pub const HTBOTTOM = 15;
pub const HTBOTTOMLEFT = 16;
pub const HTBOTTOMRIGHT = 17;
pub const HTBORDER = 18;
pub const HTREDUCE = 8;
pub const HTZOOM = 9;
pub const HTSIZEFIRST = 10;
pub const HTSIZELAST = 17;
pub const HTOBJECT = 19;
pub const HTCLOSE = 20;
pub const HTHELP = 21;
pub const MA_ACTIVATE = 1;
pub const MA_ACTIVATEANDEAT = 2;
pub const MA_NOACTIVATE = 3;
pub const MA_NOACTIVATEANDEAT = 4;
pub const ICON_SMALL = 0;
pub const ICON_BIG = 1;
pub const ICON_SMALL2 = 2;
pub const SIZE_RESTORED = 0;
pub const SIZE_MINIMIZED = 1;
pub const SIZE_MAXIMIZED = 2;
pub const SIZE_MAXSHOW = 3;
pub const SIZE_MAXHIDE = 4;
pub const SIZENORMAL = 0;
pub const SIZEICONIC = 1;
pub const SIZEFULLSCREEN = 2;
pub const SIZEZOOMSHOW = 3;
pub const SIZEZOOMHIDE = 4;
pub const WVR_ALIGNTOP = 16;
pub const WVR_ALIGNLEFT = 32;
pub const WVR_ALIGNBOTTOM = 64;
pub const WVR_ALIGNRIGHT = 128;
pub const WVR_HREDRAW = 256;
pub const WVR_VREDRAW = 512;
pub const WVR_VALIDRECTS = 1024;
pub const PRF_CHECKVISIBLE = 1;
pub const PRF_NONCLIENT = 2;
pub const PRF_CLIENT = 4;
pub const PRF_ERASEBKGND = 8;
pub const PRF_CHILDREN = 16;
pub const PRF_OWNED = 32;
pub const IDANI_OPEN = 1;
pub const IDANI_CAPTION = 3;
pub const IDHOT_SNAPWINDOW = -1;
pub const IDHOT_SNAPDESKTOP = -2;
pub const ENDSESSION_CLOSEAPP = 1;
pub const ENDSESSION_CRITICAL = 1073741824;
pub const ENDSESSION_LOGOFF = 2147483648;
pub const BROADCAST_QUERY_DENY = 1112363332;
pub const HWND_BROADCAST = 65535;
pub const HWND_MESSAGE = -3;
pub const ISMEX_NOSEND = 0;
pub const ISMEX_SEND = 1;
pub const ISMEX_NOTIFY = 2;
pub const ISMEX_CALLBACK = 4;
pub const ISMEX_REPLIED = 8;
pub const HWND_DESKTOP = 0;
pub const PW_RENDERFULLCONTENT = 2;
pub const SWP_NONE = 0;
pub const HWND_TOP = 0;
pub const HWND_BOTTOM = 1;
pub const HWND_TOPMOST = -1;
pub const HWND_NOTOPMOST = -2;
pub const DLGWINDOWEXTRA = 30;
pub const POINTER_MOD_SHIFT = 4;
pub const POINTER_MOD_CTRL = 8;
pub const TOUCH_FLAG_NONE = 0;
pub const TOUCH_MASK_NONE = 0;
pub const TOUCH_MASK_CONTACTAREA = 1;
pub const TOUCH_MASK_ORIENTATION = 2;
pub const TOUCH_MASK_PRESSURE = 4;
pub const PEN_FLAG_NONE = 0;
pub const PEN_FLAG_BARREL = 1;
pub const PEN_FLAG_INVERTED = 2;
pub const PEN_FLAG_ERASER = 4;
pub const PEN_MASK_NONE = 0;
pub const PEN_MASK_PRESSURE = 1;
pub const PEN_MASK_ROTATION = 2;
pub const PEN_MASK_TILT_X = 4;
pub const PEN_MASK_TILT_Y = 8;
pub const POINTER_MESSAGE_FLAG_NEW = 1;
pub const POINTER_MESSAGE_FLAG_INRANGE = 2;
pub const POINTER_MESSAGE_FLAG_INCONTACT = 4;
pub const POINTER_MESSAGE_FLAG_FIRSTBUTTON = 16;
pub const POINTER_MESSAGE_FLAG_SECONDBUTTON = 32;
pub const POINTER_MESSAGE_FLAG_THIRDBUTTON = 64;
pub const POINTER_MESSAGE_FLAG_FOURTHBUTTON = 128;
pub const POINTER_MESSAGE_FLAG_FIFTHBUTTON = 256;
pub const POINTER_MESSAGE_FLAG_PRIMARY = 8192;
pub const POINTER_MESSAGE_FLAG_CONFIDENCE = 16384;
pub const POINTER_MESSAGE_FLAG_CANCELED = 32768;
pub const PA_ACTIVATE = 1;
pub const PA_NOACTIVATE = 3;
pub const MAX_TOUCH_COUNT = 256;
pub const TOUCH_HIT_TESTING_DEFAULT = 0;
pub const TOUCH_HIT_TESTING_CLIENT = 1;
pub const TOUCH_HIT_TESTING_NONE = 2;
pub const TOUCH_HIT_TESTING_PROXIMITY_CLOSEST = 0;
pub const TOUCH_HIT_TESTING_PROXIMITY_FARTHEST = 4095;
pub const GWFS_INCLUDE_ANCESTORS = 1;
pub const QS_TOUCH = 2048;
pub const QS_POINTER = 4096;
pub const USER_TIMER_MAXIMUM = 2147483647;
pub const USER_TIMER_MINIMUM = 10;
pub const TIMERV_DEFAULT_COALESCING = 0;
pub const TIMERV_NO_COALESCING = 4294967295;
pub const TIMERV_COALESCING_MIN = 1;
pub const TIMERV_COALESCING_MAX = 2147483637;
pub const SM_RESERVED1 = 24;
pub const SM_RESERVED2 = 25;
pub const SM_RESERVED3 = 26;
pub const SM_RESERVED4 = 27;
pub const SM_CMETRICS = 76;
pub const SM_CARETBLINKINGENABLED = 8194;
pub const MENU_GET_ITEM_INFO = 1;
pub const MENU_GET_ITEM_DATA = 2;
pub const MENU_GET_SUBMENU = 4;
pub const MENU_INSERT_MENU = 8;
pub const MENU_INSERT_ITEM = 16;
pub const MENU_DELETE_MENU = 32;
pub const MENU_SET_ITEM_INFO = 64;
pub const MENU_ENABLE_ITEM = 128;
pub const MENU_CHECK_ITEM = 256;
pub const MENU_SET_DEFAULT_ITEM = 512;
pub const MENU_SET_ITEM_DATA = 1024;
pub const MENU_SET_SUBMENU = 2048;
pub const PMB_ACTIVE = 1;
pub const MNC_IGNORE = 0;
pub const MNC_CLOSE = 1;
pub const MNC_EXECUTE = 2;
pub const MNC_SELECT = 3;
pub const MND_CONTINUE = 0;
pub const MND_ENDMENU = 1;
pub const MNGO_NOINTERFACE = 0;
pub const MNGO_NOERROR = 1;
pub const DOF_EXECUTABLE = 32769;
pub const DOF_DOCUMENT = 32770;
pub const DOF_DIRECTORY = 32771;
pub const DOF_MULTIPLE = 32772;
pub const DOF_PROGMAN = 1;
pub const DOF_SHELLDATA = 2;
pub const DO_DROPFILE = 1162627398;
pub const DO_PRINTFILE = 1414419024;
pub const ASFW_ANY = 4294967295;
pub const DCX_EXCLUDEUPDATE = 256;
pub const CTLCOLOR_MSGBOX = 0;
pub const CTLCOLOR_EDIT = 1;
pub const CTLCOLOR_LISTBOX = 2;
pub const CTLCOLOR_BTN = 3;
pub const CTLCOLOR_DLG = 4;
pub const CTLCOLOR_SCROLLBAR = 5;
pub const CTLCOLOR_STATIC = 6;
pub const CTLCOLOR_MAX = 7;
pub const GW_MAX = 5;
pub const SC_SIZE = 61440;
pub const SC_MOVE = 61456;
pub const SC_MINIMIZE = 61472;
pub const SC_MAXIMIZE = 61488;
pub const SC_NEXTWINDOW = 61504;
pub const SC_PREVWINDOW = 61520;
pub const SC_CLOSE = 61536;
pub const SC_VSCROLL = 61552;
pub const SC_HSCROLL = 61568;
pub const SC_MOUSEMENU = 61584;
pub const SC_KEYMENU = 61696;
pub const SC_ARRANGE = 61712;
pub const SC_RESTORE = 61728;
pub const SC_TASKLIST = 61744;
pub const SC_HOTKEY = 61776;
pub const SC_DEFAULT = 61792;
pub const SC_MONITORPOWER = 61808;
pub const SC_CONTEXTHELP = 61824;
pub const SC_SEPARATOR = 61455;
pub const SCF_ISSECURE = 1;
pub const SC_ICON = 61472;
pub const SC_ZOOM = 61488;
pub const IDC_ARROW = 32512;
pub const IDC_IBEAM = 32513;
pub const IDC_WAIT = 32514;
pub const IDC_CROSS = 32515;
pub const IDC_UPARROW = 32516;
pub const IDC_SIZE = 32640;
pub const IDC_ICON = 32641;
pub const IDC_SIZENWSE = 32642;
pub const IDC_SIZENESW = 32643;
pub const IDC_SIZEWE = 32644;
pub const IDC_SIZENS = 32645;
pub const IDC_SIZEALL = 32646;
pub const IDC_NO = 32648;
pub const IDC_HAND = 32649;
pub const IDC_APPSTARTING = 32650;
pub const IDC_HELP = 32651;
pub const IDC_PIN = 32671;
pub const IDC_PERSON = 32672;
pub const CURSOR_CREATION_SCALING_NONE = 1;
pub const CURSOR_CREATION_SCALING_DEFAULT = 2;
pub const IMAGE_ENHMETAFILE = 3;
pub const LR_COLOR = 2;
pub const RES_ICON = 1;
pub const RES_CURSOR = 2;
pub const OBM_CLOSE = 32754;
pub const OBM_UPARROW = 32753;
pub const OBM_DNARROW = 32752;
pub const OBM_RGARROW = 32751;
pub const OBM_LFARROW = 32750;
pub const OBM_REDUCE = 32749;
pub const OBM_ZOOM = 32748;
pub const OBM_RESTORE = 32747;
pub const OBM_REDUCED = 32746;
pub const OBM_ZOOMD = 32745;
pub const OBM_RESTORED = 32744;
pub const OBM_UPARROWD = 32743;
pub const OBM_DNARROWD = 32742;
pub const OBM_RGARROWD = 32741;
pub const OBM_LFARROWD = 32740;
pub const OBM_MNARROW = 32739;
pub const OBM_COMBO = 32738;
pub const OBM_UPARROWI = 32737;
pub const OBM_DNARROWI = 32736;
pub const OBM_RGARROWI = 32735;
pub const OBM_LFARROWI = 32734;
pub const OBM_OLD_CLOSE = 32767;
pub const OBM_SIZE = 32766;
pub const OBM_OLD_UPARROW = 32765;
pub const OBM_OLD_DNARROW = 32764;
pub const OBM_OLD_RGARROW = 32763;
pub const OBM_OLD_LFARROW = 32762;
pub const OBM_BTSIZE = 32761;
pub const OBM_CHECK = 32760;
pub const OBM_CHECKBOXES = 32759;
pub const OBM_BTNCORNERS = 32758;
pub const OBM_OLD_REDUCE = 32757;
pub const OBM_OLD_ZOOM = 32756;
pub const OBM_OLD_RESTORE = 32755;
pub const OCR_SIZE = 32640;
pub const OCR_ICON = 32641;
pub const OCR_ICOCUR = 32647;
pub const OIC_SAMPLE = 32512;
pub const OIC_HAND = 32513;
pub const OIC_QUES = 32514;
pub const OIC_BANG = 32515;
pub const OIC_NOTE = 32516;
pub const OIC_WINLOGO = 32517;
pub const OIC_WARNING = 32515;
pub const OIC_ERROR = 32513;
pub const OIC_INFORMATION = 32516;
pub const OIC_SHIELD = 32518;
pub const ORD_LANGDRIVER = 1;
pub const IDI_APPLICATION = 32512;
pub const IDI_HAND = 32513;
pub const IDI_QUESTION = 32514;
pub const IDI_EXCLAMATION = 32515;
pub const IDI_ASTERISK = 32516;
pub const IDI_WINLOGO = 32517;
pub const IDI_SHIELD = 32518;
pub const IDI_WARNING = 32515;
pub const IDI_ERROR = 32513;
pub const IDI_INFORMATION = 32516;
pub const ES_LEFT = 0;
pub const ES_CENTER = 1;
pub const ES_RIGHT = 2;
pub const ES_MULTILINE = 4;
pub const ES_UPPERCASE = 8;
pub const ES_LOWERCASE = 16;
pub const ES_PASSWORD = 32;
pub const ES_AUTOVSCROLL = 64;
pub const ES_AUTOHSCROLL = 128;
pub const ES_NOHIDESEL = 256;
pub const ES_OEMCONVERT = 1024;
pub const ES_READONLY = 2048;
pub const ES_WANTRETURN = 4096;
pub const ES_NUMBER = 8192;
pub const EN_SETFOCUS = 256;
pub const EN_KILLFOCUS = 512;
pub const EN_CHANGE = 768;
pub const EN_UPDATE = 1024;
pub const EN_ERRSPACE = 1280;
pub const EN_MAXTEXT = 1281;
pub const EN_HSCROLL = 1537;
pub const EN_VSCROLL = 1538;
pub const EN_ALIGN_LTR_EC = 1792;
pub const EN_ALIGN_RTL_EC = 1793;
pub const EN_BEFORE_PASTE = 2048;
pub const EN_AFTER_PASTE = 2049;
pub const EC_LEFTMARGIN = 1;
pub const EC_RIGHTMARGIN = 2;
pub const EC_USEFONTINFO = 65535;
pub const EMSIS_COMPOSITIONSTRING = 1;
pub const EIMES_GETCOMPSTRATONCE = 1;
pub const EIMES_CANCELCOMPSTRINFOCUS = 2;
pub const EIMES_COMPLETECOMPSTRKILLFOCUS = 4;
pub const BS_PUSHBUTTON = 0;
pub const BS_DEFPUSHBUTTON = 1;
pub const BS_CHECKBOX = 2;
pub const BS_AUTOCHECKBOX = 3;
pub const BS_RADIOBUTTON = 4;
pub const BS_3STATE = 5;
pub const BS_AUTO3STATE = 6;
pub const BS_GROUPBOX = 7;
pub const BS_USERBUTTON = 8;
pub const BS_AUTORADIOBUTTON = 9;
pub const BS_PUSHBOX = 10;
pub const BS_OWNERDRAW = 11;
pub const BS_TYPEMASK = 15;
pub const BS_LEFTTEXT = 32;
pub const BS_TEXT = 0;
pub const BS_ICON = 64;
pub const BS_BITMAP = 128;
pub const BS_LEFT = 256;
pub const BS_RIGHT = 512;
pub const BS_CENTER = 768;
pub const BS_TOP = 1024;
pub const BS_BOTTOM = 2048;
pub const BS_VCENTER = 3072;
pub const BS_PUSHLIKE = 4096;
pub const BS_MULTILINE = 8192;
pub const BS_NOTIFY = 16384;
pub const BS_FLAT = 32768;
pub const BS_RIGHTBUTTON = 32;
pub const BN_CLICKED = 0;
pub const BN_PAINT = 1;
pub const BN_HILITE = 2;
pub const BN_UNHILITE = 3;
pub const BN_DISABLE = 4;
pub const BN_DOUBLECLICKED = 5;
pub const BN_PUSHED = 2;
pub const BN_UNPUSHED = 3;
pub const BN_DBLCLK = 5;
pub const BN_SETFOCUS = 6;
pub const BN_KILLFOCUS = 7;
pub const BM_GETCHECK = 240;
pub const BM_SETCHECK = 241;
pub const BM_GETSTATE = 242;
pub const BM_SETSTATE = 243;
pub const BM_SETSTYLE = 244;
pub const BM_CLICK = 245;
pub const BM_GETIMAGE = 246;
pub const BM_SETIMAGE = 247;
pub const BM_SETDONTCLICK = 248;
pub const BST_PUSHED = 4;
pub const BST_FOCUS = 8;
pub const STM_SETICON = 368;
pub const STM_GETICON = 369;
pub const STM_SETIMAGE = 370;
pub const STM_GETIMAGE = 371;
pub const STN_CLICKED = 0;
pub const STN_DBLCLK = 1;
pub const STN_ENABLE = 2;
pub const STN_DISABLE = 3;
pub const STM_MSGMAX = 372;
pub const DWL_MSGRESULT = 0;
pub const DWL_DLGPROC = 4;
pub const DWL_USER = 8;
pub const DWLP_MSGRESULT = 0;
pub const DS_ABSALIGN = 1;
pub const DS_SYSMODAL = 2;
pub const DS_LOCALEDIT = 32;
pub const DS_SETFONT = 64;
pub const DS_MODALFRAME = 128;
pub const DS_NOIDLEMSG = 256;
pub const DS_SETFOREGROUND = 512;
pub const DS_3DLOOK = 4;
pub const DS_FIXEDSYS = 8;
pub const DS_NOFAILCREATE = 16;
pub const DS_CONTROL = 1024;
pub const DS_CENTER = 2048;
pub const DS_CENTERMOUSE = 4096;
pub const DS_CONTEXTHELP = 8192;
pub const DS_USEPIXELS = 32768;
pub const DM_GETDEFID = 1024;
pub const DM_SETDEFID = 1025;
pub const DM_REPOSITION = 1026;
pub const DC_HASDEFID = 21323;
pub const DLGC_WANTARROWS = 1;
pub const DLGC_WANTTAB = 2;
pub const DLGC_WANTALLKEYS = 4;
pub const DLGC_WANTMESSAGE = 4;
pub const DLGC_HASSETSEL = 8;
pub const DLGC_DEFPUSHBUTTON = 16;
pub const DLGC_UNDEFPUSHBUTTON = 32;
pub const DLGC_RADIOBUTTON = 64;
pub const DLGC_WANTCHARS = 128;
pub const DLGC_STATIC = 256;
pub const DLGC_BUTTON = 8192;
pub const LB_CTLCODE = 0;
pub const LB_OKAY = 0;
pub const LB_ERR = -1;
pub const LB_ERRSPACE = -2;
pub const LBN_ERRSPACE = -2;
pub const LBN_SELCHANGE = 1;
pub const LBN_DBLCLK = 2;
pub const LBN_SELCANCEL = 3;
pub const LBN_SETFOCUS = 4;
pub const LBN_KILLFOCUS = 5;
pub const LB_ADDSTRING = 384;
pub const LB_INSERTSTRING = 385;
pub const LB_DELETESTRING = 386;
pub const LB_SELITEMRANGEEX = 387;
pub const LB_RESETCONTENT = 388;
pub const LB_SETSEL = 389;
pub const LB_SETCURSEL = 390;
pub const LB_GETSEL = 391;
pub const LB_GETCURSEL = 392;
pub const LB_GETTEXT = 393;
pub const LB_GETTEXTLEN = 394;
pub const LB_GETCOUNT = 395;
pub const LB_SELECTSTRING = 396;
pub const LB_DIR = 397;
pub const LB_GETTOPINDEX = 398;
pub const LB_FINDSTRING = 399;
pub const LB_GETSELCOUNT = 400;
pub const LB_GETSELITEMS = 401;
pub const LB_SETTABSTOPS = 402;
pub const LB_GETHORIZONTALEXTENT = 403;
pub const LB_SETHORIZONTALEXTENT = 404;
pub const LB_SETCOLUMNWIDTH = 405;
pub const LB_ADDFILE = 406;
pub const LB_SETTOPINDEX = 407;
pub const LB_GETITEMRECT = 408;
pub const LB_GETITEMDATA = 409;
pub const LB_SETITEMDATA = 410;
pub const LB_SELITEMRANGE = 411;
pub const LB_SETANCHORINDEX = 412;
pub const LB_GETANCHORINDEX = 413;
pub const LB_SETCARETINDEX = 414;
pub const LB_GETCARETINDEX = 415;
pub const LB_SETITEMHEIGHT = 416;
pub const LB_GETITEMHEIGHT = 417;
pub const LB_FINDSTRINGEXACT = 418;
pub const LB_SETLOCALE = 421;
pub const LB_GETLOCALE = 422;
pub const LB_SETCOUNT = 423;
pub const LB_INITSTORAGE = 424;
pub const LB_ITEMFROMPOINT = 425;
pub const LB_MULTIPLEADDSTRING = 433;
pub const LB_GETLISTBOXINFO = 434;
pub const LB_MSGMAX = 435;
pub const LBS_NOTIFY = 1;
pub const LBS_SORT = 2;
pub const LBS_NOREDRAW = 4;
pub const LBS_MULTIPLESEL = 8;
pub const LBS_OWNERDRAWFIXED = 16;
pub const LBS_OWNERDRAWVARIABLE = 32;
pub const LBS_HASSTRINGS = 64;
pub const LBS_USETABSTOPS = 128;
pub const LBS_NOINTEGRALHEIGHT = 256;
pub const LBS_MULTICOLUMN = 512;
pub const LBS_WANTKEYBOARDINPUT = 1024;
pub const LBS_EXTENDEDSEL = 2048;
pub const LBS_DISABLENOSCROLL = 4096;
pub const LBS_NODATA = 8192;
pub const LBS_NOSEL = 16384;
pub const LBS_COMBOBOX = 32768;
pub const CB_OKAY = 0;
pub const CB_ERR = -1;
pub const CB_ERRSPACE = -2;
pub const CBN_ERRSPACE = -1;
pub const CBN_SELCHANGE = 1;
pub const CBN_DBLCLK = 2;
pub const CBN_SETFOCUS = 3;
pub const CBN_KILLFOCUS = 4;
pub const CBN_EDITCHANGE = 5;
pub const CBN_EDITUPDATE = 6;
pub const CBN_DROPDOWN = 7;
pub const CBN_CLOSEUP = 8;
pub const CBN_SELENDOK = 9;
pub const CBN_SELENDCANCEL = 10;
pub const CBS_SIMPLE = 1;
pub const CBS_DROPDOWN = 2;
pub const CBS_DROPDOWNLIST = 3;
pub const CBS_OWNERDRAWFIXED = 16;
pub const CBS_OWNERDRAWVARIABLE = 32;
pub const CBS_AUTOHSCROLL = 64;
pub const CBS_OEMCONVERT = 128;
pub const CBS_SORT = 256;
pub const CBS_HASSTRINGS = 512;
pub const CBS_NOINTEGRALHEIGHT = 1024;
pub const CBS_DISABLENOSCROLL = 2048;
pub const CBS_UPPERCASE = 8192;
pub const CBS_LOWERCASE = 16384;
pub const CB_GETEDITSEL = 320;
pub const CB_LIMITTEXT = 321;
pub const CB_SETEDITSEL = 322;
pub const CB_ADDSTRING = 323;
pub const CB_DELETESTRING = 324;
pub const CB_DIR = 325;
pub const CB_GETCOUNT = 326;
pub const CB_GETCURSEL = 327;
pub const CB_GETLBTEXT = 328;
pub const CB_GETLBTEXTLEN = 329;
pub const CB_INSERTSTRING = 330;
pub const CB_RESETCONTENT = 331;
pub const CB_FINDSTRING = 332;
pub const CB_SELECTSTRING = 333;
pub const CB_SETCURSEL = 334;
pub const CB_SHOWDROPDOWN = 335;
pub const CB_GETITEMDATA = 336;
pub const CB_SETITEMDATA = 337;
pub const CB_GETDROPPEDCONTROLRECT = 338;
pub const CB_SETITEMHEIGHT = 339;
pub const CB_GETITEMHEIGHT = 340;
pub const CB_SETEXTENDEDUI = 341;
pub const CB_GETEXTENDEDUI = 342;
pub const CB_GETDROPPEDSTATE = 343;
pub const CB_FINDSTRINGEXACT = 344;
pub const CB_SETLOCALE = 345;
pub const CB_GETLOCALE = 346;
pub const CB_GETTOPINDEX = 347;
pub const CB_SETTOPINDEX = 348;
pub const CB_GETHORIZONTALEXTENT = 349;
pub const CB_SETHORIZONTALEXTENT = 350;
pub const CB_GETDROPPEDWIDTH = 351;
pub const CB_SETDROPPEDWIDTH = 352;
pub const CB_INITSTORAGE = 353;
pub const CB_MULTIPLEADDSTRING = 355;
pub const CB_GETCOMBOBOXINFO = 356;
pub const CB_MSGMAX = 357;
pub const SBS_HORZ = 0;
pub const SBS_VERT = 1;
pub const SBS_TOPALIGN = 2;
pub const SBS_LEFTALIGN = 2;
pub const SBS_BOTTOMALIGN = 4;
pub const SBS_RIGHTALIGN = 4;
pub const SBS_SIZEBOXTOPLEFTALIGN = 2;
pub const SBS_SIZEBOXBOTTOMRIGHTALIGN = 4;
pub const SBS_SIZEBOX = 8;
pub const SBS_SIZEGRIP = 16;
pub const SBM_SETPOS = 224;
pub const SBM_GETPOS = 225;
pub const SBM_SETRANGE = 226;
pub const SBM_SETRANGEREDRAW = 230;
pub const SBM_GETRANGE = 227;
pub const SBM_ENABLE_ARROWS = 228;
pub const SBM_SETSCROLLINFO = 233;
pub const SBM_GETSCROLLINFO = 234;
pub const SBM_GETSCROLLBARINFO = 235;
pub const MDIS_ALLCHILDSTYLES = 1;
pub const HELP_CONTEXT = 1;
pub const HELP_QUIT = 2;
pub const HELP_INDEX = 3;
pub const HELP_CONTENTS = 3;
pub const HELP_HELPONHELP = 4;
pub const HELP_SETINDEX = 5;
pub const HELP_SETCONTENTS = 5;
pub const HELP_CONTEXTPOPUP = 8;
pub const HELP_FORCEFILE = 9;
pub const HELP_KEY = 257;
pub const HELP_COMMAND = 258;
pub const HELP_PARTIALKEY = 261;
pub const HELP_MULTIKEY = 513;
pub const HELP_SETWINPOS = 515;
pub const HELP_CONTEXTMENU = 10;
pub const HELP_FINDER = 11;
pub const HELP_WM_HELP = 12;
pub const HELP_SETPOPUP_POS = 13;
pub const HELP_TCARD = 32768;
pub const HELP_TCARD_DATA = 16;
pub const HELP_TCARD_OTHER_CALLER = 17;
pub const IDH_NO_HELP = 28440;
pub const IDH_MISSING_CONTEXT = 28441;
pub const IDH_GENERIC_HELP_BUTTON = 28442;
pub const IDH_OK = 28443;
pub const IDH_CANCEL = 28444;
pub const IDH_HELP = 28445;
pub const MAX_TOUCH_PREDICTION_FILTER_TAPS = 3;
pub const TOUCHPREDICTIONPARAMETERS_DEFAULT_LATENCY = 8;
pub const TOUCHPREDICTIONPARAMETERS_DEFAULT_SAMPLETIME = 8;
pub const TOUCHPREDICTIONPARAMETERS_DEFAULT_USE_HW_TIMESTAMP = 1;
pub const MAX_LOGICALDPIOVERRIDE = 2;
pub const MIN_LOGICALDPIOVERRIDE = -2;
pub const FE_FONTSMOOTHINGSTANDARD = 1;
pub const FE_FONTSMOOTHINGCLEARTYPE = 2;
pub const FE_FONTSMOOTHINGORIENTATIONBGR = 0;
pub const FE_FONTSMOOTHINGORIENTATIONRGB = 1;
pub const CONTACTVISUALIZATION_OFF = 0;
pub const CONTACTVISUALIZATION_ON = 1;
pub const CONTACTVISUALIZATION_PRESENTATIONMODE = 2;
pub const GESTUREVISUALIZATION_OFF = 0;
pub const GESTUREVISUALIZATION_ON = 31;
pub const GESTUREVISUALIZATION_TAP = 1;
pub const GESTUREVISUALIZATION_DOUBLETAP = 2;
pub const GESTUREVISUALIZATION_PRESSANDTAP = 4;
pub const GESTUREVISUALIZATION_PRESSANDHOLD = 8;
pub const GESTUREVISUALIZATION_RIGHTTAP = 16;
pub const MOUSEWHEEL_ROUTING_FOCUS = 0;
pub const MOUSEWHEEL_ROUTING_HYBRID = 1;
pub const MOUSEWHEEL_ROUTING_MOUSE_POS = 2;
pub const PENVISUALIZATION_ON = 35;
pub const PENVISUALIZATION_OFF = 0;
pub const PENVISUALIZATION_TAP = 1;
pub const PENVISUALIZATION_DOUBLETAP = 2;
pub const PENVISUALIZATION_CURSOR = 32;
pub const PENARBITRATIONTYPE_NONE = 0;
pub const PENARBITRATIONTYPE_WIN8 = 1;
pub const PENARBITRATIONTYPE_FIS = 2;
pub const PENARBITRATIONTYPE_SPT = 3;
pub const PENARBITRATIONTYPE_MAX = 4;
pub const METRICS_USEDEFAULT = -1;
pub const ARW_STARTMASK = 3;
pub const ARW_STARTRIGHT = 1;
pub const ARW_STARTTOP = 2;
pub const ARW_LEFT = 0;
pub const ARW_RIGHT = 0;
pub const ARW_UP = 4;
pub const ARW_DOWN = 4;
pub const ARW_HIDE = 8;
pub const HCF_LOGONDESKTOP = 256;
pub const HCF_DEFAULTDESKTOP = 512;
pub const EDD_GET_DEVICE_INTERFACE_NAME = 1;
pub const FKF_FILTERKEYSON = 1;
pub const FKF_AVAILABLE = 2;
pub const FKF_HOTKEYACTIVE = 4;
pub const FKF_CONFIRMHOTKEY = 8;
pub const FKF_HOTKEYSOUND = 16;
pub const FKF_INDICATOR = 32;
pub const FKF_CLICKON = 64;
pub const MKF_MOUSEKEYSON = 1;
pub const MKF_AVAILABLE = 2;
pub const MKF_HOTKEYACTIVE = 4;
pub const MKF_CONFIRMHOTKEY = 8;
pub const MKF_HOTKEYSOUND = 16;
pub const MKF_INDICATOR = 32;
pub const MKF_MODIFIERS = 64;
pub const MKF_REPLACENUMBERS = 128;
pub const MKF_LEFTBUTTONSEL = 268435456;
pub const MKF_RIGHTBUTTONSEL = 536870912;
pub const MKF_LEFTBUTTONDOWN = 16777216;
pub const MKF_RIGHTBUTTONDOWN = 33554432;
pub const MKF_MOUSEMODE = 2147483648;
pub const TKF_TOGGLEKEYSON = 1;
pub const TKF_AVAILABLE = 2;
pub const TKF_HOTKEYACTIVE = 4;
pub const TKF_CONFIRMHOTKEY = 8;
pub const TKF_HOTKEYSOUND = 16;
pub const TKF_INDICATOR = 32;
pub const MONITORINFOF_PRIMARY = 1;
pub const WINEVENT_OUTOFCONTEXT = 0;
pub const WINEVENT_SKIPOWNTHREAD = 1;
pub const WINEVENT_SKIPOWNPROCESS = 2;
pub const WINEVENT_INCONTEXT = 4;
pub const CHILDID_SELF = 0;
pub const INDEXID_OBJECT = 0;
pub const INDEXID_CONTAINER = 0;
pub const EVENT_MIN = 1;
pub const EVENT_MAX = 2147483647;
pub const EVENT_SYSTEM_SOUND = 1;
pub const EVENT_SYSTEM_ALERT = 2;
pub const EVENT_SYSTEM_FOREGROUND = 3;
pub const EVENT_SYSTEM_MENUSTART = 4;
pub const EVENT_SYSTEM_MENUEND = 5;
pub const EVENT_SYSTEM_MENUPOPUPSTART = 6;
pub const EVENT_SYSTEM_MENUPOPUPEND = 7;
pub const EVENT_SYSTEM_CAPTURESTART = 8;
pub const EVENT_SYSTEM_CAPTUREEND = 9;
pub const EVENT_SYSTEM_MOVESIZESTART = 10;
pub const EVENT_SYSTEM_MOVESIZEEND = 11;
pub const EVENT_SYSTEM_CONTEXTHELPSTART = 12;
pub const EVENT_SYSTEM_CONTEXTHELPEND = 13;
pub const EVENT_SYSTEM_DRAGDROPSTART = 14;
pub const EVENT_SYSTEM_DRAGDROPEND = 15;
pub const EVENT_SYSTEM_DIALOGSTART = 16;
pub const EVENT_SYSTEM_DIALOGEND = 17;
pub const EVENT_SYSTEM_SCROLLINGSTART = 18;
pub const EVENT_SYSTEM_SCROLLINGEND = 19;
pub const EVENT_SYSTEM_SWITCHSTART = 20;
pub const EVENT_SYSTEM_SWITCHEND = 21;
pub const EVENT_SYSTEM_MINIMIZESTART = 22;
pub const EVENT_SYSTEM_MINIMIZEEND = 23;
pub const EVENT_SYSTEM_DESKTOPSWITCH = 32;
pub const EVENT_SYSTEM_SWITCHER_APPGRABBED = 36;
pub const EVENT_SYSTEM_SWITCHER_APPOVERTARGET = 37;
pub const EVENT_SYSTEM_SWITCHER_APPDROPPED = 38;
pub const EVENT_SYSTEM_SWITCHER_CANCELLED = 39;
pub const EVENT_SYSTEM_IME_KEY_NOTIFICATION = 41;
pub const EVENT_SYSTEM_END = 255;
pub const EVENT_OEM_DEFINED_START = 257;
pub const EVENT_OEM_DEFINED_END = 511;
pub const EVENT_UIA_EVENTID_START = 19968;
pub const EVENT_UIA_EVENTID_END = 20223;
pub const EVENT_UIA_PROPID_START = 29952;
pub const EVENT_UIA_PROPID_END = 30207;
pub const EVENT_CONSOLE_CARET = 16385;
pub const EVENT_CONSOLE_UPDATE_REGION = 16386;
pub const EVENT_CONSOLE_UPDATE_SIMPLE = 16387;
pub const EVENT_CONSOLE_UPDATE_SCROLL = 16388;
pub const EVENT_CONSOLE_LAYOUT = 16389;
pub const EVENT_CONSOLE_START_APPLICATION = 16390;
pub const EVENT_CONSOLE_END_APPLICATION = 16391;
pub const CONSOLE_APPLICATION_16BIT = 0;
pub const CONSOLE_CARET_SELECTION = 1;
pub const CONSOLE_CARET_VISIBLE = 2;
pub const EVENT_CONSOLE_END = 16639;
pub const EVENT_OBJECT_CREATE = 32768;
pub const EVENT_OBJECT_DESTROY = 32769;
pub const EVENT_OBJECT_SHOW = 32770;
pub const EVENT_OBJECT_HIDE = 32771;
pub const EVENT_OBJECT_REORDER = 32772;
pub const EVENT_OBJECT_FOCUS = 32773;
pub const EVENT_OBJECT_SELECTION = 32774;
pub const EVENT_OBJECT_SELECTIONADD = 32775;
pub const EVENT_OBJECT_SELECTIONREMOVE = 32776;
pub const EVENT_OBJECT_SELECTIONWITHIN = 32777;
pub const EVENT_OBJECT_STATECHANGE = 32778;
pub const EVENT_OBJECT_LOCATIONCHANGE = 32779;
pub const EVENT_OBJECT_NAMECHANGE = 32780;
pub const EVENT_OBJECT_DESCRIPTIONCHANGE = 32781;
pub const EVENT_OBJECT_VALUECHANGE = 32782;
pub const EVENT_OBJECT_PARENTCHANGE = 32783;
pub const EVENT_OBJECT_HELPCHANGE = 32784;
pub const EVENT_OBJECT_DEFACTIONCHANGE = 32785;
pub const EVENT_OBJECT_ACCELERATORCHANGE = 32786;
pub const EVENT_OBJECT_INVOKED = 32787;
pub const EVENT_OBJECT_TEXTSELECTIONCHANGED = 32788;
pub const EVENT_OBJECT_CONTENTSCROLLED = 32789;
pub const EVENT_SYSTEM_ARRANGMENTPREVIEW = 32790;
pub const EVENT_OBJECT_CLOAKED = 32791;
pub const EVENT_OBJECT_UNCLOAKED = 32792;
pub const EVENT_OBJECT_LIVEREGIONCHANGED = 32793;
pub const EVENT_OBJECT_HOSTEDOBJECTSINVALIDATED = 32800;
pub const EVENT_OBJECT_DRAGSTART = 32801;
pub const EVENT_OBJECT_DRAGCANCEL = 32802;
pub const EVENT_OBJECT_DRAGCOMPLETE = 32803;
pub const EVENT_OBJECT_DRAGENTER = 32804;
pub const EVENT_OBJECT_DRAGLEAVE = 32805;
pub const EVENT_OBJECT_DRAGDROPPED = 32806;
pub const EVENT_OBJECT_IME_SHOW = 32807;
pub const EVENT_OBJECT_IME_HIDE = 32808;
pub const EVENT_OBJECT_IME_CHANGE = 32809;
pub const EVENT_OBJECT_TEXTEDIT_CONVERSIONTARGETCHANGED = 32816;
pub const EVENT_OBJECT_END = 33023;
pub const EVENT_AIA_START = 40960;
pub const EVENT_AIA_END = 45055;
pub const SOUND_SYSTEM_STARTUP = 1;
pub const SOUND_SYSTEM_SHUTDOWN = 2;
pub const SOUND_SYSTEM_BEEP = 3;
pub const SOUND_SYSTEM_ERROR = 4;
pub const SOUND_SYSTEM_QUESTION = 5;
pub const SOUND_SYSTEM_WARNING = 6;
pub const SOUND_SYSTEM_INFORMATION = 7;
pub const SOUND_SYSTEM_MAXIMIZE = 8;
pub const SOUND_SYSTEM_MINIMIZE = 9;
pub const SOUND_SYSTEM_RESTOREUP = 10;
pub const SOUND_SYSTEM_RESTOREDOWN = 11;
pub const SOUND_SYSTEM_APPSTART = 12;
pub const SOUND_SYSTEM_FAULT = 13;
pub const SOUND_SYSTEM_APPEND = 14;
pub const SOUND_SYSTEM_MENUCOMMAND = 15;
pub const SOUND_SYSTEM_MENUPOPUP = 16;
pub const CSOUND_SYSTEM = 16;
pub const CALERT_SYSTEM = 6;
pub const GUI_16BITTASK = 0;
pub const USER_DEFAULT_SCREEN_DPI = 96;
pub const STATE_SYSTEM_SELECTED = 2;
pub const STATE_SYSTEM_FOCUSED = 4;
pub const STATE_SYSTEM_CHECKED = 16;
pub const STATE_SYSTEM_MIXED = 32;
pub const STATE_SYSTEM_INDETERMINATE = 32;
pub const STATE_SYSTEM_READONLY = 64;
pub const STATE_SYSTEM_HOTTRACKED = 128;
pub const STATE_SYSTEM_DEFAULT = 256;
pub const STATE_SYSTEM_EXPANDED = 512;
pub const STATE_SYSTEM_COLLAPSED = 1024;
pub const STATE_SYSTEM_BUSY = 2048;
pub const STATE_SYSTEM_FLOATING = 4096;
pub const STATE_SYSTEM_MARQUEED = 8192;
pub const STATE_SYSTEM_ANIMATED = 16384;
pub const STATE_SYSTEM_SIZEABLE = 131072;
pub const STATE_SYSTEM_MOVEABLE = 262144;
pub const STATE_SYSTEM_SELFVOICING = 524288;
pub const STATE_SYSTEM_SELECTABLE = 2097152;
pub const STATE_SYSTEM_LINKED = 4194304;
pub const STATE_SYSTEM_TRAVERSED = 8388608;
pub const STATE_SYSTEM_MULTISELECTABLE = 16777216;
pub const STATE_SYSTEM_EXTSELECTABLE = 33554432;
pub const STATE_SYSTEM_ALERT_LOW = 67108864;
pub const STATE_SYSTEM_ALERT_MEDIUM = 134217728;
pub const STATE_SYSTEM_ALERT_HIGH = 268435456;
pub const STATE_SYSTEM_PROTECTED = 536870912;
pub const STATE_SYSTEM_VALID = 1073741823;
pub const CCHILDREN_TITLEBAR = 5;
pub const CCHILDREN_SCROLLBAR = 5;
pub const CURSOR_INVISIBLE = 0;
pub const RIM_INPUT = 0;
pub const RIM_INPUTSINK = 1;
pub const RIM_TYPEMAX = 2;
pub const RI_MOUSE_LEFT_BUTTON_DOWN = 1;
pub const RI_MOUSE_LEFT_BUTTON_UP = 2;
pub const RI_MOUSE_RIGHT_BUTTON_DOWN = 4;
pub const RI_MOUSE_RIGHT_BUTTON_UP = 8;
pub const RI_MOUSE_MIDDLE_BUTTON_DOWN = 16;
pub const RI_MOUSE_MIDDLE_BUTTON_UP = 32;
pub const RI_MOUSE_BUTTON_1_DOWN = 1;
pub const RI_MOUSE_BUTTON_1_UP = 2;
pub const RI_MOUSE_BUTTON_2_DOWN = 4;
pub const RI_MOUSE_BUTTON_2_UP = 8;
pub const RI_MOUSE_BUTTON_3_DOWN = 16;
pub const RI_MOUSE_BUTTON_3_UP = 32;
pub const RI_MOUSE_BUTTON_4_DOWN = 64;
pub const RI_MOUSE_BUTTON_4_UP = 128;
pub const RI_MOUSE_BUTTON_5_DOWN = 256;
pub const RI_MOUSE_BUTTON_5_UP = 512;
pub const RI_MOUSE_WHEEL = 1024;
pub const RI_MOUSE_HWHEEL = 2048;
pub const RI_KEY_MAKE = 0;
pub const RI_KEY_BREAK = 1;
pub const RI_KEY_E0 = 2;
pub const RI_KEY_E1 = 4;
pub const RI_KEY_TERMSRV_SET_LED = 8;
pub const RI_KEY_TERMSRV_SHADOW = 16;
pub const RIDEV_EXMODEMASK = 240;
pub const GIDC_ARRIVAL = 1;
pub const GIDC_REMOVAL = 2;
pub const POINTER_DEVICE_PRODUCT_STRING_MAX = 520;
pub const PDC_ARRIVAL = 1;
pub const PDC_REMOVAL = 2;
pub const PDC_ORIENTATION_0 = 4;
pub const PDC_ORIENTATION_90 = 8;
pub const PDC_ORIENTATION_180 = 16;
pub const PDC_ORIENTATION_270 = 32;
pub const PDC_MODE_DEFAULT = 64;
pub const PDC_MODE_CENTERED = 128;
pub const PDC_MAPPING_CHANGE = 256;
pub const PDC_RESOLUTION = 512;
pub const PDC_ORIGIN = 1024;
pub const PDC_MODE_ASPECTRATIOPRESERVED = 2048;
pub const TOUCHPAD_PARAMETERS_VERSION_1 = 1;
pub const TOUCHPAD_PARAMETERS_VERSION_2 = 2;
pub const GF_BEGIN = 1;
pub const GF_INERTIA = 2;
pub const GF_END = 4;
pub const GESTURECONFIGMAXCOUNT = 256;
pub const GCF_INCLUDE_ANCESTORS = 1;
pub const NID_INTEGRATED_TOUCH = 1;
pub const NID_EXTERNAL_TOUCH = 2;
pub const NID_INTEGRATED_PEN = 4;
pub const NID_EXTERNAL_PEN = 8;
pub const NID_MULTI_INPUT = 64;
pub const NID_READY = 128;
pub const MAX_STR_BLOCKREASON = 256;
pub const WM_INTERCEPTED_WINDOW_ACTION = 838;
pub const WM_TOOLTIPDISMISS = 837;
pub const INVALID_MONITOR_TOPOLOGY_ID = 0;
pub const WM_CLOAKED_STATE_CHANGED = 839;
pub const HBMMENU_CALLBACK = -1;
pub const HBMMENU_SYSTEM = 1;
pub const HBMMENU_MBAR_RESTORE = 2;
pub const HBMMENU_MBAR_MINIMIZE = 3;
pub const HBMMENU_MBAR_CLOSE = 5;
pub const HBMMENU_MBAR_CLOSE_D = 6;
pub const HBMMENU_MBAR_MINIMIZE_D = 7;
pub const HBMMENU_POPUP_CLOSE = 8;
pub const HBMMENU_POPUP_RESTORE = 9;
pub const HBMMENU_POPUP_MAXIMIZE = 10;
pub const HBMMENU_POPUP_MINIMIZE = 11;
pub const CW_USEDEFAULT = -2147483648;
pub const LBS_STANDARD = 10485763;
pub const WINSTA_ALL_ACCESS = 895;
pub const WVR_REDRAW = 768;
pub const RT_GROUP_CURSOR = 12;
pub const RT_GROUP_ICON = 14;
pub const RT_MANIFEST = 24;
pub const IDC_STATIC = -1;
pub const DI_MASK = 1;
pub const DI_IMAGE = 2;
pub const DI_NORMAL = 3;
pub const DI_COMPAT = 4;
pub const DI_DEFAULTSIZE = 8;
pub const DI_NOMIRROR = 16;
pub const PT_POINTER = 1;
pub const PT_TOUCH = 2;
pub const PT_PEN = 3;
pub const PT_MOUSE = 4;
pub const PT_TOUCHPAD = 5;
pub const EDIT_CONTROL_FEATURE_ENTERPRISE_DATA_PROTECTION_PASTE_SUPPORT = 0;
pub const EDIT_CONTROL_FEATURE_PASTE_NOTIFICATIONS = 1;
pub const HANDEDNESS_LEFT = 0;
pub const HANDEDNESS_RIGHT = 1;
pub const LEGACY_TOUCHPAD_FEATURE_NONE = 0;
pub const LEGACY_TOUCHPAD_FEATURE_ENABLE_DISABLE = 1;
pub const LEGACY_TOUCHPAD_FEATURE_REVERSE_SCROLL_DIRECTION = 4;
pub const TOUCHPAD_SENSITIVITY_LEVEL_MOST_SENSITIVE = 0;
pub const TOUCHPAD_SENSITIVITY_LEVEL_HIGH_SENSITIVITY = 1;
pub const TOUCHPAD_SENSITIVITY_LEVEL_MEDIUM_SENSITIVITY = 2;
pub const TOUCHPAD_SENSITIVITY_LEVEL_LOW_SENSITIVITY = 3;
pub const TOUCHPAD_SENSITIVITY_LEVEL_LEAST_SENSITIVE = 4;
pub const WPS_NORMAL = 0;
pub const WPS_MAXIMIZED = 1;
pub const WPS_MINIMIZED = 2;
pub const WPS_ARRANGED = 3;
pub const WAK_NONE = 0;
pub const WAK_VISIBILITY = 1;
pub const WAK_POSITION = 2;
pub const WAK_SIZE = 4;
pub const WAK_INSERT_AFTER = 8;
pub const WAK_ACTIVATE = 16;
pub const WAK_PLACEMENT_STATE = 32;
pub const WAK_NORMAL_RECT = 64;
pub const WAK_MOVE_TO_MONITOR = 128;
pub const WAK_FIT_TO_MONITOR = 256;
pub const WAK_DISPLAY_CHANGE = 512;
pub const WAK_SYSTEM_OPERATION = 1024;
pub const WAK_COALESCEABLE = 31;
pub const WAM_NONE = 0;
pub const WAM_FRAME_BOUNDS = 1;
pub const WAM_ACTIVATE_FOREGROUND = 2;
pub const WAM_ACTIVATE_INPUT = 4;
pub const WAM_ACTIVATE_NO_ZORDER = 8;
pub const WAM_INSERT_AFTER_NO_OWNER = 16;
pub const WAM_RESTORE_TO_NORMAL = 32;
pub const WAM_RESTORE_TO_MAXIMIZED = 64;
pub const WAM_RESTORE_TO_ARRANGED = 128;
pub const WAM_WORK_AREA = 256;
pub const WAM_DPI = 512;
pub const WAM_SCALED_TO_MONITOR = 1024;
pub const TDF_REGISTER = 1;
pub const TDF_UNREGISTER = 2;
pub const MSO_SIZE_LEFT = 1;
pub const MSO_SIZE_RIGHT = 2;
pub const MSO_SIZE_TOP = 3;
pub const MSO_SIZE_TOPLEFT = 4;
pub const MSO_SIZE_TOPRIGHT = 5;
pub const MSO_SIZE_BOTTOM = 6;
pub const MSO_SIZE_BOTTOMLEFT = 7;
pub const MSO_SIZE_BOTTOMRIGHT = 8;
pub const MSO_MOVE = 9;
pub const MrmPlatformVersion_Default = 0;
pub const MrmPlatformVersion_Windows10_0_0_0 = 17432576;
pub const MrmPlatformVersion_Windows10_0_0_5 = 17432581;
pub const MrmPackagingModeStandaloneFile = 0;
pub const MrmPackagingModeAutoSplit = 1;
pub const MrmPackagingModeResourcePack = 2;
pub const MrmPackagingOptionsNone = 0;
pub const MrmPackagingOptionsOmitSchemaFromResourcePacks = 1;
pub const MrmPackagingOptionsSplitLanguageVariants = 2;
pub const MrmDumpType_Basic = 0;
pub const MrmDumpType_Detailed = 1;
pub const MrmDumpType_Schema = 2;
pub const MrmResourceIndexerMessageSeverityVerbose = 0;
pub const MrmResourceIndexerMessageSeverityInfo = 1;
pub const MrmResourceIndexerMessageSeverityWarning = 2;
pub const MrmResourceIndexerMessageSeverityError = 3;
pub const MrmIndexerFlagsNone = 0;
pub const MrmIndexerFlagsAutoMerge = 1;
pub const MrmIndexerFlagsCreateContentChecksum = 2;

pub const aliases = struct {
    pub const WNDCLASS_STYLES = u32;
    pub const CWP_FLAGS = u32;
    pub const MESSAGEBOX_STYLE = u32;
    pub const MENU_ITEM_FLAGS = u32;
    pub const SHOW_WINDOW_CMD = i32;
    pub const SHOW_WINDOW_STATUS = u32;
    pub const SCROLL_WINDOW_FLAGS = u32;
    pub const SYSTEM_PARAMETERS_INFO_ACTION = u32;
    pub const TRACK_POPUP_MENU_FLAGS = u32;
    pub const WINDOW_EX_STYLE = u32;
    pub const WINDOW_STYLE = u32;
    pub const OBJECT_IDENTIFIER = i32;
    pub const MENU_ITEM_TYPE = u32;
    pub const MESSAGEBOX_RESULT = i32;
    pub const MENU_ITEM_STATE = u32;
    pub const SCROLLBAR_CONSTANTS = i32;
    pub const GET_CLASS_LONG_INDEX = i32;
    pub const UPDATE_LAYERED_WINDOW_FLAGS = u32;
    pub const WINDOW_LONG_PTR_INDEX = i32;
    pub const ANIMATE_WINDOW_FLAGS = u32;
    pub const CHANGE_WINDOW_MESSAGE_FILTER_FLAGS = u32;
    pub const GDI_IMAGE_TYPE = u32;
    pub const WINDOWS_HOOK_ID = i32;
    pub const IMAGE_FLAGS = u32;
    pub const SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS = u32;
    pub const SET_WINDOW_POS_FLAGS = u32;
    pub const MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS = u32;
    pub const QUEUE_STATUS_FLAGS = u32;
    pub const REGISTER_NOTIFICATION_FLAGS = u32;
    pub const SYSTEM_CURSOR_ID = u32;
    pub const LAYERED_WINDOW_ATTRIBUTES_FLAGS = u32;
    pub const SEND_MESSAGE_TIMEOUT_FLAGS = u32;
    pub const PEEK_MESSAGE_REMOVE_TYPE = u32;
    pub const GET_WINDOW_CMD = u32;
    pub const SYSTEM_METRICS_INDEX = i32;
    pub const GET_ANCESTOR_FLAGS = u32;
    pub const TILE_WINDOWS_HOW = u32;
    pub const WINDOW_DISPLAY_AFFINITY = u32;
    pub const FOREGROUND_WINDOW_LOCK_CODE = u32;
    pub const CASCADE_WINDOWS_HOW = u32;
    pub const WINDOW_MESSAGE_FILTER_ACTION = u32;
    pub const GET_MENU_DEFAULT_ITEM_FLAGS = u32;
    pub const MSGFLTINFO_STATUS = u32;
    pub const MENU_ITEM_MASK = u32;
    pub const FLASHWINFO_FLAGS = u32;
    pub const CURSORINFO_FLAGS = u32;
    pub const MENUINFO_STYLE = u32;
    pub const WINDOWPLACEMENT_FLAGS = u32;
    pub const MENUINFO_MASK = u32;
    pub const DEV_BROADCAST_HDR_DEVICE_TYPE = u32;
    pub const MINIMIZEDMETRICS_ARRANGE = i32;
    pub const DEV_BROADCAST_VOLUME_FLAGS = u16;
    pub const SCROLLINFO_MASK = u32;
    pub const MENUGETOBJECTINFO_FLAGS = u32;
    pub const GUITHREADINFO_FLAGS = u32;
    pub const KBDLLHOOKSTRUCT_FLAGS = u32;
    pub const ACCEL_VIRT_FLAGS = u8;
    pub const SCROLLBAR_COMMAND = i32;
    pub const DI_FLAGS = u32;
    pub const POINTER_INPUT_TYPE = i32;
    pub const EDIT_CONTROL_FEATURE = i32;
    pub const HANDEDNESS = i32;
    pub const LEGACY_TOUCHPAD_FEATURES = i32;
    pub const TOUCHPAD_SENSITIVITY_LEVEL = i32;
    pub const WINDOW_PLACEMENT_STATE = i32;
    pub const WINDOW_ACTION_KINDS = i32;
    pub const WINDOW_ACTION_MODIFIERS = i32;
    pub const TOOLTIP_DISMISS_FLAGS = i32;
    pub const MOVESIZE_OPERATION = i32;
    pub const MrmPlatformVersion = i32;
    pub const MrmPackagingMode = i32;
    pub const MrmPackagingOptions = i32;
    pub const MrmDumpType = i32;
    pub const MrmResourceIndexerMessageSeverity = i32;
    pub const MrmIndexerFlags = i32;
    pub const HHOOK = ?*anyopaque;
    pub const HICON = ?*anyopaque;
    pub const HMENU = ?*anyopaque;
    pub const HCURSOR = ?*anyopaque;
    pub const HACCEL = ?*anyopaque;
    pub const HDEVNOTIFY = ?*anyopaque;
    pub const HDWP = ?*anyopaque;
};
