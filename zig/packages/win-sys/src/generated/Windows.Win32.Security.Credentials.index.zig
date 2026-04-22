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
    .{ "KeyCredentialManagerGetOperationErrorStates", MethodRecord{ .library = "KeyCredMgr", .import = "KeyCredentialManagerGetOperationErrorStates", .signature = "\x00\x03\x11\x79\x11\x9d\x41\x0f\x11\x59\x0f\x11\x9d\x45" } },
    .{ "KeyCredentialManagerShowUIOperation", MethodRecord{ .library = "KeyCredMgr", .import = "KeyCredentialManagerShowUIOperation", .signature = "\x00\x02\x11\x79\x11\x25\x11\x9d\x41" } },
    .{ "KeyCredentialManagerGetInformation", MethodRecord{ .library = "KeyCredMgr", .import = "KeyCredentialManagerGetInformation", .signature = "\x00\x01\x11\x79\x0f\x0f\x11\x9d\x49" } },
    .{ "KeyCredentialManagerFreeInformation", MethodRecord{ .library = "KeyCredMgr", .import = "KeyCredentialManagerFreeInformation", .signature = "\x00\x01\x01\x0f\x11\x9d\x49" } },
    .{ "CredWriteW", MethodRecord{ .library = "ADVAPI32", .import = "CredWriteW", .signature = "\x00\x02\x11\x59\x0f\x11\x9d\x4d\x09" } },
    .{ "CredWriteA", MethodRecord{ .library = "ADVAPI32", .import = "CredWriteA", .signature = "\x00\x02\x11\x59\x0f\x11\x9d\x51\x09" } },
    .{ "CredReadW", MethodRecord{ .library = "ADVAPI32", .import = "CredReadW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x9b\x8d\x09\x0f\x0f\x11\x9d\x4d" } },
    .{ "CredReadA", MethodRecord{ .library = "ADVAPI32", .import = "CredReadA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x9b\x8d\x09\x0f\x0f\x11\x9d\x51" } },
    .{ "CredEnumerateW", MethodRecord{ .library = "ADVAPI32", .import = "CredEnumerateW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x9b\x9d\x0f\x09\x0f\x0f\x0f\x11\x9d\x4d" } },
    .{ "CredEnumerateA", MethodRecord{ .library = "ADVAPI32", .import = "CredEnumerateA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x9b\x9d\x0f\x09\x0f\x0f\x0f\x11\x9d\x51" } },
    .{ "CredWriteDomainCredentialsW", MethodRecord{ .library = "ADVAPI32", .import = "CredWriteDomainCredentialsW", .signature = "\x00\x03\x11\x59\x0f\x11\x94\x09\x0f\x11\x9d\x4d\x09" } },
    .{ "CredWriteDomainCredentialsA", MethodRecord{ .library = "ADVAPI32", .import = "CredWriteDomainCredentialsA", .signature = "\x00\x03\x11\x59\x0f\x11\x9d\x55\x0f\x11\x9d\x51\x09" } },
    .{ "CredReadDomainCredentialsW", MethodRecord{ .library = "ADVAPI32", .import = "CredReadDomainCredentialsW", .signature = "\x00\x04\x11\x59\x0f\x11\x94\x09\x09\x0f\x09\x0f\x0f\x0f\x11\x9d\x4d" } },
    .{ "CredReadDomainCredentialsA", MethodRecord{ .library = "ADVAPI32", .import = "CredReadDomainCredentialsA", .signature = "\x00\x04\x11\x59\x0f\x11\x9d\x55\x09\x0f\x09\x0f\x0f\x0f\x11\x9d\x51" } },
    .{ "CredDeleteW", MethodRecord{ .library = "ADVAPI32", .import = "CredDeleteW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x9b\x8d\x09" } },
    .{ "CredDeleteA", MethodRecord{ .library = "ADVAPI32", .import = "CredDeleteA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x9b\x8d\x09" } },
    .{ "CredRenameW", MethodRecord{ .library = "ADVAPI32", .import = "CredRenameW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x9b\x8d\x09" } },
    .{ "CredRenameA", MethodRecord{ .library = "ADVAPI32", .import = "CredRenameA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x9b\x8d\x09" } },
    .{ "CredGetTargetInfoW", MethodRecord{ .library = "ADVAPI32", .import = "CredGetTargetInfoW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x0f\x11\x94\x09" } },
    .{ "CredGetTargetInfoA", MethodRecord{ .library = "ADVAPI32", .import = "CredGetTargetInfoA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x0f\x0f\x11\x9d\x55" } },
    .{ "CredMarshalCredentialW", MethodRecord{ .library = "ADVAPI32", .import = "CredMarshalCredentialW", .signature = "\x00\x03\x11\x59\x11\x9d\x59\x0f\x01\x0f\x11\x05" } },
    .{ "CredMarshalCredentialA", MethodRecord{ .library = "ADVAPI32", .import = "CredMarshalCredentialA", .signature = "\x00\x03\x11\x59\x11\x9d\x59\x0f\x01\x0f\x11\x3d" } },
    .{ "CredUnmarshalCredentialW", MethodRecord{ .library = "ADVAPI32", .import = "CredUnmarshalCredentialW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\x9d\x59\x0f\x0f\x01" } },
    .{ "CredUnmarshalCredentialA", MethodRecord{ .library = "ADVAPI32", .import = "CredUnmarshalCredentialA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\x9d\x59\x0f\x0f\x01" } },
    .{ "CredIsMarshaledCredentialW", MethodRecord{ .library = "ADVAPI32", .import = "CredIsMarshaledCredentialW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "CredIsMarshaledCredentialA", MethodRecord{ .library = "ADVAPI32", .import = "CredIsMarshaledCredentialA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "CredUnPackAuthenticationBufferW", MethodRecord{ .library = "credui", .import = "CredUnPackAuthenticationBufferW", .signature = "\x00\x09\x11\x59\x11\x9b\xa9\x0f\x01\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "CredUnPackAuthenticationBufferA", MethodRecord{ .library = "credui", .import = "CredUnPackAuthenticationBufferA", .signature = "\x00\x09\x11\x59\x11\x9b\xa9\x0f\x01\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "CredPackAuthenticationBufferW", MethodRecord{ .library = "credui", .import = "CredPackAuthenticationBufferW", .signature = "\x00\x05\x11\x59\x11\x9b\xa9\x11\x05\x11\x05\x0f\x05\x0f\x09" } },
    .{ "CredPackAuthenticationBufferA", MethodRecord{ .library = "credui", .import = "CredPackAuthenticationBufferA", .signature = "\x00\x05\x11\x59\x11\x9b\xa9\x11\x3d\x11\x3d\x0f\x05\x0f\x09" } },
    .{ "CredProtectW", MethodRecord{ .library = "ADVAPI32", .import = "CredProtectW", .signature = "\x00\x06\x11\x59\x11\x59\x11\x05\x09\x11\x05\x0f\x09\x0f\x11\x9d\x5d" } },
    .{ "CredProtectA", MethodRecord{ .library = "ADVAPI32", .import = "CredProtectA", .signature = "\x00\x06\x11\x59\x11\x59\x11\x3d\x09\x11\x3d\x0f\x09\x0f\x11\x9d\x5d" } },
    .{ "CredUnprotectW", MethodRecord{ .library = "ADVAPI32", .import = "CredUnprotectW", .signature = "\x00\x05\x11\x59\x11\x59\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "CredUnprotectA", MethodRecord{ .library = "ADVAPI32", .import = "CredUnprotectA", .signature = "\x00\x05\x11\x59\x11\x59\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "CredIsProtectedW", MethodRecord{ .library = "ADVAPI32", .import = "CredIsProtectedW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x9d\x5d" } },
    .{ "CredIsProtectedA", MethodRecord{ .library = "ADVAPI32", .import = "CredIsProtectedA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\x9d\x5d" } },
    .{ "CredFindBestCredentialW", MethodRecord{ .library = "ADVAPI32", .import = "CredFindBestCredentialW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x09\x0f\x0f\x11\x9d\x4d" } },
    .{ "CredFindBestCredentialA", MethodRecord{ .library = "ADVAPI32", .import = "CredFindBestCredentialA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x09\x0f\x0f\x11\x9d\x51" } },
    .{ "CredGetSessionTypes", MethodRecord{ .library = "ADVAPI32", .import = "CredGetSessionTypes", .signature = "\x00\x02\x11\x59\x09\x0f\x09" } },
    .{ "CredFree", MethodRecord{ .library = "ADVAPI32", .import = "CredFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "CredUIPromptForCredentialsW", MethodRecord{ .library = "credui", .import = "CredUIPromptForCredentialsW", .signature = "\x00\x0a\x11\x81\x01\x0f\x11\x9d\x61\x11\x05\x0f\x11\x93\xd5\x09\x11\x05\x09\x11\x05\x09\x0f\x11\x59\x11\x9b\x95" } },
    .{ "CredUIPromptForCredentialsA", MethodRecord{ .library = "credui", .import = "CredUIPromptForCredentialsA", .signature = "\x00\x0a\x11\x81\x01\x0f\x11\x9d\x65\x11\x3d\x0f\x11\x93\xd5\x09\x11\x3d\x09\x11\x3d\x09\x0f\x11\x59\x11\x9b\x95" } },
    .{ "CredUIPromptForWindowsCredentialsW", MethodRecord{ .library = "credui", .import = "CredUIPromptForWindowsCredentialsW", .signature = "\x00\x09\x09\x0f\x11\x9d\x61\x09\x0f\x09\x0f\x01\x09\x0f\x0f\x01\x0f\x09\x0f\x11\x59\x11\x9b\xa1" } },
    .{ "CredUIPromptForWindowsCredentialsA", MethodRecord{ .library = "credui", .import = "CredUIPromptForWindowsCredentialsA", .signature = "\x00\x09\x09\x0f\x11\x9d\x65\x09\x0f\x09\x0f\x01\x09\x0f\x0f\x01\x0f\x09\x0f\x11\x59\x11\x9b\xa1" } },
    .{ "CredUIParseUserNameW", MethodRecord{ .library = "credui", .import = "CredUIParseUserNameW", .signature = "\x00\x05\x11\x81\x01\x11\x05\x11\x05\x09\x11\x05\x09" } },
    .{ "CredUIParseUserNameA", MethodRecord{ .library = "credui", .import = "CredUIParseUserNameA", .signature = "\x00\x05\x11\x81\x01\x11\x3d\x11\x3d\x09\x11\x3d\x09" } },
    .{ "CredUICmdLinePromptForCredentialsW", MethodRecord{ .library = "credui", .import = "CredUICmdLinePromptForCredentialsW", .signature = "\x00\x09\x09\x11\x05\x0f\x11\x93\xd5\x09\x11\x05\x09\x11\x05\x09\x0f\x11\x59\x11\x9b\x95" } },
    .{ "CredUICmdLinePromptForCredentialsA", MethodRecord{ .library = "credui", .import = "CredUICmdLinePromptForCredentialsA", .signature = "\x00\x09\x09\x11\x3d\x0f\x11\x93\xd5\x09\x11\x3d\x09\x11\x3d\x09\x0f\x11\x59\x11\x9b\x95" } },
    .{ "CredUIConfirmCredentialsW", MethodRecord{ .library = "credui", .import = "CredUIConfirmCredentialsW", .signature = "\x00\x02\x09\x11\x05\x11\x59" } },
    .{ "CredUIConfirmCredentialsA", MethodRecord{ .library = "credui", .import = "CredUIConfirmCredentialsA", .signature = "\x00\x02\x09\x11\x3d\x11\x59" } },
    .{ "CredUIStoreSSOCredW", MethodRecord{ .library = "credui", .import = "CredUIStoreSSOCredW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x11\x59" } },
    .{ "CredUIReadSSOCredW", MethodRecord{ .library = "credui", .import = "CredUIReadSSOCredW", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x05" } },
    .{ "SCardEstablishContext", MethodRecord{ .library = "WinSCard", .import = "SCardEstablishContext", .signature = "\x00\x04\x08\x11\x9b\x99\x0f\x01\x0f\x01\x0f\x19" } },
    .{ "SCardReleaseContext", MethodRecord{ .library = "WinSCard", .import = "SCardReleaseContext", .signature = "\x00\x01\x08\x19" } },
    .{ "SCardIsValidContext", MethodRecord{ .library = "WinSCard", .import = "SCardIsValidContext", .signature = "\x00\x01\x08\x19" } },
    .{ "SCardListReaderGroupsA", MethodRecord{ .library = "WinSCard", .import = "SCardListReaderGroupsA", .signature = "\x00\x03\x08\x19\x11\x3d\x0f\x09" } },
    .{ "SCardListReaderGroupsW", MethodRecord{ .library = "WinSCard", .import = "SCardListReaderGroupsW", .signature = "\x00\x03\x08\x19\x11\x05\x0f\x09" } },
    .{ "SCardListReadersA", MethodRecord{ .library = "WinSCard", .import = "SCardListReadersA", .signature = "\x00\x04\x08\x19\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "SCardListReadersW", MethodRecord{ .library = "WinSCard", .import = "SCardListReadersW", .signature = "\x00\x04\x08\x19\x11\x05\x11\x05\x0f\x09" } },
    .{ "SCardListCardsA", MethodRecord{ .library = "WinSCard", .import = "SCardListCardsA", .signature = "\x00\x06\x08\x19\x0f\x05\x0f\x11\x0d\x09\x11\x3d\x0f\x09" } },
    .{ "SCardListCardsW", MethodRecord{ .library = "WinSCard", .import = "SCardListCardsW", .signature = "\x00\x06\x08\x19\x0f\x05\x0f\x11\x0d\x09\x11\x05\x0f\x09" } },
    .{ "SCardListInterfacesA", MethodRecord{ .library = "WinSCard", .import = "SCardListInterfacesA", .signature = "\x00\x04\x08\x19\x11\x3d\x0f\x11\x0d\x0f\x09" } },
    .{ "SCardListInterfacesW", MethodRecord{ .library = "WinSCard", .import = "SCardListInterfacesW", .signature = "\x00\x04\x08\x19\x11\x05\x0f\x11\x0d\x0f\x09" } },
    .{ "SCardGetProviderIdA", MethodRecord{ .library = "WinSCard", .import = "SCardGetProviderIdA", .signature = "\x00\x03\x08\x19\x11\x3d\x0f\x11\x0d" } },
    .{ "SCardGetProviderIdW", MethodRecord{ .library = "WinSCard", .import = "SCardGetProviderIdW", .signature = "\x00\x03\x08\x19\x11\x05\x0f\x11\x0d" } },
    .{ "SCardGetCardTypeProviderNameA", MethodRecord{ .library = "WinSCard", .import = "SCardGetCardTypeProviderNameA", .signature = "\x00\x05\x08\x19\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "SCardGetCardTypeProviderNameW", MethodRecord{ .library = "WinSCard", .import = "SCardGetCardTypeProviderNameW", .signature = "\x00\x05\x08\x19\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "SCardIntroduceReaderGroupA", MethodRecord{ .library = "WinSCard", .import = "SCardIntroduceReaderGroupA", .signature = "\x00\x02\x08\x19\x11\x3d" } },
    .{ "SCardIntroduceReaderGroupW", MethodRecord{ .library = "WinSCard", .import = "SCardIntroduceReaderGroupW", .signature = "\x00\x02\x08\x19\x11\x05" } },
    .{ "SCardForgetReaderGroupA", MethodRecord{ .library = "WinSCard", .import = "SCardForgetReaderGroupA", .signature = "\x00\x02\x08\x19\x11\x3d" } },
    .{ "SCardForgetReaderGroupW", MethodRecord{ .library = "WinSCard", .import = "SCardForgetReaderGroupW", .signature = "\x00\x02\x08\x19\x11\x05" } },
    .{ "SCardIntroduceReaderA", MethodRecord{ .library = "WinSCard", .import = "SCardIntroduceReaderA", .signature = "\x00\x03\x08\x19\x11\x3d\x11\x3d" } },
    .{ "SCardIntroduceReaderW", MethodRecord{ .library = "WinSCard", .import = "SCardIntroduceReaderW", .signature = "\x00\x03\x08\x19\x11\x05\x11\x05" } },
    .{ "SCardForgetReaderA", MethodRecord{ .library = "WinSCard", .import = "SCardForgetReaderA", .signature = "\x00\x02\x08\x19\x11\x3d" } },
    .{ "SCardForgetReaderW", MethodRecord{ .library = "WinSCard", .import = "SCardForgetReaderW", .signature = "\x00\x02\x08\x19\x11\x05" } },
    .{ "SCardAddReaderToGroupA", MethodRecord{ .library = "WinSCard", .import = "SCardAddReaderToGroupA", .signature = "\x00\x03\x08\x19\x11\x3d\x11\x3d" } },
    .{ "SCardAddReaderToGroupW", MethodRecord{ .library = "WinSCard", .import = "SCardAddReaderToGroupW", .signature = "\x00\x03\x08\x19\x11\x05\x11\x05" } },
    .{ "SCardRemoveReaderFromGroupA", MethodRecord{ .library = "WinSCard", .import = "SCardRemoveReaderFromGroupA", .signature = "\x00\x03\x08\x19\x11\x3d\x11\x3d" } },
    .{ "SCardRemoveReaderFromGroupW", MethodRecord{ .library = "WinSCard", .import = "SCardRemoveReaderFromGroupW", .signature = "\x00\x03\x08\x19\x11\x05\x11\x05" } },
    .{ "SCardIntroduceCardTypeA", MethodRecord{ .library = "WinSCard", .import = "SCardIntroduceCardTypeA", .signature = "\x00\x08\x08\x19\x11\x3d\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x05\x0f\x05\x09" } },
    .{ "SCardIntroduceCardTypeW", MethodRecord{ .library = "WinSCard", .import = "SCardIntroduceCardTypeW", .signature = "\x00\x08\x08\x19\x11\x05\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x05\x0f\x05\x09" } },
    .{ "SCardSetCardTypeProviderNameA", MethodRecord{ .library = "WinSCard", .import = "SCardSetCardTypeProviderNameA", .signature = "\x00\x04\x08\x19\x11\x3d\x09\x11\x3d" } },
    .{ "SCardSetCardTypeProviderNameW", MethodRecord{ .library = "WinSCard", .import = "SCardSetCardTypeProviderNameW", .signature = "\x00\x04\x08\x19\x11\x05\x09\x11\x05" } },
    .{ "SCardForgetCardTypeA", MethodRecord{ .library = "WinSCard", .import = "SCardForgetCardTypeA", .signature = "\x00\x02\x08\x19\x11\x3d" } },
    .{ "SCardForgetCardTypeW", MethodRecord{ .library = "WinSCard", .import = "SCardForgetCardTypeW", .signature = "\x00\x02\x08\x19\x11\x05" } },
    .{ "SCardFreeMemory", MethodRecord{ .library = "WinSCard", .import = "SCardFreeMemory", .signature = "\x00\x02\x08\x19\x0f\x01" } },
    .{ "SCardAccessStartedEvent", MethodRecord{ .library = "WinSCard", .import = "SCardAccessStartedEvent", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "SCardReleaseStartedEvent", MethodRecord{ .library = "WinSCard", .import = "SCardReleaseStartedEvent", .signature = "\x00\x00\x01" } },
    .{ "SCardLocateCardsA", MethodRecord{ .library = "WinSCard", .import = "SCardLocateCardsA", .signature = "\x00\x04\x08\x19\x11\x3d\x0f\x11\x9d\x69\x09" } },
    .{ "SCardLocateCardsW", MethodRecord{ .library = "WinSCard", .import = "SCardLocateCardsW", .signature = "\x00\x04\x08\x19\x11\x05\x0f\x11\x9d\x6d\x09" } },
    .{ "SCardLocateCardsByATRA", MethodRecord{ .library = "WinSCard", .import = "SCardLocateCardsByATRA", .signature = "\x00\x05\x08\x19\x0f\x11\x9d\x71\x09\x0f\x11\x9d\x69\x09" } },
    .{ "SCardLocateCardsByATRW", MethodRecord{ .library = "WinSCard", .import = "SCardLocateCardsByATRW", .signature = "\x00\x05\x08\x19\x0f\x11\x9d\x71\x09\x0f\x11\x9d\x6d\x09" } },
    .{ "SCardGetStatusChangeA", MethodRecord{ .library = "WinSCard", .import = "SCardGetStatusChangeA", .signature = "\x00\x04\x08\x19\x09\x0f\x11\x9d\x69\x09" } },
    .{ "SCardGetStatusChangeW", MethodRecord{ .library = "WinSCard", .import = "SCardGetStatusChangeW", .signature = "\x00\x04\x08\x19\x09\x0f\x11\x9d\x6d\x09" } },
    .{ "SCardCancel", MethodRecord{ .library = "WinSCard", .import = "SCardCancel", .signature = "\x00\x01\x08\x19" } },
    .{ "SCardConnectA", MethodRecord{ .library = "WinSCard", .import = "SCardConnectA", .signature = "\x00\x06\x08\x19\x11\x3d\x09\x09\x0f\x19\x0f\x09" } },
    .{ "SCardConnectW", MethodRecord{ .library = "WinSCard", .import = "SCardConnectW", .signature = "\x00\x06\x08\x19\x11\x05\x09\x09\x0f\x19\x0f\x09" } },
    .{ "SCardReconnect", MethodRecord{ .library = "WinSCard", .import = "SCardReconnect", .signature = "\x00\x05\x08\x19\x09\x09\x09\x0f\x09" } },
    .{ "SCardDisconnect", MethodRecord{ .library = "WinSCard", .import = "SCardDisconnect", .signature = "\x00\x02\x08\x19\x09" } },
    .{ "SCardBeginTransaction", MethodRecord{ .library = "WinSCard", .import = "SCardBeginTransaction", .signature = "\x00\x01\x08\x19" } },
    .{ "SCardEndTransaction", MethodRecord{ .library = "WinSCard", .import = "SCardEndTransaction", .signature = "\x00\x02\x08\x19\x09" } },
    .{ "SCardState", MethodRecord{ .library = "WinSCard", .import = "SCardState", .signature = "\x00\x05\x08\x19\x0f\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "SCardStatusA", MethodRecord{ .library = "WinSCard", .import = "SCardStatusA", .signature = "\x00\x07\x08\x19\x11\x3d\x0f\x09\x0f\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "SCardStatusW", MethodRecord{ .library = "WinSCard", .import = "SCardStatusW", .signature = "\x00\x07\x08\x19\x11\x05\x0f\x09\x0f\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "SCardTransmit", MethodRecord{ .library = "WinSCard", .import = "SCardTransmit", .signature = "\x00\x07\x08\x19\x0f\x11\x9d\x75\x0f\x05\x09\x0f\x11\x9d\x75\x0f\x05\x0f\x09" } },
    .{ "SCardGetTransmitCount", MethodRecord{ .library = "WinSCard", .import = "SCardGetTransmitCount", .signature = "\x00\x02\x08\x19\x0f\x09" } },
    .{ "SCardControl", MethodRecord{ .library = "WinSCard", .import = "SCardControl", .signature = "\x00\x07\x08\x19\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "SCardGetAttrib", MethodRecord{ .library = "WinSCard", .import = "SCardGetAttrib", .signature = "\x00\x04\x08\x19\x09\x0f\x05\x0f\x09" } },
    .{ "SCardSetAttrib", MethodRecord{ .library = "WinSCard", .import = "SCardSetAttrib", .signature = "\x00\x04\x08\x19\x09\x0f\x05\x09" } },
    .{ "SCardUIDlgSelectCardA", MethodRecord{ .library = "SCARDDLG", .import = "SCardUIDlgSelectCardA", .signature = "\x00\x01\x08\x0f\x11\x9d\x79" } },
    .{ "SCardUIDlgSelectCardW", MethodRecord{ .library = "SCARDDLG", .import = "SCardUIDlgSelectCardW", .signature = "\x00\x01\x08\x0f\x11\x9d\x7d" } },
    .{ "GetOpenCardNameA", MethodRecord{ .library = "SCARDDLG", .import = "GetOpenCardNameA", .signature = "\x00\x01\x08\x0f\x11\x9d\x81" } },
    .{ "GetOpenCardNameW", MethodRecord{ .library = "SCARDDLG", .import = "GetOpenCardNameW", .signature = "\x00\x01\x08\x0f\x11\x9d\x85" } },
    .{ "SCardDlgExtendedError", MethodRecord{ .library = "SCARDDLG", .import = "SCardDlgExtendedError", .signature = "\x00\x00\x08" } },
    .{ "SCardReadCacheA", MethodRecord{ .library = "WinSCard", .import = "SCardReadCacheA", .signature = "\x00\x06\x08\x19\x0f\x11\x0d\x09\x11\x3d\x0f\x05\x0f\x09" } },
    .{ "SCardReadCacheW", MethodRecord{ .library = "WinSCard", .import = "SCardReadCacheW", .signature = "\x00\x06\x08\x19\x0f\x11\x0d\x09\x11\x05\x0f\x05\x0f\x09" } },
    .{ "SCardWriteCacheA", MethodRecord{ .library = "WinSCard", .import = "SCardWriteCacheA", .signature = "\x00\x06\x08\x19\x0f\x11\x0d\x09\x11\x3d\x0f\x05\x09" } },
    .{ "SCardWriteCacheW", MethodRecord{ .library = "WinSCard", .import = "SCardWriteCacheW", .signature = "\x00\x06\x08\x19\x0f\x11\x0d\x09\x11\x05\x0f\x05\x09" } },
    .{ "SCardGetReaderIconA", MethodRecord{ .library = "WinSCard", .import = "SCardGetReaderIconA", .signature = "\x00\x04\x08\x19\x11\x3d\x0f\x05\x0f\x09" } },
    .{ "SCardGetReaderIconW", MethodRecord{ .library = "WinSCard", .import = "SCardGetReaderIconW", .signature = "\x00\x04\x08\x19\x11\x05\x0f\x05\x0f\x09" } },
    .{ "SCardGetDeviceTypeIdA", MethodRecord{ .library = "WinSCard", .import = "SCardGetDeviceTypeIdA", .signature = "\x00\x03\x08\x19\x11\x3d\x0f\x09" } },
    .{ "SCardGetDeviceTypeIdW", MethodRecord{ .library = "WinSCard", .import = "SCardGetDeviceTypeIdW", .signature = "\x00\x03\x08\x19\x11\x05\x0f\x09" } },
    .{ "SCardGetReaderDeviceInstanceIdA", MethodRecord{ .library = "WinSCard", .import = "SCardGetReaderDeviceInstanceIdA", .signature = "\x00\x04\x08\x19\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "SCardGetReaderDeviceInstanceIdW", MethodRecord{ .library = "WinSCard", .import = "SCardGetReaderDeviceInstanceIdW", .signature = "\x00\x04\x08\x19\x11\x05\x11\x05\x0f\x09" } },
    .{ "SCardListReadersWithDeviceInstanceIdA", MethodRecord{ .library = "WinSCard", .import = "SCardListReadersWithDeviceInstanceIdA", .signature = "\x00\x04\x08\x19\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "SCardListReadersWithDeviceInstanceIdW", MethodRecord{ .library = "WinSCard", .import = "SCardListReadersWithDeviceInstanceIdW", .signature = "\x00\x04\x08\x19\x11\x05\x11\x05\x0f\x09" } },
    .{ "SCardAudit", MethodRecord{ .library = "WinSCard", .import = "SCardAudit", .signature = "\x00\x02\x08\x19\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x13d5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "SecHandle" },
        0x1409 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDENTIAL_TARGET_INFORMATIONW" },
        0x1b8d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CRED_TYPE" },
        0x1b95 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDUI_FLAGS" },
        0x1b99 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "SCARD_SCOPE" },
        0x1b9d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CRED_ENUMERATE_FLAGS" },
        0x1ba1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDUIWIN_FLAGS" },
        0x1ba9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CRED_PACK_FLAGS" },
        0x1d41 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "KeyCredentialManagerOperationType" },
        0x1d45 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "KeyCredentialManagerOperationErrorStates" },
        0x1d49 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "KeyCredentialManagerInfo" },
        0x1d4d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDENTIALW" },
        0x1d51 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDENTIALA" },
        0x1d55 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDENTIAL_TARGET_INFORMATIONA" },
        0x1d59 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CRED_MARSHAL_TYPE" },
        0x1d5d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CRED_PROTECTION_TYPE" },
        0x1d61 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDUI_INFOW" },
        0x1d65 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDUI_INFOA" },
        0x1d69 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "SCARD_READERSTATEA" },
        0x1d6d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "SCARD_READERSTATEW" },
        0x1d71 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "SCARD_ATRMASK" },
        0x1d75 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "SCARD_IO_REQUEST" },
        0x1d79 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "OPENCARDNAME_EXA" },
        0x1d7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "OPENCARDNAME_EXW" },
        0x1d81 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "OPENCARDNAMEA" },
        0x1d85 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "OPENCARDNAMEW" },
        else => null,
    };
}

pub const CRED_FLAGS_PASSWORD_FOR_CERT = 1;
pub const CRED_FLAGS_PROMPT_NOW = 2;
pub const CRED_FLAGS_USERNAME_TARGET = 4;
pub const CRED_FLAGS_OWF_CRED_BLOB = 8;
pub const CRED_FLAGS_REQUIRE_CONFIRMATION = 16;
pub const CRED_FLAGS_WILDCARD_MATCH = 32;
pub const CRED_FLAGS_VSM_PROTECTED = 64;
pub const CRED_FLAGS_NGC_CERT = 128;
pub const CRED_FLAGS_VALID_FLAGS = 61695;
pub const CRED_FLAGS_VALID_INPUT_FLAGS = 61599;
pub const CRED_TYPE_GENERIC = 1;
pub const CRED_TYPE_DOMAIN_PASSWORD = 2;
pub const CRED_TYPE_DOMAIN_CERTIFICATE = 3;
pub const CRED_TYPE_DOMAIN_VISIBLE_PASSWORD = 4;
pub const CRED_TYPE_GENERIC_CERTIFICATE = 5;
pub const CRED_TYPE_DOMAIN_EXTENDED = 6;
pub const CRED_TYPE_MAXIMUM = 7;
pub const CRED_TYPE_MAXIMUM_EX = 1007;
pub const CRED_PERSIST_NONE = 0;
pub const CRED_PERSIST_SESSION = 1;
pub const CRED_PERSIST_LOCAL_MACHINE = 2;
pub const CRED_PERSIST_ENTERPRISE = 3;
pub const CREDUI_FLAGS_ALWAYS_SHOW_UI = 128;
pub const CREDUI_FLAGS_COMPLETE_USERNAME = 2048;
pub const CREDUI_FLAGS_DO_NOT_PERSIST = 2;
pub const CREDUI_FLAGS_EXCLUDE_CERTIFICATES = 8;
pub const CREDUI_FLAGS_EXPECT_CONFIRMATION = 131072;
pub const CREDUI_FLAGS_GENERIC_CREDENTIALS = 262144;
pub const CREDUI_FLAGS_INCORRECT_PASSWORD = 1;
pub const CREDUI_FLAGS_KEEP_USERNAME = 1048576;
pub const CREDUI_FLAGS_PASSWORD_ONLY_OK = 512;
pub const CREDUI_FLAGS_PERSIST = 4096;
pub const CREDUI_FLAGS_REQUEST_ADMINISTRATOR = 4;
pub const CREDUI_FLAGS_REQUIRE_CERTIFICATE = 16;
pub const CREDUI_FLAGS_REQUIRE_SMARTCARD = 256;
pub const CREDUI_FLAGS_SERVER_CREDENTIAL = 16384;
pub const CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX = 64;
pub const CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS = 524288;
pub const CREDUI_FLAGS_VALIDATE_USERNAME = 1024;
pub const SCARD_SCOPE_USER = 0;
pub const SCARD_SCOPE_SYSTEM = 2;
pub const CRED_ENUMERATE_ALL_CREDENTIALS = 1;
pub const CREDUIWIN_GENERIC = 1;
pub const CREDUIWIN_CHECKBOX = 2;
pub const CREDUIWIN_AUTHPACKAGE_ONLY = 16;
pub const CREDUIWIN_IN_CRED_ONLY = 32;
pub const CREDUIWIN_ENUMERATE_ADMINS = 256;
pub const CREDUIWIN_ENUMERATE_CURRENT_USER = 512;
pub const CREDUIWIN_SECURE_PROMPT = 4096;
pub const CREDUIWIN_PREPROMPTING = 8192;
pub const CREDUIWIN_PACK_32_WOW = 268435456;
pub const SCARD_STATE_UNAWARE = 0;
pub const SCARD_STATE_IGNORE = 1;
pub const SCARD_STATE_UNAVAILABLE = 8;
pub const SCARD_STATE_EMPTY = 16;
pub const SCARD_STATE_PRESENT = 32;
pub const SCARD_STATE_ATRMATCH = 64;
pub const SCARD_STATE_EXCLUSIVE = 128;
pub const SCARD_STATE_INUSE = 256;
pub const SCARD_STATE_MUTE = 512;
pub const SCARD_STATE_CHANGED = 2;
pub const SCARD_STATE_UNKNOWN = 4;
pub const CRED_PACK_PROTECTED_CREDENTIALS = 1;
pub const CRED_PACK_WOW_BUFFER = 2;
pub const CRED_PACK_GENERIC_CREDENTIALS = 4;
pub const CRED_PACK_ID_PROVIDER_CREDENTIALS = 8;
pub const CRED_MAX_CREDENTIAL_BLOB_SIZE = 2560;
pub const CRED_MAX_USERNAME_LENGTH = 513;
pub const CRED_MAX_DOMAIN_TARGET_NAME_LENGTH = 337;
pub const FILE_DEVICE_SMARTCARD = 49;
pub const SCARD_ATR_LENGTH = 33;
pub const SCARD_PROTOCOL_UNDEFINED = 0;
pub const SCARD_PROTOCOL_T0 = 1;
pub const SCARD_PROTOCOL_T1 = 2;
pub const SCARD_PROTOCOL_RAW = 65536;
pub const SCARD_PROTOCOL_DEFAULT = 2147483648;
pub const SCARD_PROTOCOL_OPTIMAL = 0;
pub const SCARD_POWER_DOWN = 0;
pub const SCARD_COLD_RESET = 1;
pub const SCARD_WARM_RESET = 2;
pub const MAXIMUM_ATTR_STRING_LENGTH = 32;
pub const MAXIMUM_SMARTCARD_READERS = 10;
pub const SCARD_CLASS_VENDOR_INFO = 1;
pub const SCARD_CLASS_COMMUNICATIONS = 2;
pub const SCARD_CLASS_PROTOCOL = 3;
pub const SCARD_CLASS_POWER_MGMT = 4;
pub const SCARD_CLASS_SECURITY = 5;
pub const SCARD_CLASS_MECHANICAL = 6;
pub const SCARD_CLASS_VENDOR_DEFINED = 7;
pub const SCARD_CLASS_IFD_PROTOCOL = 8;
pub const SCARD_CLASS_ICC_STATE = 9;
pub const SCARD_CLASS_PERF = 32766;
pub const SCARD_CLASS_SYSTEM = 32767;
pub const SCARD_T0_HEADER_LENGTH = 7;
pub const SCARD_T0_CMD_LENGTH = 5;
pub const SCARD_T1_PROLOGUE_LENGTH = 3;
pub const SCARD_T1_EPILOGUE_LENGTH = 2;
pub const SCARD_T1_EPILOGUE_LENGTH_LRC = 1;
pub const SCARD_T1_MAX_IFS = 254;
pub const SCARD_UNKNOWN = 0;
pub const SCARD_ABSENT = 1;
pub const SCARD_PRESENT = 2;
pub const SCARD_SWALLOWED = 3;
pub const SCARD_POWERED = 4;
pub const SCARD_NEGOTIABLE = 5;
pub const SCARD_SPECIFIC = 6;
pub const SCARD_READER_SWALLOWS = 1;
pub const SCARD_READER_EJECTS = 2;
pub const SCARD_READER_CONFISCATES = 4;
pub const SCARD_READER_CONTACTLESS = 8;
pub const SCARD_READER_TYPE_SERIAL = 1;
pub const SCARD_READER_TYPE_PARALELL = 2;
pub const SCARD_READER_TYPE_KEYBOARD = 4;
pub const SCARD_READER_TYPE_SCSI = 8;
pub const SCARD_READER_TYPE_IDE = 16;
pub const SCARD_READER_TYPE_USB = 32;
pub const SCARD_READER_TYPE_PCMCIA = 64;
pub const SCARD_READER_TYPE_TPM = 128;
pub const SCARD_READER_TYPE_NFC = 256;
pub const SCARD_READER_TYPE_UICC = 512;
pub const SCARD_READER_TYPE_NGC = 1024;
pub const SCARD_READER_TYPE_EMBEDDEDSE = 2048;
pub const SCARD_READER_TYPE_VENDOR = 240;
pub const STATUS_LOGON_FAILURE = -1073741715;
pub const STATUS_WRONG_PASSWORD = -1073741718;
pub const STATUS_PASSWORD_EXPIRED = -1073741711;
pub const STATUS_PASSWORD_MUST_CHANGE = -1073741276;
pub const STATUS_DOWNGRADE_DETECTED = -1073740920;
pub const STATUS_AUTHENTICATION_FIREWALL_FAILED = -1073740781;
pub const STATUS_ACCOUNT_DISABLED = -1073741710;
pub const STATUS_ACCOUNT_RESTRICTION = -1073741714;
pub const STATUS_ACCOUNT_LOCKED_OUT = -1073741260;
pub const STATUS_ACCOUNT_EXPIRED = -1073741421;
pub const STATUS_LOGON_TYPE_NOT_GRANTED = -1073741477;
pub const STATUS_NO_SUCH_LOGON_SESSION = -1073741729;
pub const STATUS_NO_SUCH_USER = -1073741724;
pub const CRED_MAX_STRING_LENGTH = 256;
pub const CRED_MAX_GENERIC_TARGET_NAME_LENGTH = 32767;
pub const CRED_MAX_TARGETNAME_NAMESPACE_LENGTH = 256;
pub const CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH = 256;
pub const CRED_MAX_VALUE_SIZE = 256;
pub const CRED_MAX_ATTRIBUTES = 64;
pub const CRED_LOGON_TYPES_MASK = 61440;
pub const CRED_TI_SERVER_FORMAT_UNKNOWN = 1;
pub const CRED_TI_DOMAIN_FORMAT_UNKNOWN = 2;
pub const CRED_TI_ONLY_PASSWORD_REQUIRED = 4;
pub const CRED_TI_USERNAME_TARGET = 8;
pub const CRED_TI_CREATE_EXPLICIT_CRED = 16;
pub const CRED_TI_WORKGROUP_MEMBER = 32;
pub const CRED_TI_DNSTREE_IS_DFS_SERVER = 64;
pub const CRED_TI_VALID_FLAGS = 61567;
pub const CERT_HASH_LENGTH = 20;
pub const CREDUI_MAX_MESSAGE_LENGTH = 1024;
pub const CREDUI_MAX_CAPTION_LENGTH = 128;
pub const CREDUI_MAX_GENERIC_TARGET_LENGTH = 32767;
pub const CREDUI_MAX_DOMAIN_TARGET_LENGTH = 337;
pub const CREDUI_MAX_USERNAME_LENGTH = 513;
pub const CREDUIWIN_USE_V2 = 64;
pub const CREDUIWIN_IGNORE_CLOUDAUTHORITY_NAME = 262144;
pub const CREDUIWIN_DOWNLEVEL_HELLO_AS_SMART_CARD = 2147483648;
pub const BACK_BUTTON_IDENTIFY_AUTH_PACKAGE = 3402629121;
pub const CREDUI_FOOTER_LINK_AUTHPACKAGE_ID = 212664322;
pub const CREDUI_PICKERSCREEN_AUTHPACKAGE_ID = 212664323;
pub const CRED_PRESERVE_CREDENTIAL_BLOB = 1;
pub const CRED_CACHE_TARGET_INFORMATION = 1;
pub const CRED_ALLOW_NAME_RESOLUTION = 1;
pub const CRED_PROTECT_AS_SELF = 1;
pub const CRED_PROTECT_TO_SYSTEM = 2;
pub const CRED_UNPROTECT_AS_SELF = 1;
pub const CRED_UNPROTECT_ALLOW_TO_SYSTEM = 2;
pub const SCARD_SCOPE_TERMINAL = 1;
pub const SCARD_PROVIDER_PRIMARY = 1;
pub const SCARD_PROVIDER_CSP = 2;
pub const SCARD_PROVIDER_KSP = 3;
pub const SCARD_STATE_UNPOWERED = 1024;
pub const SCARD_SHARE_EXCLUSIVE = 1;
pub const SCARD_SHARE_SHARED = 2;
pub const SCARD_SHARE_DIRECT = 3;
pub const SCARD_LEAVE_CARD = 0;
pub const SCARD_RESET_CARD = 1;
pub const SCARD_UNPOWER_CARD = 2;
pub const SCARD_EJECT_CARD = 3;
pub const SC_DLG_MINIMAL_UI = 1;
pub const SC_DLG_NO_UI = 2;
pub const SC_DLG_FORCE_UI = 4;
pub const SCERR_NOCARDNAME = 16384;
pub const SCERR_NOGUIDS = 32768;
pub const SCARD_AUDIT_CHV_FAILURE = 0;
pub const SCARD_AUDIT_CHV_SUCCESS = 1;
pub const CREDSSP_SERVER_AUTH_NEGOTIATE = 1;
pub const CREDSSP_SERVER_AUTH_CERTIFICATE = 2;
pub const CREDSSP_SERVER_AUTH_LOOPBACK = 4;
pub const SECPKG_ALT_ATTR = 2147483648;
pub const SECPKG_ATTR_C_FULL_IDENT_TOKEN = 2147483781;
pub const CREDSSP_CRED_EX_VERSION = 0;
pub const CREDSSP_FLAG_REDIRECT = 1;
pub const KeyCredentialManagerOperationErrorStateNone = 0;
pub const KeyCredentialManagerOperationErrorStateDeviceJoinFailure = 1;
pub const KeyCredentialManagerOperationErrorStateTokenFailure = 2;
pub const KeyCredentialManagerOperationErrorStateCertificateFailure = 4;
pub const KeyCredentialManagerOperationErrorStateRemoteSessionFailure = 8;
pub const KeyCredentialManagerOperationErrorStatePolicyFailure = 16;
pub const KeyCredentialManagerOperationErrorStateHardwareFailure = 32;
pub const KeyCredentialManagerOperationErrorStatePinExistsFailure = 64;
pub const KeyCredentialManagerProvisioning = 0;
pub const KeyCredentialManagerPinChange = 1;
pub const KeyCredentialManagerPinReset = 2;
pub const CertCredential = 1;
pub const UsernameTargetCredential = 2;
pub const BinaryBlobCredential = 3;
pub const UsernameForPackedCredentials = 4;
pub const BinaryBlobForSystem = 5;
pub const CredUnprotected = 0;
pub const CredUserProtection = 1;
pub const CredTrustedProtection = 2;
pub const CredForSystemProtection = 3;
pub const RSR_MATCH_TYPE_READER_AND_CONTAINER = 1;
pub const RSR_MATCH_TYPE_SERIAL_NUMBER = 2;
pub const RSR_MATCH_TYPE_ALL_CARDS = 3;
pub const CredsspPasswordCreds = 2;
pub const CredsspSchannelCreds = 4;
pub const CredsspCertificateCreds = 13;
pub const CredsspSubmitBufferBoth = 50;
pub const CredsspSubmitBufferBothOld = 51;
pub const CredsspCredEx = 100;

pub const aliases = struct {
    pub const CRED_FLAGS = u32;
    pub const CRED_TYPE = u32;
    pub const CRED_PERSIST = u32;
    pub const CREDUI_FLAGS = u32;
    pub const SCARD_SCOPE = u32;
    pub const CRED_ENUMERATE_FLAGS = u32;
    pub const CREDUIWIN_FLAGS = u32;
    pub const SCARD_STATE = u32;
    pub const CRED_PACK_FLAGS = u32;
    pub const KeyCredentialManagerOperationErrorStates = i32;
    pub const KeyCredentialManagerOperationType = i32;
    pub const CRED_MARSHAL_TYPE = i32;
    pub const CRED_PROTECTION_TYPE = i32;
    pub const READER_SEL_REQUEST_MATCH_TYPE = i32;
    pub const CREDSPP_SUBMIT_TYPE = i32;
};
