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
    .{ "GetCurrentProcessToken", MethodRecord{ .library = "FORCEINLINE", .import = "GetCurrentProcessToken", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "GetCurrentThreadToken", MethodRecord{ .library = "FORCEINLINE", .import = "GetCurrentThreadToken", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "GetCurrentThreadEffectiveToken", MethodRecord{ .library = "FORCEINLINE", .import = "GetCurrentThreadEffectiveToken", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "GetProcessWorkingSetSize", MethodRecord{ .library = "KERNEL32", .import = "GetProcessWorkingSetSize", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x19\x0f\x19" } },
    .{ "SetProcessWorkingSetSize", MethodRecord{ .library = "KERNEL32", .import = "SetProcessWorkingSetSize", .signature = "\x00\x03\x11\x59\x11\x80\x85\x19\x19" } },
    .{ "FlsAlloc", MethodRecord{ .library = "KERNEL32", .import = "FlsAlloc", .signature = "\x00\x01\x09\x12\xa3\xb9" } },
    .{ "FlsGetValue", MethodRecord{ .library = "KERNEL32", .import = "FlsGetValue", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "FlsSetValue", MethodRecord{ .library = "KERNEL32", .import = "FlsSetValue", .signature = "\x00\x02\x11\x59\x09\x0f\x01" } },
    .{ "FlsFree", MethodRecord{ .library = "KERNEL32", .import = "FlsFree", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "IsThreadAFiber", MethodRecord{ .library = "KERNEL32", .import = "IsThreadAFiber", .signature = "\x00\x00\x11\x59" } },
    .{ "FlsGetValue2", MethodRecord{ .library = "KERNEL32", .import = "FlsGetValue2", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "InitializeSRWLock", MethodRecord{ .library = "KERNEL32", .import = "InitializeSRWLock", .signature = "\x00\x01\x01\x0f\x11\xa3\xb1" } },
    .{ "ReleaseSRWLockExclusive", MethodRecord{ .library = "KERNEL32", .import = "ReleaseSRWLockExclusive", .signature = "\x00\x01\x01\x0f\x11\xa3\xb1" } },
    .{ "ReleaseSRWLockShared", MethodRecord{ .library = "KERNEL32", .import = "ReleaseSRWLockShared", .signature = "\x00\x01\x01\x0f\x11\xa3\xb1" } },
    .{ "AcquireSRWLockExclusive", MethodRecord{ .library = "KERNEL32", .import = "AcquireSRWLockExclusive", .signature = "\x00\x01\x01\x0f\x11\xa3\xb1" } },
    .{ "AcquireSRWLockShared", MethodRecord{ .library = "KERNEL32", .import = "AcquireSRWLockShared", .signature = "\x00\x01\x01\x0f\x11\xa3\xb1" } },
    .{ "TryAcquireSRWLockExclusive", MethodRecord{ .library = "KERNEL32", .import = "TryAcquireSRWLockExclusive", .signature = "\x00\x01\x11\x87\x79\x0f\x11\xa3\xb1" } },
    .{ "TryAcquireSRWLockShared", MethodRecord{ .library = "KERNEL32", .import = "TryAcquireSRWLockShared", .signature = "\x00\x01\x11\x87\x79\x0f\x11\xa3\xb1" } },
    .{ "InitializeCriticalSection", MethodRecord{ .library = "KERNEL32", .import = "InitializeCriticalSection", .signature = "\x00\x01\x01\x0f\x11\xa3\xbd" } },
    .{ "EnterCriticalSection", MethodRecord{ .library = "KERNEL32", .import = "EnterCriticalSection", .signature = "\x00\x01\x01\x0f\x11\xa3\xbd" } },
    .{ "LeaveCriticalSection", MethodRecord{ .library = "KERNEL32", .import = "LeaveCriticalSection", .signature = "\x00\x01\x01\x0f\x11\xa3\xbd" } },
    .{ "InitializeCriticalSectionAndSpinCount", MethodRecord{ .library = "KERNEL32", .import = "InitializeCriticalSectionAndSpinCount", .signature = "\x00\x02\x11\x59\x0f\x11\xa3\xbd\x09" } },
    .{ "InitializeCriticalSectionEx", MethodRecord{ .library = "KERNEL32", .import = "InitializeCriticalSectionEx", .signature = "\x00\x03\x11\x59\x0f\x11\xa3\xbd\x09\x09" } },
    .{ "SetCriticalSectionSpinCount", MethodRecord{ .library = "KERNEL32", .import = "SetCriticalSectionSpinCount", .signature = "\x00\x02\x09\x0f\x11\xa3\xbd\x09" } },
    .{ "TryEnterCriticalSection", MethodRecord{ .library = "KERNEL32", .import = "TryEnterCriticalSection", .signature = "\x00\x01\x11\x59\x0f\x11\xa3\xbd" } },
    .{ "DeleteCriticalSection", MethodRecord{ .library = "KERNEL32", .import = "DeleteCriticalSection", .signature = "\x00\x01\x01\x0f\x11\xa3\xbd" } },
    .{ "InitOnceInitialize", MethodRecord{ .library = "KERNEL32", .import = "InitOnceInitialize", .signature = "\x00\x01\x01\x0f\x11\xa3\xb5" } },
    .{ "InitOnceExecuteOnce", MethodRecord{ .library = "KERNEL32", .import = "InitOnceExecuteOnce", .signature = "\x00\x04\x11\x59\x0f\x11\xa3\xb5\x12\xa3\xc1\x0f\x01\x0f\x0f\x01" } },
    .{ "InitOnceBeginInitialize", MethodRecord{ .library = "KERNEL32", .import = "InitOnceBeginInitialize", .signature = "\x00\x04\x11\x59\x0f\x11\xa3\xb5\x09\x0f\x11\x59\x0f\x0f\x01" } },
    .{ "InitOnceComplete", MethodRecord{ .library = "KERNEL32", .import = "InitOnceComplete", .signature = "\x00\x03\x11\x59\x0f\x11\xa3\xb5\x09\x0f\x01" } },
    .{ "InitializeConditionVariable", MethodRecord{ .library = "KERNEL32", .import = "InitializeConditionVariable", .signature = "\x00\x01\x01\x0f\x11\xa3\xad" } },
    .{ "WakeConditionVariable", MethodRecord{ .library = "KERNEL32", .import = "WakeConditionVariable", .signature = "\x00\x01\x01\x0f\x11\xa3\xad" } },
    .{ "WakeAllConditionVariable", MethodRecord{ .library = "KERNEL32", .import = "WakeAllConditionVariable", .signature = "\x00\x01\x01\x0f\x11\xa3\xad" } },
    .{ "SleepConditionVariableCS", MethodRecord{ .library = "KERNEL32", .import = "SleepConditionVariableCS", .signature = "\x00\x03\x11\x59\x0f\x11\xa3\xad\x0f\x11\xa3\xbd\x09" } },
    .{ "SleepConditionVariableSRW", MethodRecord{ .library = "KERNEL32", .import = "SleepConditionVariableSRW", .signature = "\x00\x04\x11\x59\x0f\x11\xa3\xad\x0f\x11\xa3\xb1\x09\x09" } },
    .{ "SetEvent", MethodRecord{ .library = "KERNEL32", .import = "SetEvent", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ResetEvent", MethodRecord{ .library = "KERNEL32", .import = "ResetEvent", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ReleaseSemaphore", MethodRecord{ .library = "KERNEL32", .import = "ReleaseSemaphore", .signature = "\x00\x03\x11\x59\x11\x80\x85\x08\x0f\x08" } },
    .{ "ReleaseMutex", MethodRecord{ .library = "KERNEL32", .import = "ReleaseMutex", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "WaitForSingleObject", MethodRecord{ .library = "KERNEL32", .import = "WaitForSingleObject", .signature = "\x00\x02\x11\x8d\x15\x11\x80\x85\x09" } },
    .{ "SleepEx", MethodRecord{ .library = "KERNEL32", .import = "SleepEx", .signature = "\x00\x02\x09\x09\x11\x59" } },
    .{ "WaitForSingleObjectEx", MethodRecord{ .library = "KERNEL32", .import = "WaitForSingleObjectEx", .signature = "\x00\x03\x11\x8d\x15\x11\x80\x85\x09\x11\x59" } },
    .{ "WaitForMultipleObjectsEx", MethodRecord{ .library = "KERNEL32", .import = "WaitForMultipleObjectsEx", .signature = "\x00\x05\x11\x8d\x15\x09\x0f\x11\x80\x85\x11\x59\x09\x11\x59" } },
    .{ "CreateMutexA", MethodRecord{ .library = "KERNEL32", .import = "CreateMutexA", .signature = "\x00\x03\x11\x80\x85\x0f\x11\x8b\xb5\x11\x59\x11\x3d" } },
    .{ "CreateMutexW", MethodRecord{ .library = "KERNEL32", .import = "CreateMutexW", .signature = "\x00\x03\x11\x80\x85\x0f\x11\x8b\xb5\x11\x59\x11\x05" } },
    .{ "OpenMutexW", MethodRecord{ .library = "KERNEL32", .import = "OpenMutexW", .signature = "\x00\x03\x11\x80\x85\x11\xa3\x29\x11\x59\x11\x05" } },
    .{ "CreateEventA", MethodRecord{ .library = "KERNEL32", .import = "CreateEventA", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x59\x11\x59\x11\x3d" } },
    .{ "CreateEventW", MethodRecord{ .library = "KERNEL32", .import = "CreateEventW", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x59\x11\x59\x11\x05" } },
    .{ "OpenEventA", MethodRecord{ .library = "KERNEL32", .import = "OpenEventA", .signature = "\x00\x03\x11\x80\x85\x11\xa3\x29\x11\x59\x11\x3d" } },
    .{ "OpenEventW", MethodRecord{ .library = "KERNEL32", .import = "OpenEventW", .signature = "\x00\x03\x11\x80\x85\x11\xa3\x29\x11\x59\x11\x05" } },
    .{ "OpenSemaphoreW", MethodRecord{ .library = "KERNEL32", .import = "OpenSemaphoreW", .signature = "\x00\x03\x11\x80\x85\x11\xa3\x29\x11\x59\x11\x05" } },
    .{ "OpenWaitableTimerW", MethodRecord{ .library = "KERNEL32", .import = "OpenWaitableTimerW", .signature = "\x00\x03\x11\x80\x85\x11\xa3\x29\x11\x59\x11\x05" } },
    .{ "SetWaitableTimerEx", MethodRecord{ .library = "KERNEL32", .import = "SetWaitableTimerEx", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x0a\x08\x12\xa3\xc5\x0f\x01\x0f\x11\xa3\xc9\x09" } },
    .{ "SetWaitableTimer", MethodRecord{ .library = "KERNEL32", .import = "SetWaitableTimer", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x0a\x08\x12\xa3\xc5\x0f\x01\x11\x59" } },
    .{ "CancelWaitableTimer", MethodRecord{ .library = "KERNEL32", .import = "CancelWaitableTimer", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "CreateMutexExA", MethodRecord{ .library = "KERNEL32", .import = "CreateMutexExA", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x3d\x09\x09" } },
    .{ "CreateMutexExW", MethodRecord{ .library = "KERNEL32", .import = "CreateMutexExW", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x05\x09\x09" } },
    .{ "CreateEventExA", MethodRecord{ .library = "KERNEL32", .import = "CreateEventExA", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x3d\x11\xa2\xf9\x09" } },
    .{ "CreateEventExW", MethodRecord{ .library = "KERNEL32", .import = "CreateEventExW", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x05\x11\xa2\xf9\x09" } },
    .{ "CreateSemaphoreExW", MethodRecord{ .library = "KERNEL32", .import = "CreateSemaphoreExW", .signature = "\x00\x06\x11\x80\x85\x0f\x11\x8b\xb5\x08\x08\x11\x05\x09\x09" } },
    .{ "CreateWaitableTimerExW", MethodRecord{ .library = "KERNEL32", .import = "CreateWaitableTimerExW", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x05\x09\x09" } },
    .{ "EnterSynchronizationBarrier", MethodRecord{ .library = "KERNEL32", .import = "EnterSynchronizationBarrier", .signature = "\x00\x02\x11\x59\x0f\x11\xa3\xcd\x09" } },
    .{ "InitializeSynchronizationBarrier", MethodRecord{ .library = "KERNEL32", .import = "InitializeSynchronizationBarrier", .signature = "\x00\x03\x11\x59\x0f\x11\xa3\xcd\x08\x08" } },
    .{ "DeleteSynchronizationBarrier", MethodRecord{ .library = "KERNEL32", .import = "DeleteSynchronizationBarrier", .signature = "\x00\x01\x11\x59\x0f\x11\xa3\xcd" } },
    .{ "Sleep", MethodRecord{ .library = "KERNEL32", .import = "Sleep", .signature = "\x00\x01\x01\x09" } },
    .{ "WaitOnAddress", MethodRecord{ .library = "api-ms-win-core-synch-l1-2-0", .import = "WaitOnAddress", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x19\x09" } },
    .{ "WakeByAddressSingle", MethodRecord{ .library = "api-ms-win-core-synch-l1-2-0", .import = "WakeByAddressSingle", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "WakeByAddressAll", MethodRecord{ .library = "api-ms-win-core-synch-l1-2-0", .import = "WakeByAddressAll", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "WaitForMultipleObjects", MethodRecord{ .library = "KERNEL32", .import = "WaitForMultipleObjects", .signature = "\x00\x04\x11\x8d\x15\x09\x0f\x11\x80\x85\x11\x59\x09" } },
    .{ "CreateSemaphoreW", MethodRecord{ .library = "KERNEL32", .import = "CreateSemaphoreW", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x08\x08\x11\x05" } },
    .{ "CreateWaitableTimerW", MethodRecord{ .library = "KERNEL32", .import = "CreateWaitableTimerW", .signature = "\x00\x03\x11\x80\x85\x0f\x11\x8b\xb5\x11\x59\x11\x05" } },
    .{ "InitializeSListHead", MethodRecord{ .library = "KERNEL32", .import = "InitializeSListHead", .signature = "\x00\x01\x01\x0f\x11\xa3\xd1" } },
    .{ "InterlockedPopEntrySList", MethodRecord{ .library = "KERNEL32", .import = "InterlockedPopEntrySList", .signature = "\x00\x01\x0f\x11\x94\xa5\x0f\x11\xa3\xd1" } },
    .{ "InterlockedPushEntrySList", MethodRecord{ .library = "KERNEL32", .import = "InterlockedPushEntrySList", .signature = "\x00\x02\x0f\x11\x94\xa5\x0f\x11\xa3\xd1\x0f\x11\x94\xa5" } },
    .{ "InterlockedPushListSListEx", MethodRecord{ .library = "KERNEL32", .import = "InterlockedPushListSListEx", .signature = "\x00\x04\x0f\x11\x94\xa5\x0f\x11\xa3\xd1\x0f\x11\x94\xa5\x0f\x11\x94\xa5\x09" } },
    .{ "InterlockedFlushSList", MethodRecord{ .library = "KERNEL32", .import = "InterlockedFlushSList", .signature = "\x00\x01\x0f\x11\x94\xa5\x0f\x11\xa3\xd1" } },
    .{ "QueryDepthSList", MethodRecord{ .library = "KERNEL32", .import = "QueryDepthSList", .signature = "\x00\x01\x07\x0f\x11\xa3\xd1" } },
    .{ "QueueUserAPC", MethodRecord{ .library = "KERNEL32", .import = "QueueUserAPC", .signature = "\x00\x03\x09\x12\xa3\xd5\x11\x80\x85\x19" } },
    .{ "QueueUserAPC2", MethodRecord{ .library = "KERNEL32", .import = "QueueUserAPC2", .signature = "\x00\x04\x11\x59\x12\xa3\xd5\x11\x80\x85\x19\x11\xa3\xd9" } },
    .{ "GetProcessTimes", MethodRecord{ .library = "KERNEL32", .import = "GetProcessTimes", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "GetCurrentProcess", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentProcess", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "GetCurrentProcessId", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentProcessId", .signature = "\x00\x00\x09" } },
    .{ "ExitProcess", MethodRecord{ .library = "KERNEL32", .import = "ExitProcess", .signature = "\x00\x01\x01\x09" } },
    .{ "TerminateProcess", MethodRecord{ .library = "KERNEL32", .import = "TerminateProcess", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "GetExitCodeProcess", MethodRecord{ .library = "KERNEL32", .import = "GetExitCodeProcess", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "SwitchToThread", MethodRecord{ .library = "KERNEL32", .import = "SwitchToThread", .signature = "\x00\x00\x11\x59" } },
    .{ "CreateThread", MethodRecord{ .library = "KERNEL32", .import = "CreateThread", .signature = "\x00\x06\x11\x80\x85\x0f\x11\x8b\xb5\x19\x12\x9f\x81\x0f\x01\x11\xa2\xed\x0f\x09" } },
    .{ "CreateRemoteThread", MethodRecord{ .library = "KERNEL32", .import = "CreateRemoteThread", .signature = "\x00\x07\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x19\x12\x9f\x81\x0f\x01\x09\x0f\x09" } },
    .{ "GetCurrentThread", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentThread", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "GetCurrentThreadId", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentThreadId", .signature = "\x00\x00\x09" } },
    .{ "OpenThread", MethodRecord{ .library = "KERNEL32", .import = "OpenThread", .signature = "\x00\x03\x11\x80\x85\x11\xa3\x25\x11\x59\x09" } },
    .{ "SetThreadPriority", MethodRecord{ .library = "KERNEL32", .import = "SetThreadPriority", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xa2\xf1" } },
    .{ "SetThreadPriorityBoost", MethodRecord{ .library = "KERNEL32", .import = "SetThreadPriorityBoost", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x59" } },
    .{ "GetThreadPriorityBoost", MethodRecord{ .library = "KERNEL32", .import = "GetThreadPriorityBoost", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "GetThreadPriority", MethodRecord{ .library = "KERNEL32", .import = "GetThreadPriority", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "ExitThread", MethodRecord{ .library = "KERNEL32", .import = "ExitThread", .signature = "\x00\x01\x01\x09" } },
    .{ "TerminateThread", MethodRecord{ .library = "KERNEL32", .import = "TerminateThread", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "GetExitCodeThread", MethodRecord{ .library = "KERNEL32", .import = "GetExitCodeThread", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "SuspendThread", MethodRecord{ .library = "KERNEL32", .import = "SuspendThread", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "ResumeThread", MethodRecord{ .library = "KERNEL32", .import = "ResumeThread", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "TlsAlloc", MethodRecord{ .library = "KERNEL32", .import = "TlsAlloc", .signature = "\x00\x00\x09" } },
    .{ "TlsGetValue", MethodRecord{ .library = "KERNEL32", .import = "TlsGetValue", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "TlsSetValue", MethodRecord{ .library = "KERNEL32", .import = "TlsSetValue", .signature = "\x00\x02\x11\x59\x09\x0f\x01" } },
    .{ "TlsFree", MethodRecord{ .library = "KERNEL32", .import = "TlsFree", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "CreateProcessA", MethodRecord{ .library = "KERNEL32", .import = "CreateProcessA", .signature = "\x00\x0a\x11\x59\x11\x3d\x11\x3d\x0f\x11\x8b\xb5\x0f\x11\x8b\xb5\x11\x59\x11\xa3\xdd\x0f\x01\x11\x3d\x0f\x11\xa3\xe1\x0f\x11\xa3\xe5" } },
    .{ "CreateProcessW", MethodRecord{ .library = "KERNEL32", .import = "CreateProcessW", .signature = "\x00\x0a\x11\x59\x11\x05\x11\x05\x0f\x11\x8b\xb5\x0f\x11\x8b\xb5\x11\x59\x11\xa3\xdd\x0f\x01\x11\x05\x0f\x11\xa3\xe9\x0f\x11\xa3\xe5" } },
    .{ "SetProcessShutdownParameters", MethodRecord{ .library = "KERNEL32", .import = "SetProcessShutdownParameters", .signature = "\x00\x02\x11\x59\x09\x09" } },
    .{ "GetProcessVersion", MethodRecord{ .library = "KERNEL32", .import = "GetProcessVersion", .signature = "\x00\x01\x09\x09" } },
    .{ "GetStartupInfoW", MethodRecord{ .library = "KERNEL32", .import = "GetStartupInfoW", .signature = "\x00\x01\x01\x0f\x11\xa3\xe9" } },
    .{ "CreateProcessAsUserW", MethodRecord{ .library = "ADVAPI32", .import = "CreateProcessAsUserW", .signature = "\x00\x0b\x11\x59\x11\x80\x85\x11\x05\x11\x05\x0f\x11\x8b\xb5\x0f\x11\x8b\xb5\x11\x59\x11\xa3\xdd\x0f\x01\x11\x05\x0f\x11\xa3\xe9\x0f\x11\xa3\xe5" } },
    .{ "SetThreadToken", MethodRecord{ .library = "ADVAPI32", .import = "SetThreadToken", .signature = "\x00\x02\x11\x59\x0f\x11\x80\x85\x11\x80\x85" } },
    .{ "OpenProcessToken", MethodRecord{ .library = "ADVAPI32", .import = "OpenProcessToken", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x9d\x2d\x0f\x11\x80\x85" } },
    .{ "OpenThreadToken", MethodRecord{ .library = "ADVAPI32", .import = "OpenThreadToken", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x9d\x2d\x11\x59\x0f\x11\x80\x85" } },
    .{ "SetPriorityClass", MethodRecord{ .library = "KERNEL32", .import = "SetPriorityClass", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xa3\xdd" } },
    .{ "GetPriorityClass", MethodRecord{ .library = "KERNEL32", .import = "GetPriorityClass", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "SetThreadStackGuarantee", MethodRecord{ .library = "KERNEL32", .import = "SetThreadStackGuarantee", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "GetProcessId", MethodRecord{ .library = "KERNEL32", .import = "GetProcessId", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "GetThreadId", MethodRecord{ .library = "KERNEL32", .import = "GetThreadId", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "FlushProcessWriteBuffers", MethodRecord{ .library = "KERNEL32", .import = "FlushProcessWriteBuffers", .signature = "\x00\x00\x01" } },
    .{ "GetProcessIdOfThread", MethodRecord{ .library = "KERNEL32", .import = "GetProcessIdOfThread", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "InitializeProcThreadAttributeList", MethodRecord{ .library = "KERNEL32", .import = "InitializeProcThreadAttributeList", .signature = "\x00\x04\x11\x59\x11\xa3\xed\x09\x09\x0f\x19" } },
    .{ "DeleteProcThreadAttributeList", MethodRecord{ .library = "KERNEL32", .import = "DeleteProcThreadAttributeList", .signature = "\x00\x01\x01\x11\xa3\xed" } },
    .{ "UpdateProcThreadAttribute", MethodRecord{ .library = "KERNEL32", .import = "UpdateProcThreadAttribute", .signature = "\x00\x07\x11\x59\x11\xa3\xed\x09\x19\x0f\x01\x19\x0f\x01\x0f\x19" } },
    .{ "SetProcessDynamicEHContinuationTargets", MethodRecord{ .library = "KERNEL32", .import = "SetProcessDynamicEHContinuationTargets", .signature = "\x00\x03\x11\x59\x11\x80\x85\x07\x0f\x11\xa3\xf1" } },
    .{ "SetProcessDynamicEnforcedCetCompatibleRanges", MethodRecord{ .library = "KERNEL32", .import = "SetProcessDynamicEnforcedCetCompatibleRanges", .signature = "\x00\x03\x11\x59\x11\x80\x85\x07\x0f\x11\xa3\xf5" } },
    .{ "SetProcessAffinityUpdateMode", MethodRecord{ .library = "KERNEL32", .import = "SetProcessAffinityUpdateMode", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xa3\x01" } },
    .{ "QueryProcessAffinityUpdateMode", MethodRecord{ .library = "KERNEL32", .import = "QueryProcessAffinityUpdateMode", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xa3\x01" } },
    .{ "CreateRemoteThreadEx", MethodRecord{ .library = "KERNEL32", .import = "CreateRemoteThreadEx", .signature = "\x00\x08\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x19\x12\x9f\x81\x0f\x01\x09\x11\xa3\xed\x0f\x09" } },
    .{ "GetCurrentThreadStackLimits", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentThreadStackLimits", .signature = "\x00\x02\x01\x0f\x19\x0f\x19" } },
    .{ "GetProcessMitigationPolicy", MethodRecord{ .library = "KERNEL32", .import = "GetProcessMitigationPolicy", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xa3\xf9\x0f\x01\x19" } },
    .{ "SetProcessMitigationPolicy", MethodRecord{ .library = "KERNEL32", .import = "SetProcessMitigationPolicy", .signature = "\x00\x03\x11\x59\x11\xa3\xf9\x0f\x01\x19" } },
    .{ "GetThreadTimes", MethodRecord{ .library = "KERNEL32", .import = "GetThreadTimes", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "OpenProcess", MethodRecord{ .library = "KERNEL32", .import = "OpenProcess", .signature = "\x00\x03\x11\x80\x85\x11\xa3\xfd\x11\x59\x09" } },
    .{ "IsProcessorFeaturePresent", MethodRecord{ .library = "KERNEL32", .import = "IsProcessorFeaturePresent", .signature = "\x00\x01\x11\x59\x11\xa3\x0d" } },
    .{ "GetProcessHandleCount", MethodRecord{ .library = "KERNEL32", .import = "GetProcessHandleCount", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "GetCurrentProcessorNumber", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentProcessorNumber", .signature = "\x00\x00\x09" } },
    .{ "SetThreadIdealProcessorEx", MethodRecord{ .library = "KERNEL32", .import = "SetThreadIdealProcessorEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xa4\x01\x0f\x11\xa4\x01" } },
    .{ "GetThreadIdealProcessorEx", MethodRecord{ .library = "KERNEL32", .import = "GetThreadIdealProcessorEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xa4\x01" } },
    .{ "GetCurrentProcessorNumberEx", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentProcessorNumberEx", .signature = "\x00\x01\x01\x0f\x11\xa4\x01" } },
    .{ "GetProcessPriorityBoost", MethodRecord{ .library = "KERNEL32", .import = "GetProcessPriorityBoost", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "SetProcessPriorityBoost", MethodRecord{ .library = "KERNEL32", .import = "SetProcessPriorityBoost", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x59" } },
    .{ "GetThreadIOPendingFlag", MethodRecord{ .library = "KERNEL32", .import = "GetThreadIOPendingFlag", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "GetSystemTimes", MethodRecord{ .library = "KERNEL32", .import = "GetSystemTimes", .signature = "\x00\x03\x11\x59\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "GetThreadInformation", MethodRecord{ .library = "KERNEL32", .import = "GetThreadInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xa4\x05\x0f\x01\x09" } },
    .{ "SetThreadInformation", MethodRecord{ .library = "KERNEL32", .import = "SetThreadInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xa4\x05\x0f\x01\x09" } },
    .{ "IsProcessCritical", MethodRecord{ .library = "KERNEL32", .import = "IsProcessCritical", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "SetProtectedPolicy", MethodRecord{ .library = "KERNEL32", .import = "SetProtectedPolicy", .signature = "\x00\x03\x11\x59\x0f\x11\x0d\x19\x0f\x19" } },
    .{ "QueryProtectedPolicy", MethodRecord{ .library = "KERNEL32", .import = "QueryProtectedPolicy", .signature = "\x00\x02\x11\x59\x0f\x11\x0d\x0f\x19" } },
    .{ "SetThreadIdealProcessor", MethodRecord{ .library = "KERNEL32", .import = "SetThreadIdealProcessor", .signature = "\x00\x02\x09\x11\x80\x85\x09" } },
    .{ "SetProcessInformation", MethodRecord{ .library = "KERNEL32", .import = "SetProcessInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xa4\x09\x0f\x01\x09" } },
    .{ "GetProcessInformation", MethodRecord{ .library = "KERNEL32", .import = "GetProcessInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xa4\x09\x0f\x01\x09" } },
    .{ "GetProcessDefaultCpuSets", MethodRecord{ .library = "KERNEL32", .import = "GetProcessDefaultCpuSets", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x09\x09\x0f\x09" } },
    .{ "SetProcessDefaultCpuSets", MethodRecord{ .library = "KERNEL32", .import = "SetProcessDefaultCpuSets", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x09\x09" } },
    .{ "GetThreadSelectedCpuSets", MethodRecord{ .library = "KERNEL32", .import = "GetThreadSelectedCpuSets", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x09\x09\x0f\x09" } },
    .{ "SetThreadSelectedCpuSets", MethodRecord{ .library = "KERNEL32", .import = "SetThreadSelectedCpuSets", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x09\x09" } },
    .{ "CreateProcessAsUserA", MethodRecord{ .library = "ADVAPI32", .import = "CreateProcessAsUserA", .signature = "\x00\x0b\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x0f\x11\x8b\xb5\x0f\x11\x8b\xb5\x11\x59\x11\xa3\xdd\x0f\x01\x11\x3d\x0f\x11\xa3\xe1\x0f\x11\xa3\xe5" } },
    .{ "GetProcessShutdownParameters", MethodRecord{ .library = "KERNEL32", .import = "GetProcessShutdownParameters", .signature = "\x00\x02\x11\x59\x0f\x09\x0f\x09" } },
    .{ "GetProcessDefaultCpuSetMasks", MethodRecord{ .library = "KERNEL32", .import = "GetProcessDefaultCpuSetMasks", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xa4\x0d\x07\x0f\x07" } },
    .{ "SetProcessDefaultCpuSetMasks", MethodRecord{ .library = "KERNEL32", .import = "SetProcessDefaultCpuSetMasks", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xa4\x0d\x07" } },
    .{ "GetThreadSelectedCpuSetMasks", MethodRecord{ .library = "KERNEL32", .import = "GetThreadSelectedCpuSetMasks", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xa4\x0d\x07\x0f\x07" } },
    .{ "SetThreadSelectedCpuSetMasks", MethodRecord{ .library = "KERNEL32", .import = "SetThreadSelectedCpuSetMasks", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xa4\x0d\x07" } },
    .{ "GetMachineTypeAttributes", MethodRecord{ .library = "KERNEL32", .import = "GetMachineTypeAttributes", .signature = "\x00\x02\x11\x79\x07\x0f\x11\xa4\x11" } },
    .{ "SetThreadDescription", MethodRecord{ .library = "KERNEL32", .import = "SetThreadDescription", .signature = "\x00\x02\x11\x79\x11\x80\x85\x11\x05" } },
    .{ "GetThreadDescription", MethodRecord{ .library = "KERNEL32", .import = "GetThreadDescription", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "TlsGetValue2", MethodRecord{ .library = "KERNEL32", .import = "TlsGetValue2", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "QueueUserWorkItem", MethodRecord{ .library = "KERNEL32", .import = "QueueUserWorkItem", .signature = "\x00\x03\x11\x59\x12\x9f\x81\x0f\x01\x11\xa2\xf5" } },
    .{ "UnregisterWaitEx", MethodRecord{ .library = "KERNEL32", .import = "UnregisterWaitEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "CreateTimerQueue", MethodRecord{ .library = "KERNEL32", .import = "CreateTimerQueue", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "CreateTimerQueueTimer", MethodRecord{ .library = "KERNEL32", .import = "CreateTimerQueueTimer", .signature = "\x00\x07\x11\x59\x0f\x11\x80\x85\x11\x80\x85\x12\xa4\x15\x0f\x01\x09\x09\x11\xa2\xf5" } },
    .{ "ChangeTimerQueueTimer", MethodRecord{ .library = "KERNEL32", .import = "ChangeTimerQueueTimer", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x80\x85\x09\x09" } },
    .{ "DeleteTimerQueueTimer", MethodRecord{ .library = "KERNEL32", .import = "DeleteTimerQueueTimer", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x80\x85\x11\x80\x85" } },
    .{ "DeleteTimerQueue", MethodRecord{ .library = "KERNEL32", .import = "DeleteTimerQueue", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "DeleteTimerQueueEx", MethodRecord{ .library = "KERNEL32", .import = "DeleteTimerQueueEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "CreateThreadpool", MethodRecord{ .library = "KERNEL32", .import = "CreateThreadpool", .signature = "\x00\x01\x11\xa4\x19\x0f\x01" } },
    .{ "SetThreadpoolThreadMaximum", MethodRecord{ .library = "KERNEL32", .import = "SetThreadpoolThreadMaximum", .signature = "\x00\x02\x01\x11\xa4\x19\x09" } },
    .{ "SetThreadpoolThreadMinimum", MethodRecord{ .library = "KERNEL32", .import = "SetThreadpoolThreadMinimum", .signature = "\x00\x02\x11\x59\x11\xa4\x19\x09" } },
    .{ "SetThreadpoolStackInformation", MethodRecord{ .library = "KERNEL32", .import = "SetThreadpoolStackInformation", .signature = "\x00\x02\x11\x59\x11\xa4\x19\x0f\x11\xa4\x1d" } },
    .{ "QueryThreadpoolStackInformation", MethodRecord{ .library = "KERNEL32", .import = "QueryThreadpoolStackInformation", .signature = "\x00\x02\x11\x59\x11\xa4\x19\x0f\x11\xa4\x1d" } },
    .{ "CloseThreadpool", MethodRecord{ .library = "KERNEL32", .import = "CloseThreadpool", .signature = "\x00\x01\x01\x11\xa4\x19" } },
    .{ "CreateThreadpoolCleanupGroup", MethodRecord{ .library = "KERNEL32", .import = "CreateThreadpoolCleanupGroup", .signature = "\x00\x00\x11\xa4\x21" } },
    .{ "CloseThreadpoolCleanupGroupMembers", MethodRecord{ .library = "KERNEL32", .import = "CloseThreadpoolCleanupGroupMembers", .signature = "\x00\x03\x01\x11\xa4\x21\x11\x59\x0f\x01" } },
    .{ "CloseThreadpoolCleanupGroup", MethodRecord{ .library = "KERNEL32", .import = "CloseThreadpoolCleanupGroup", .signature = "\x00\x01\x01\x11\xa4\x21" } },
    .{ "SetEventWhenCallbackReturns", MethodRecord{ .library = "KERNEL32", .import = "SetEventWhenCallbackReturns", .signature = "\x00\x02\x01\x11\xa4\x25\x11\x80\x85" } },
    .{ "ReleaseSemaphoreWhenCallbackReturns", MethodRecord{ .library = "KERNEL32", .import = "ReleaseSemaphoreWhenCallbackReturns", .signature = "\x00\x03\x01\x11\xa4\x25\x11\x80\x85\x09" } },
    .{ "ReleaseMutexWhenCallbackReturns", MethodRecord{ .library = "KERNEL32", .import = "ReleaseMutexWhenCallbackReturns", .signature = "\x00\x02\x01\x11\xa4\x25\x11\x80\x85" } },
    .{ "LeaveCriticalSectionWhenCallbackReturns", MethodRecord{ .library = "KERNEL32", .import = "LeaveCriticalSectionWhenCallbackReturns", .signature = "\x00\x02\x01\x11\xa4\x25\x0f\x11\xa3\xbd" } },
    .{ "FreeLibraryWhenCallbackReturns", MethodRecord{ .library = "KERNEL32", .import = "FreeLibraryWhenCallbackReturns", .signature = "\x00\x02\x01\x11\xa4\x25\x11\x81\x81" } },
    .{ "CallbackMayRunLong", MethodRecord{ .library = "KERNEL32", .import = "CallbackMayRunLong", .signature = "\x00\x01\x11\x59\x11\xa4\x25" } },
    .{ "DisassociateCurrentThreadFromCallback", MethodRecord{ .library = "KERNEL32", .import = "DisassociateCurrentThreadFromCallback", .signature = "\x00\x01\x01\x11\xa4\x25" } },
    .{ "TrySubmitThreadpoolCallback", MethodRecord{ .library = "KERNEL32", .import = "TrySubmitThreadpoolCallback", .signature = "\x00\x03\x11\x59\x12\xa4\x29\x0f\x01\x0f\x11\xa4\x2d" } },
    .{ "CreateThreadpoolWork", MethodRecord{ .library = "KERNEL32", .import = "CreateThreadpoolWork", .signature = "\x00\x03\x11\xa4\x31\x12\xa4\x35\x0f\x01\x0f\x11\xa4\x2d" } },
    .{ "SubmitThreadpoolWork", MethodRecord{ .library = "KERNEL32", .import = "SubmitThreadpoolWork", .signature = "\x00\x01\x01\x11\xa4\x31" } },
    .{ "WaitForThreadpoolWorkCallbacks", MethodRecord{ .library = "KERNEL32", .import = "WaitForThreadpoolWorkCallbacks", .signature = "\x00\x02\x01\x11\xa4\x31\x11\x59" } },
    .{ "CloseThreadpoolWork", MethodRecord{ .library = "KERNEL32", .import = "CloseThreadpoolWork", .signature = "\x00\x01\x01\x11\xa4\x31" } },
    .{ "CreateThreadpoolTimer", MethodRecord{ .library = "KERNEL32", .import = "CreateThreadpoolTimer", .signature = "\x00\x03\x11\xa4\x39\x12\xa4\x3d\x0f\x01\x0f\x11\xa4\x2d" } },
    .{ "SetThreadpoolTimer", MethodRecord{ .library = "KERNEL32", .import = "SetThreadpoolTimer", .signature = "\x00\x04\x01\x11\xa4\x39\x0f\x11\x80\x9d\x09\x09" } },
    .{ "IsThreadpoolTimerSet", MethodRecord{ .library = "KERNEL32", .import = "IsThreadpoolTimerSet", .signature = "\x00\x01\x11\x59\x11\xa4\x39" } },
    .{ "WaitForThreadpoolTimerCallbacks", MethodRecord{ .library = "KERNEL32", .import = "WaitForThreadpoolTimerCallbacks", .signature = "\x00\x02\x01\x11\xa4\x39\x11\x59" } },
    .{ "CloseThreadpoolTimer", MethodRecord{ .library = "KERNEL32", .import = "CloseThreadpoolTimer", .signature = "\x00\x01\x01\x11\xa4\x39" } },
    .{ "CreateThreadpoolWait", MethodRecord{ .library = "KERNEL32", .import = "CreateThreadpoolWait", .signature = "\x00\x03\x11\xa4\x41\x12\xa4\x45\x0f\x01\x0f\x11\xa4\x2d" } },
    .{ "SetThreadpoolWait", MethodRecord{ .library = "KERNEL32", .import = "SetThreadpoolWait", .signature = "\x00\x03\x01\x11\xa4\x41\x11\x80\x85\x0f\x11\x80\x9d" } },
    .{ "WaitForThreadpoolWaitCallbacks", MethodRecord{ .library = "KERNEL32", .import = "WaitForThreadpoolWaitCallbacks", .signature = "\x00\x02\x01\x11\xa4\x41\x11\x59" } },
    .{ "CloseThreadpoolWait", MethodRecord{ .library = "KERNEL32", .import = "CloseThreadpoolWait", .signature = "\x00\x01\x01\x11\xa4\x41" } },
    .{ "CreateThreadpoolIo", MethodRecord{ .library = "KERNEL32", .import = "CreateThreadpoolIo", .signature = "\x00\x04\x11\xa4\x49\x11\x80\x85\x12\xa4\x4d\x0f\x01\x0f\x11\xa4\x2d" } },
    .{ "StartThreadpoolIo", MethodRecord{ .library = "KERNEL32", .import = "StartThreadpoolIo", .signature = "\x00\x01\x01\x11\xa4\x49" } },
    .{ "CancelThreadpoolIo", MethodRecord{ .library = "KERNEL32", .import = "CancelThreadpoolIo", .signature = "\x00\x01\x01\x11\xa4\x49" } },
    .{ "WaitForThreadpoolIoCallbacks", MethodRecord{ .library = "KERNEL32", .import = "WaitForThreadpoolIoCallbacks", .signature = "\x00\x02\x01\x11\xa4\x49\x11\x59" } },
    .{ "CloseThreadpoolIo", MethodRecord{ .library = "KERNEL32", .import = "CloseThreadpoolIo", .signature = "\x00\x01\x01\x11\xa4\x49" } },
    .{ "SetThreadpoolTimerEx", MethodRecord{ .library = "KERNEL32", .import = "SetThreadpoolTimerEx", .signature = "\x00\x04\x11\x59\x11\xa4\x39\x0f\x11\x80\x9d\x09\x09" } },
    .{ "SetThreadpoolWaitEx", MethodRecord{ .library = "KERNEL32", .import = "SetThreadpoolWaitEx", .signature = "\x00\x04\x11\x59\x11\xa4\x41\x11\x80\x85\x0f\x11\x80\x9d\x0f\x01" } },
    .{ "IsWow64Process", MethodRecord{ .library = "KERNEL32", .import = "IsWow64Process", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "Wow64SetThreadDefaultGuestMachine", MethodRecord{ .library = "api-ms-win-core-wow64-l1-1-1", .import = "Wow64SetThreadDefaultGuestMachine", .signature = "\x00\x01\x07\x07" } },
    .{ "IsWow64Process2", MethodRecord{ .library = "KERNEL32", .import = "IsWow64Process2", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xa2\xa1\x0f\x11\xa2\xa1" } },
    .{ "Wow64SuspendThread", MethodRecord{ .library = "KERNEL32", .import = "Wow64SuspendThread", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "CreatePrivateNamespaceW", MethodRecord{ .library = "KERNEL32", .import = "CreatePrivateNamespaceW", .signature = "\x00\x03\x11\x80\x85\x0f\x11\x8b\xb5\x0f\x01\x11\x05" } },
    .{ "OpenPrivateNamespaceW", MethodRecord{ .library = "KERNEL32", .import = "OpenPrivateNamespaceW", .signature = "\x00\x02\x11\x80\x85\x0f\x01\x11\x05" } },
    .{ "ClosePrivateNamespace", MethodRecord{ .library = "KERNEL32", .import = "ClosePrivateNamespace", .signature = "\x00\x02\x11\x87\x79\x11\x80\x85\x09" } },
    .{ "CreateBoundaryDescriptorW", MethodRecord{ .library = "KERNEL32", .import = "CreateBoundaryDescriptorW", .signature = "\x00\x02\x11\x80\x85\x11\x05\x09" } },
    .{ "AddSIDToBoundaryDescriptor", MethodRecord{ .library = "KERNEL32", .import = "AddSIDToBoundaryDescriptor", .signature = "\x00\x02\x11\x59\x0f\x11\x80\x85\x11\x81\x15" } },
    .{ "DeleteBoundaryDescriptor", MethodRecord{ .library = "KERNEL32", .import = "DeleteBoundaryDescriptor", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "GetNumaHighestNodeNumber", MethodRecord{ .library = "KERNEL32", .import = "GetNumaHighestNodeNumber", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "GetNumaNodeProcessorMaskEx", MethodRecord{ .library = "KERNEL32", .import = "GetNumaNodeProcessorMaskEx", .signature = "\x00\x02\x11\x59\x07\x0f\x11\xa4\x0d" } },
    .{ "GetNumaNodeProcessorMask2", MethodRecord{ .library = "KERNEL32", .import = "GetNumaNodeProcessorMask2", .signature = "\x00\x04\x11\x59\x07\x0f\x11\xa4\x0d\x07\x0f\x07" } },
    .{ "GetNumaProximityNodeEx", MethodRecord{ .library = "KERNEL32", .import = "GetNumaProximityNodeEx", .signature = "\x00\x02\x11\x59\x09\x0f\x07" } },
    .{ "GetProcessGroupAffinity", MethodRecord{ .library = "KERNEL32", .import = "GetProcessGroupAffinity", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x07\x0f\x07" } },
    .{ "GetThreadGroupAffinity", MethodRecord{ .library = "KERNEL32", .import = "GetThreadGroupAffinity", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xa4\x0d" } },
    .{ "SetThreadGroupAffinity", MethodRecord{ .library = "KERNEL32", .import = "SetThreadGroupAffinity", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xa4\x0d\x0f\x11\xa4\x0d" } },
    .{ "AvSetMmThreadCharacteristicsA", MethodRecord{ .library = "AVRT", .import = "AvSetMmThreadCharacteristicsA", .signature = "\x00\x02\x11\xa4\x51\x11\x3d\x0f\x09" } },
    .{ "AvSetMmThreadCharacteristicsW", MethodRecord{ .library = "AVRT", .import = "AvSetMmThreadCharacteristicsW", .signature = "\x00\x02\x11\xa4\x51\x11\x05\x0f\x09" } },
    .{ "AvSetMmMaxThreadCharacteristicsA", MethodRecord{ .library = "AVRT", .import = "AvSetMmMaxThreadCharacteristicsA", .signature = "\x00\x03\x11\xa4\x51\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "AvSetMmMaxThreadCharacteristicsW", MethodRecord{ .library = "AVRT", .import = "AvSetMmMaxThreadCharacteristicsW", .signature = "\x00\x03\x11\xa4\x51\x11\x05\x11\x05\x0f\x09" } },
    .{ "AvRevertMmThreadCharacteristics", MethodRecord{ .library = "AVRT", .import = "AvRevertMmThreadCharacteristics", .signature = "\x00\x01\x11\x59\x11\xa4\x51" } },
    .{ "AvSetMmThreadPriority", MethodRecord{ .library = "AVRT", .import = "AvSetMmThreadPriority", .signature = "\x00\x02\x11\x59\x11\xa4\x51\x11\xa4\x55" } },
    .{ "AvRtCreateThreadOrderingGroup", MethodRecord{ .library = "AVRT", .import = "AvRtCreateThreadOrderingGroup", .signature = "\x00\x04\x11\x59\x0f\x11\xa4\x59\x0f\x0a\x0f\x11\x0d\x0f\x0a" } },
    .{ "AvRtCreateThreadOrderingGroupExA", MethodRecord{ .library = "AVRT", .import = "AvRtCreateThreadOrderingGroupExA", .signature = "\x00\x05\x11\x59\x0f\x11\xa4\x59\x0f\x0a\x0f\x11\x0d\x0f\x0a\x11\x3d" } },
    .{ "AvRtCreateThreadOrderingGroupExW", MethodRecord{ .library = "AVRT", .import = "AvRtCreateThreadOrderingGroupExW", .signature = "\x00\x05\x11\x59\x0f\x11\xa4\x59\x0f\x0a\x0f\x11\x0d\x0f\x0a\x11\x05" } },
    .{ "AvRtJoinThreadOrderingGroup", MethodRecord{ .library = "AVRT", .import = "AvRtJoinThreadOrderingGroup", .signature = "\x00\x03\x11\x59\x0f\x11\xa4\x59\x0f\x11\x0d\x11\x59" } },
    .{ "AvRtWaitOnThreadOrderingGroup", MethodRecord{ .library = "AVRT", .import = "AvRtWaitOnThreadOrderingGroup", .signature = "\x00\x01\x11\x59\x11\xa4\x59" } },
    .{ "AvRtLeaveThreadOrderingGroup", MethodRecord{ .library = "AVRT", .import = "AvRtLeaveThreadOrderingGroup", .signature = "\x00\x01\x11\x59\x11\xa4\x59" } },
    .{ "AvRtDeleteThreadOrderingGroup", MethodRecord{ .library = "AVRT", .import = "AvRtDeleteThreadOrderingGroup", .signature = "\x00\x01\x11\x59\x11\xa4\x59" } },
    .{ "AvQuerySystemResponsiveness", MethodRecord{ .library = "AVRT", .import = "AvQuerySystemResponsiveness", .signature = "\x00\x02\x11\x59\x11\xa4\x51\x0f\x09" } },
    .{ "RtwqStartup", MethodRecord{ .library = "RTWorkQ", .import = "RtwqStartup", .signature = "\x00\x00\x11\x79" } },
    .{ "RtwqShutdown", MethodRecord{ .library = "RTWorkQ", .import = "RtwqShutdown", .signature = "\x00\x00\x11\x79" } },
    .{ "RtwqLockWorkQueue", MethodRecord{ .library = "RTWorkQ", .import = "RtwqLockWorkQueue", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "RtwqUnlockWorkQueue", MethodRecord{ .library = "RTWorkQ", .import = "RtwqUnlockWorkQueue", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "RtwqLockSharedWorkQueue", MethodRecord{ .library = "RTWorkQ", .import = "RtwqLockSharedWorkQueue", .signature = "\x00\x04\x11\x79\x11\x05\x08\x0f\x09\x0f\x09" } },
    .{ "RtwqJoinWorkQueue", MethodRecord{ .library = "RTWorkQ", .import = "RtwqJoinWorkQueue", .signature = "\x00\x03\x11\x79\x09\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "RtwqUnjoinWorkQueue", MethodRecord{ .library = "RTWorkQ", .import = "RtwqUnjoinWorkQueue", .signature = "\x00\x02\x11\x79\x09\x11\x80\x85" } },
    .{ "RtwqCreateAsyncResult", MethodRecord{ .library = "RTWorkQ", .import = "RtwqCreateAsyncResult", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x12\xa4\x5d\x12\x82\xb1\x0f\x12\xa4\x61" } },
    .{ "RtwqInvokeCallback", MethodRecord{ .library = "RTWorkQ", .import = "RtwqInvokeCallback", .signature = "\x00\x01\x11\x79\x12\xa4\x61" } },
    .{ "RtwqLockPlatform", MethodRecord{ .library = "RTWorkQ", .import = "RtwqLockPlatform", .signature = "\x00\x00\x11\x79" } },
    .{ "RtwqUnlockPlatform", MethodRecord{ .library = "RTWorkQ", .import = "RtwqUnlockPlatform", .signature = "\x00\x00\x11\x79" } },
    .{ "RtwqRegisterPlatformWithMMCSS", MethodRecord{ .library = "RTWorkQ", .import = "RtwqRegisterPlatformWithMMCSS", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x09\x08" } },
    .{ "RtwqUnregisterPlatformFromMMCSS", MethodRecord{ .library = "RTWorkQ", .import = "RtwqUnregisterPlatformFromMMCSS", .signature = "\x00\x00\x11\x79" } },
    .{ "RtwqPutWorkItem", MethodRecord{ .library = "RTWorkQ", .import = "RtwqPutWorkItem", .signature = "\x00\x03\x11\x79\x09\x08\x12\xa4\x61" } },
    .{ "RtwqPutWaitingWorkItem", MethodRecord{ .library = "RTWorkQ", .import = "RtwqPutWaitingWorkItem", .signature = "\x00\x04\x11\x79\x11\x80\x85\x08\x12\xa4\x61\x0f\x0b" } },
    .{ "RtwqAllocateSerialWorkQueue", MethodRecord{ .library = "RTWorkQ", .import = "RtwqAllocateSerialWorkQueue", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "RtwqScheduleWorkItem", MethodRecord{ .library = "RTWorkQ", .import = "RtwqScheduleWorkItem", .signature = "\x00\x03\x11\x79\x12\xa4\x61\x0a\x0f\x0b" } },
    .{ "RtwqAddPeriodicCallback", MethodRecord{ .library = "RTWorkQ", .import = "RtwqAddPeriodicCallback", .signature = "\x00\x03\x11\x79\x12\xa4\x65\x12\x82\xb1\x0f\x09" } },
    .{ "RtwqRemovePeriodicCallback", MethodRecord{ .library = "RTWorkQ", .import = "RtwqRemovePeriodicCallback", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "RtwqCancelWorkItem", MethodRecord{ .library = "RTWorkQ", .import = "RtwqCancelWorkItem", .signature = "\x00\x01\x11\x79\x0b" } },
    .{ "RtwqAllocateWorkQueue", MethodRecord{ .library = "RTWorkQ", .import = "RtwqAllocateWorkQueue", .signature = "\x00\x02\x11\x79\x11\xa4\x69\x0f\x09" } },
    .{ "RtwqBeginRegisterWorkQueueWithMMCSS", MethodRecord{ .library = "RTWorkQ", .import = "RtwqBeginRegisterWorkQueueWithMMCSS", .signature = "\x00\x06\x11\x79\x09\x11\x05\x09\x08\x12\xa4\x5d\x12\x82\xb1" } },
    .{ "RtwqBeginUnregisterWorkQueueWithMMCSS", MethodRecord{ .library = "RTWorkQ", .import = "RtwqBeginUnregisterWorkQueueWithMMCSS", .signature = "\x00\x03\x11\x79\x09\x12\xa4\x5d\x12\x82\xb1" } },
    .{ "RtwqEndRegisterWorkQueueWithMMCSS", MethodRecord{ .library = "RTWorkQ", .import = "RtwqEndRegisterWorkQueueWithMMCSS", .signature = "\x00\x02\x11\x79\x12\xa4\x61\x0f\x09" } },
    .{ "RtwqGetWorkQueueMMCSSClass", MethodRecord{ .library = "RTWorkQ", .import = "RtwqGetWorkQueueMMCSSClass", .signature = "\x00\x03\x11\x79\x09\x11\x05\x0f\x09" } },
    .{ "RtwqGetWorkQueueMMCSSTaskId", MethodRecord{ .library = "RTWorkQ", .import = "RtwqGetWorkQueueMMCSSTaskId", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "RtwqGetWorkQueueMMCSSPriority", MethodRecord{ .library = "RTWorkQ", .import = "RtwqGetWorkQueueMMCSSPriority", .signature = "\x00\x02\x11\x79\x09\x0f\x08" } },
    .{ "RtwqRegisterPlatformEvents", MethodRecord{ .library = "RTWorkQ", .import = "RtwqRegisterPlatformEvents", .signature = "\x00\x01\x11\x79\x12\xa4\x6d" } },
    .{ "RtwqUnregisterPlatformEvents", MethodRecord{ .library = "RTWorkQ", .import = "RtwqUnregisterPlatformEvents", .signature = "\x00\x01\x11\x79\x12\xa4\x6d" } },
    .{ "RtwqSetLongRunning", MethodRecord{ .library = "RTWorkQ", .import = "RtwqSetLongRunning", .signature = "\x00\x02\x11\x79\x09\x11\x59" } },
    .{ "RtwqSetDeadline", MethodRecord{ .library = "RTWorkQ", .import = "RtwqSetDeadline", .signature = "\x00\x03\x11\x79\x09\x0a\x0f\x11\x80\x85" } },
    .{ "RtwqSetDeadline2", MethodRecord{ .library = "RTWorkQ", .import = "RtwqSetDeadline2", .signature = "\x00\x04\x11\x79\x09\x0a\x0a\x0f\x11\x80\x85" } },
    .{ "RtwqCancelDeadline", MethodRecord{ .library = "RTWorkQ", .import = "RtwqCancelDeadline", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "GetProcessHandleFromHwnd", MethodRecord{ .library = "OLEACC", .import = "GetProcessHandleFromHwnd", .signature = "\x00\x01\x11\x80\x85\x11\x25" } },
    .{ "AttachThreadInput", MethodRecord{ .library = "USER32", .import = "AttachThreadInput", .signature = "\x00\x03\x11\x59\x09\x09\x11\x59" } },
    .{ "WaitForInputIdle", MethodRecord{ .library = "USER32", .import = "WaitForInputIdle", .signature = "\x00\x02\x09\x11\x80\x85\x09" } },
    .{ "GetGuiResources", MethodRecord{ .library = "USER32", .import = "GetGuiResources", .signature = "\x00\x02\x09\x11\x80\x85\x11\xa3\x11" } },
    .{ "IsImmersiveProcess", MethodRecord{ .library = "USER32", .import = "IsImmersiveProcess", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetProcessRestrictionExemption", MethodRecord{ .library = "USER32", .import = "SetProcessRestrictionExemption", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "GetProcessAffinityMask", MethodRecord{ .library = "KERNEL32", .import = "GetProcessAffinityMask", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x19\x0f\x19" } },
    .{ "SetProcessAffinityMask", MethodRecord{ .library = "KERNEL32", .import = "SetProcessAffinityMask", .signature = "\x00\x02\x11\x59\x11\x80\x85\x19" } },
    .{ "GetProcessIoCounters", MethodRecord{ .library = "KERNEL32", .import = "GetProcessIoCounters", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xa4\x71" } },
    .{ "SwitchToFiber", MethodRecord{ .library = "KERNEL32", .import = "SwitchToFiber", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "DeleteFiber", MethodRecord{ .library = "KERNEL32", .import = "DeleteFiber", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "ConvertFiberToThread", MethodRecord{ .library = "KERNEL32", .import = "ConvertFiberToThread", .signature = "\x00\x00\x11\x59" } },
    .{ "CreateFiberEx", MethodRecord{ .library = "KERNEL32", .import = "CreateFiberEx", .signature = "\x00\x05\x0f\x01\x19\x19\x09\x12\xa4\x75\x0f\x01" } },
    .{ "ConvertThreadToFiberEx", MethodRecord{ .library = "KERNEL32", .import = "ConvertThreadToFiberEx", .signature = "\x00\x02\x0f\x01\x0f\x01\x09" } },
    .{ "CreateFiber", MethodRecord{ .library = "KERNEL32", .import = "CreateFiber", .signature = "\x00\x03\x0f\x01\x19\x12\xa4\x75\x0f\x01" } },
    .{ "ConvertThreadToFiber", MethodRecord{ .library = "KERNEL32", .import = "ConvertThreadToFiber", .signature = "\x00\x01\x0f\x01\x0f\x01" } },
    .{ "CreateUmsCompletionList", MethodRecord{ .library = "KERNEL32", .import = "CreateUmsCompletionList", .signature = "\x00\x01\x11\x59\x0f\x0f\x01" } },
    .{ "DequeueUmsCompletionListItems", MethodRecord{ .library = "KERNEL32", .import = "DequeueUmsCompletionListItems", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x0f\x0f\x01" } },
    .{ "GetUmsCompletionListEvent", MethodRecord{ .library = "KERNEL32", .import = "GetUmsCompletionListEvent", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x11\x80\x85" } },
    .{ "ExecuteUmsThread", MethodRecord{ .library = "KERNEL32", .import = "ExecuteUmsThread", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "UmsThreadYield", MethodRecord{ .library = "KERNEL32", .import = "UmsThreadYield", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "DeleteUmsCompletionList", MethodRecord{ .library = "KERNEL32", .import = "DeleteUmsCompletionList", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "GetCurrentUmsThread", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentUmsThread", .signature = "\x00\x00\x0f\x01" } },
    .{ "GetNextUmsListItem", MethodRecord{ .library = "KERNEL32", .import = "GetNextUmsListItem", .signature = "\x00\x01\x0f\x01\x0f\x01" } },
    .{ "QueryUmsThreadInformation", MethodRecord{ .library = "KERNEL32", .import = "QueryUmsThreadInformation", .signature = "\x00\x05\x11\x59\x0f\x01\x11\xa4\x79\x0f\x01\x09\x0f\x09" } },
    .{ "SetUmsThreadInformation", MethodRecord{ .library = "KERNEL32", .import = "SetUmsThreadInformation", .signature = "\x00\x04\x11\x59\x0f\x01\x11\xa4\x79\x0f\x01\x09" } },
    .{ "DeleteUmsThreadContext", MethodRecord{ .library = "KERNEL32", .import = "DeleteUmsThreadContext", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "CreateUmsThreadContext", MethodRecord{ .library = "KERNEL32", .import = "CreateUmsThreadContext", .signature = "\x00\x01\x11\x59\x0f\x0f\x01" } },
    .{ "EnterUmsSchedulingMode", MethodRecord{ .library = "KERNEL32", .import = "EnterUmsSchedulingMode", .signature = "\x00\x01\x11\x59\x0f\x11\xa4\x7d" } },
    .{ "GetUmsSystemThreadInformation", MethodRecord{ .library = "KERNEL32", .import = "GetUmsSystemThreadInformation", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xa4\x81" } },
    .{ "SetThreadAffinityMask", MethodRecord{ .library = "KERNEL32", .import = "SetThreadAffinityMask", .signature = "\x00\x02\x19\x11\x80\x85\x19" } },
    .{ "SetProcessDEPPolicy", MethodRecord{ .library = "KERNEL32", .import = "SetProcessDEPPolicy", .signature = "\x00\x01\x11\x59\x11\xa3\x05" } },
    .{ "GetProcessDEPPolicy", MethodRecord{ .library = "KERNEL32", .import = "GetProcessDEPPolicy", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x09\x0f\x11\x59" } },
    .{ "PulseEvent", MethodRecord{ .library = "KERNEL32", .import = "PulseEvent", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "WinExec", MethodRecord{ .library = "KERNEL32", .import = "WinExec", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "SignalObjectAndWait", MethodRecord{ .library = "KERNEL32", .import = "SignalObjectAndWait", .signature = "\x00\x04\x11\x8d\x15\x11\x80\x85\x11\x80\x85\x09\x11\x59" } },
    .{ "CreateSemaphoreA", MethodRecord{ .library = "KERNEL32", .import = "CreateSemaphoreA", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x08\x08\x11\x3d" } },
    .{ "CreateWaitableTimerA", MethodRecord{ .library = "KERNEL32", .import = "CreateWaitableTimerA", .signature = "\x00\x03\x11\x80\x85\x0f\x11\x8b\xb5\x11\x59\x11\x3d" } },
    .{ "OpenWaitableTimerA", MethodRecord{ .library = "KERNEL32", .import = "OpenWaitableTimerA", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x3d" } },
    .{ "CreateSemaphoreExA", MethodRecord{ .library = "KERNEL32", .import = "CreateSemaphoreExA", .signature = "\x00\x06\x11\x80\x85\x0f\x11\x8b\xb5\x08\x08\x11\x3d\x09\x09" } },
    .{ "CreateWaitableTimerExA", MethodRecord{ .library = "KERNEL32", .import = "CreateWaitableTimerExA", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x3d\x09\x09" } },
    .{ "QueryFullProcessImageNameA", MethodRecord{ .library = "KERNEL32", .import = "QueryFullProcessImageNameA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xa3\x09\x11\x3d\x0f\x09" } },
    .{ "QueryFullProcessImageNameW", MethodRecord{ .library = "KERNEL32", .import = "QueryFullProcessImageNameW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xa3\x09\x11\x05\x0f\x09" } },
    .{ "GetStartupInfoA", MethodRecord{ .library = "KERNEL32", .import = "GetStartupInfoA", .signature = "\x00\x01\x01\x0f\x11\xa3\xe1" } },
    .{ "CreateProcessWithLogonW", MethodRecord{ .library = "ADVAPI32", .import = "CreateProcessWithLogonW", .signature = "\x00\x0b\x11\x59\x11\x05\x11\x05\x11\x05\x11\xa2\xfd\x11\x05\x11\x05\x11\xa3\xdd\x0f\x01\x11\x05\x0f\x11\xa3\xe9\x0f\x11\xa3\xe5" } },
    .{ "CreateProcessWithTokenW", MethodRecord{ .library = "ADVAPI32", .import = "CreateProcessWithTokenW", .signature = "\x00\x09\x11\x59\x11\x80\x85\x11\xa2\xfd\x11\x05\x11\x05\x11\xa3\xdd\x0f\x01\x11\x05\x0f\x11\xa3\xe9\x0f\x11\xa3\xe5" } },
    .{ "RegisterWaitForSingleObject", MethodRecord{ .library = "KERNEL32", .import = "RegisterWaitForSingleObject", .signature = "\x00\x06\x11\x59\x0f\x11\x80\x85\x11\x80\x85\x12\xa4\x15\x0f\x01\x09\x11\xa2\xf5" } },
    .{ "UnregisterWait", MethodRecord{ .library = "KERNEL32", .import = "UnregisterWait", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetTimerQueueTimer", MethodRecord{ .library = "KERNEL32", .import = "SetTimerQueueTimer", .signature = "\x00\x06\x11\x80\x85\x11\x80\x85\x12\xa4\x15\x0f\x01\x09\x09\x11\x59" } },
    .{ "CancelTimerQueueTimer", MethodRecord{ .library = "KERNEL32", .import = "CancelTimerQueueTimer", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "CreatePrivateNamespaceA", MethodRecord{ .library = "KERNEL32", .import = "CreatePrivateNamespaceA", .signature = "\x00\x03\x11\x80\x85\x0f\x11\x8b\xb5\x0f\x01\x11\x3d" } },
    .{ "OpenPrivateNamespaceA", MethodRecord{ .library = "KERNEL32", .import = "OpenPrivateNamespaceA", .signature = "\x00\x02\x11\x80\x85\x0f\x01\x11\x3d" } },
    .{ "CreateBoundaryDescriptorA", MethodRecord{ .library = "KERNEL32", .import = "CreateBoundaryDescriptorA", .signature = "\x00\x02\x11\x80\x85\x11\x3d\x09" } },
    .{ "AddIntegrityLabelToBoundaryDescriptor", MethodRecord{ .library = "KERNEL32", .import = "AddIntegrityLabelToBoundaryDescriptor", .signature = "\x00\x02\x11\x59\x0f\x11\x80\x85\x11\x81\x15" } },
    .{ "GetActiveProcessorGroupCount", MethodRecord{ .library = "KERNEL32", .import = "GetActiveProcessorGroupCount", .signature = "\x00\x00\x07" } },
    .{ "GetMaximumProcessorGroupCount", MethodRecord{ .library = "KERNEL32", .import = "GetMaximumProcessorGroupCount", .signature = "\x00\x00\x07" } },
    .{ "GetActiveProcessorCount", MethodRecord{ .library = "KERNEL32", .import = "GetActiveProcessorCount", .signature = "\x00\x01\x09\x07" } },
    .{ "GetMaximumProcessorCount", MethodRecord{ .library = "KERNEL32", .import = "GetMaximumProcessorCount", .signature = "\x00\x01\x09\x07" } },
    .{ "GetNumaProcessorNode", MethodRecord{ .library = "KERNEL32", .import = "GetNumaProcessorNode", .signature = "\x00\x02\x11\x59\x05\x0f\x05" } },
    .{ "GetNumaNodeNumberFromHandle", MethodRecord{ .library = "KERNEL32", .import = "GetNumaNodeNumberFromHandle", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x07" } },
    .{ "GetNumaProcessorNodeEx", MethodRecord{ .library = "KERNEL32", .import = "GetNumaProcessorNodeEx", .signature = "\x00\x02\x11\x59\x0f\x11\xa4\x01\x0f\x07" } },
    .{ "GetNumaNodeProcessorMask", MethodRecord{ .library = "KERNEL32", .import = "GetNumaNodeProcessorMask", .signature = "\x00\x02\x11\x59\x05\x0f\x0b" } },
    .{ "GetNumaAvailableMemoryNode", MethodRecord{ .library = "KERNEL32", .import = "GetNumaAvailableMemoryNode", .signature = "\x00\x02\x11\x59\x05\x0f\x0b" } },
    .{ "GetNumaAvailableMemoryNodeEx", MethodRecord{ .library = "KERNEL32", .import = "GetNumaAvailableMemoryNodeEx", .signature = "\x00\x02\x11\x59\x07\x0f\x0b" } },
    .{ "GetNumaProximityNode", MethodRecord{ .library = "KERNEL32", .import = "GetNumaProximityNode", .signature = "\x00\x02\x11\x59\x09\x0f\x05" } },
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
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xd15 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WAIT_EVENT" },
        0x14a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Kernel", .name = "SLIST_ENTRY" },
        0x1d2d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_ACCESS_MASK" },
        0x1f81 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "LPTHREAD_START_ROUTINE" },
        0x22a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "IMAGE_FILE_MACHINE" },
        0x22ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "THREAD_CREATION_FLAGS" },
        0x22f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "THREAD_PRIORITY" },
        0x22f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "WORKER_THREAD_FLAGS" },
        0x22f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "CREATE_EVENT" },
        0x22fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "CREATE_PROCESS_LOGON_FLAGS" },
        0x2301 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_AFFINITY_AUTO_UPDATE_FLAGS" },
        0x2305 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_DEP_FLAGS" },
        0x2309 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_NAME_FORMAT" },
        0x230d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESSOR_FEATURE_ID" },
        0x2311 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "GET_GUI_RESOURCES_FLAGS" },
        0x2325 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "THREAD_ACCESS_RIGHTS" },
        0x2329 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "SYNCHRONIZATION_ACCESS_RIGHTS" },
        0x23ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "CONDITION_VARIABLE" },
        0x23b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "SRWLOCK" },
        0x23b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "INIT_ONCE" },
        0x23b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PFLS_CALLBACK_FUNCTION" },
        0x23bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "CRITICAL_SECTION" },
        0x23c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PINIT_ONCE_FN" },
        0x23c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTIMERAPCROUTINE" },
        0x23c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "REASON_CONTEXT" },
        0x23cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "SYNCHRONIZATION_BARRIER" },
        0x23d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Kernel", .name = "SLIST_HEADER" },
        0x23d5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PAPCFUNC" },
        0x23d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "QUEUE_USER_APC_FLAGS" },
        0x23dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_CREATION_FLAGS" },
        0x23e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "STARTUPINFOA" },
        0x23e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_INFORMATION" },
        0x23e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "STARTUPINFOW" },
        0x23ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "LPPROC_THREAD_ATTRIBUTE_LIST" },
        0x23f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_DYNAMIC_EH_CONTINUATION_TARGET" },
        0x23f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE" },
        0x23f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_MITIGATION_POLICY" },
        0x23fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_ACCESS_RIGHTS" },
        0x2401 => TypeRefEntry{ .namespace = "Windows.Win32.System.Kernel", .name = "PROCESSOR_NUMBER" },
        0x2405 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "THREAD_INFORMATION_CLASS" },
        0x2409 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_INFORMATION_CLASS" },
        0x240d => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "GROUP_AFFINITY" },
        0x2411 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "MACHINE_ATTRIBUTES" },
        0x2415 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "WAITORTIMERCALLBACK" },
        0x2419 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_POOL" },
        0x241d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "TP_POOL_STACK_INFORMATION" },
        0x2421 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_CLEANUP_GROUP" },
        0x2425 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_CALLBACK_INSTANCE" },
        0x2429 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_SIMPLE_CALLBACK" },
        0x242d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "TP_CALLBACK_ENVIRON_V3" },
        0x2431 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_WORK" },
        0x2435 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_WORK_CALLBACK" },
        0x2439 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_TIMER" },
        0x243d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_TIMER_CALLBACK" },
        0x2441 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_WAIT" },
        0x2445 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_WAIT_CALLBACK" },
        0x2449 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_IO" },
        0x244d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PTP_WIN32_IO_CALLBACK" },
        0x2451 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "AVRT_TASK_HANDLE" },
        0x2455 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "AVRT_PRIORITY" },
        0x2459 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "AVRT_THREAD_ORDERING_GROUP_HANDLE" },
        0x245d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "IRtwqAsyncCallback" },
        0x2461 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "IRtwqAsyncResult" },
        0x2465 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "RTWQPERIODICCALLBACK" },
        0x2469 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "RTWQ_WORKQUEUE_TYPE" },
        0x246d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "IRtwqPlatformEvents" },
        0x2471 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "IO_COUNTERS" },
        0x2475 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "LPFIBER_START_ROUTINE" },
        0x2479 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "UMS_THREAD_INFO_CLASS" },
        0x247d => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "UMS_SCHEDULER_STARTUP_INFO" },
        0x2481 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "UMS_SYSTEM_THREAD_INFORMATION" },
        else => null,
    };
}

pub const THREAD_CREATE_RUN_IMMEDIATELY = 0;
pub const THREAD_CREATE_SUSPENDED = 4;
pub const STACK_SIZE_PARAM_IS_A_RESERVATION = 65536;
pub const THREAD_MODE_BACKGROUND_BEGIN = 65536;
pub const THREAD_MODE_BACKGROUND_END = 131072;
pub const THREAD_PRIORITY_ABOVE_NORMAL = 1;
pub const THREAD_PRIORITY_BELOW_NORMAL = -1;
pub const THREAD_PRIORITY_HIGHEST = 2;
pub const THREAD_PRIORITY_IDLE = -15;
pub const THREAD_PRIORITY_MIN = -2;
pub const THREAD_PRIORITY_LOWEST = -2;
pub const THREAD_PRIORITY_NORMAL = 0;
pub const THREAD_PRIORITY_TIME_CRITICAL = 15;
pub const WT_EXECUTEDEFAULT = 0;
pub const WT_EXECUTEINIOTHREAD = 1;
pub const WT_EXECUTEINPERSISTENTTHREAD = 128;
pub const WT_EXECUTEINWAITTHREAD = 4;
pub const WT_EXECUTELONGFUNCTION = 16;
pub const WT_EXECUTEONLYONCE = 8;
pub const WT_TRANSFER_IMPERSONATION = 256;
pub const WT_EXECUTEINTIMERTHREAD = 32;
pub const CREATE_EVENT_INITIAL_SET = 2;
pub const CREATE_EVENT_MANUAL_RESET = 1;
pub const LOGON_WITH_PROFILE = 1;
pub const LOGON_NETCREDENTIALS_ONLY = 2;
pub const PROCESS_AFFINITY_DISABLE_AUTO_UPDATE = 0;
pub const PROCESS_AFFINITY_ENABLE_AUTO_UPDATE = 1;
pub const PROCESS_DEP_ENABLE = 1;
pub const PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION = 2;
pub const PROCESS_DEP_NONE = 0;
pub const PROCESS_NAME_WIN32 = 0;
pub const PROCESS_NAME_NATIVE = 1;
pub const PF_FLOATING_POINT_PRECISION_ERRATA = 0;
pub const PF_FLOATING_POINT_EMULATED = 1;
pub const PF_COMPARE_EXCHANGE_DOUBLE = 2;
pub const PF_MMX_INSTRUCTIONS_AVAILABLE = 3;
pub const PF_PPC_MOVEMEM_64BIT_OK = 4;
pub const PF_ALPHA_BYTE_INSTRUCTIONS = 5;
pub const PF_XMMI_INSTRUCTIONS_AVAILABLE = 6;
pub const PF_3DNOW_INSTRUCTIONS_AVAILABLE = 7;
pub const PF_RDTSC_INSTRUCTION_AVAILABLE = 8;
pub const PF_PAE_ENABLED = 9;
pub const PF_XMMI64_INSTRUCTIONS_AVAILABLE = 10;
pub const PF_SSE_DAZ_MODE_AVAILABLE = 11;
pub const PF_NX_ENABLED = 12;
pub const PF_SSE3_INSTRUCTIONS_AVAILABLE = 13;
pub const PF_COMPARE_EXCHANGE128 = 14;
pub const PF_COMPARE64_EXCHANGE128 = 15;
pub const PF_CHANNELS_ENABLED = 16;
pub const PF_XSAVE_ENABLED = 17;
pub const PF_ARM_VFP_32_REGISTERS_AVAILABLE = 18;
pub const PF_ARM_NEON_INSTRUCTIONS_AVAILABLE = 19;
pub const PF_SECOND_LEVEL_ADDRESS_TRANSLATION = 20;
pub const PF_VIRT_FIRMWARE_ENABLED = 21;
pub const PF_RDWRFSGSBASE_AVAILABLE = 22;
pub const PF_FASTFAIL_AVAILABLE = 23;
pub const PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE = 24;
pub const PF_ARM_64BIT_LOADSTORE_ATOMIC = 25;
pub const PF_ARM_EXTERNAL_CACHE_AVAILABLE = 26;
pub const PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE = 27;
pub const PF_RDRAND_INSTRUCTION_AVAILABLE = 28;
pub const PF_ARM_V8_INSTRUCTIONS_AVAILABLE = 29;
pub const PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE = 30;
pub const PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE = 31;
pub const PF_RDTSCP_INSTRUCTION_AVAILABLE = 32;
pub const PF_RDPID_INSTRUCTION_AVAILABLE = 33;
pub const PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE = 34;
pub const PF_MONITORX_INSTRUCTION_AVAILABLE = 35;
pub const PF_SSSE3_INSTRUCTIONS_AVAILABLE = 36;
pub const PF_SSE4_1_INSTRUCTIONS_AVAILABLE = 37;
pub const PF_SSE4_2_INSTRUCTIONS_AVAILABLE = 38;
pub const PF_AVX_INSTRUCTIONS_AVAILABLE = 39;
pub const PF_AVX2_INSTRUCTIONS_AVAILABLE = 40;
pub const PF_AVX512F_INSTRUCTIONS_AVAILABLE = 41;
pub const PF_ERMS_AVAILABLE = 42;
pub const PF_ARM_V82_DP_INSTRUCTIONS_AVAILABLE = 43;
pub const PF_ARM_V83_JSCVT_INSTRUCTIONS_AVAILABLE = 44;
pub const PF_ARM_V83_LRCPC_INSTRUCTIONS_AVAILABLE = 45;
pub const PF_ARM_SVE_INSTRUCTIONS_AVAILABLE = 46;
pub const PF_ARM_SVE2_INSTRUCTIONS_AVAILABLE = 47;
pub const PF_ARM_SVE2_1_INSTRUCTIONS_AVAILABLE = 48;
pub const PF_ARM_SVE_AES_INSTRUCTIONS_AVAILABLE = 49;
pub const PF_ARM_SVE_PMULL128_INSTRUCTIONS_AVAILABLE = 50;
pub const PF_ARM_SVE_BITPERM_INSTRUCTIONS_AVAILABLE = 51;
pub const PF_ARM_SVE_BF16_INSTRUCTIONS_AVAILABLE = 52;
pub const PF_ARM_SVE_EBF16_INSTRUCTIONS_AVAILABLE = 53;
pub const PF_ARM_SVE_B16B16_INSTRUCTIONS_AVAILABLE = 54;
pub const PF_ARM_SVE_SHA3_INSTRUCTIONS_AVAILABLE = 55;
pub const PF_ARM_SVE_SM4_INSTRUCTIONS_AVAILABLE = 56;
pub const PF_ARM_SVE_I8MM_INSTRUCTIONS_AVAILABLE = 57;
pub const PF_ARM_SVE_F32MM_INSTRUCTIONS_AVAILABLE = 58;
pub const PF_ARM_SVE_F64MM_INSTRUCTIONS_AVAILABLE = 59;
pub const PF_BMI2_INSTRUCTIONS_AVAILABLE = 60;
pub const PF_MOVDIR64B_INSTRUCTION_AVAILABLE = 61;
pub const PF_ARM_LSE2_AVAILABLE = 62;
pub const PF_RESERVED_FEATURE = 63;
pub const PF_ARM_SHA3_INSTRUCTIONS_AVAILABLE = 64;
pub const PF_ARM_SHA512_INSTRUCTIONS_AVAILABLE = 65;
pub const PF_ARM_V82_I8MM_INSTRUCTIONS_AVAILABLE = 66;
pub const PF_ARM_V82_FP16_INSTRUCTIONS_AVAILABLE = 67;
pub const PF_ARM_V86_BF16_INSTRUCTIONS_AVAILABLE = 68;
pub const PF_ARM_V86_EBF16_INSTRUCTIONS_AVAILABLE = 69;
pub const PF_ARM_SME_INSTRUCTIONS_AVAILABLE = 70;
pub const PF_ARM_SME2_INSTRUCTIONS_AVAILABLE = 71;
pub const PF_ARM_SME2_1_INSTRUCTIONS_AVAILABLE = 72;
pub const PF_ARM_SME2_2_INSTRUCTIONS_AVAILABLE = 73;
pub const PF_ARM_SME_AES_INSTRUCTIONS_AVAILABLE = 74;
pub const PF_ARM_SME_SBITPERM_INSTRUCTIONS_AVAILABLE = 75;
pub const PF_ARM_SME_SF8MM4_INSTRUCTIONS_AVAILABLE = 76;
pub const PF_ARM_SME_SF8MM8_INSTRUCTIONS_AVAILABLE = 77;
pub const PF_ARM_SME_SF8DP2_INSTRUCTIONS_AVAILABLE = 78;
pub const PF_ARM_SME_SF8DP4_INSTRUCTIONS_AVAILABLE = 79;
pub const PF_ARM_SME_SF8FMA_INSTRUCTIONS_AVAILABLE = 80;
pub const PF_ARM_SME_F8F32_INSTRUCTIONS_AVAILABLE = 81;
pub const PF_ARM_SME_F8F16_INSTRUCTIONS_AVAILABLE = 82;
pub const PF_ARM_SME_F16F16_INSTRUCTIONS_AVAILABLE = 83;
pub const PF_ARM_SME_B16B16_INSTRUCTIONS_AVAILABLE = 84;
pub const PF_ARM_SME_F64F64_INSTRUCTIONS_AVAILABLE = 85;
pub const PF_ARM_SME_I16I64_INSTRUCTIONS_AVAILABLE = 86;
pub const PF_ARM_SME_LUTv2_INSTRUCTIONS_AVAILABLE = 87;
pub const PF_ARM_SME_FA64_INSTRUCTIONS_AVAILABLE = 88;
pub const GR_GLOBAL = 4294967294;
pub const GR_GDIOBJECTS = 0;
pub const GR_GDIOBJECTS_PEAK = 2;
pub const GR_USEROBJECTS = 1;
pub const GR_USEROBJECTS_PEAK = 4;
pub const STARTF_FORCEONFEEDBACK = 64;
pub const STARTF_FORCEOFFFEEDBACK = 128;
pub const STARTF_PREVENTPINNING = 8192;
pub const STARTF_RUNFULLSCREEN = 32;
pub const STARTF_TITLEISAPPID = 4096;
pub const STARTF_TITLEISLINKNAME = 2048;
pub const STARTF_UNTRUSTEDSOURCE = 32768;
pub const STARTF_USECOUNTCHARS = 8;
pub const STARTF_USEFILLATTRIBUTE = 16;
pub const STARTF_USEHOTKEY = 512;
pub const STARTF_USEPOSITION = 4;
pub const STARTF_USESHOWWINDOW = 1;
pub const STARTF_USESIZE = 2;
pub const STARTF_USESTDHANDLES = 256;
pub const MEMORY_PRIORITY_VERY_LOW = 1;
pub const MEMORY_PRIORITY_LOW = 2;
pub const MEMORY_PRIORITY_MEDIUM = 3;
pub const MEMORY_PRIORITY_BELOW_NORMAL = 4;
pub const MEMORY_PRIORITY_NORMAL = 5;
pub const PROTECTION_LEVEL_WINTCB_LIGHT = 0;
pub const PROTECTION_LEVEL_WINDOWS = 1;
pub const PROTECTION_LEVEL_WINDOWS_LIGHT = 2;
pub const PROTECTION_LEVEL_ANTIMALWARE_LIGHT = 3;
pub const PROTECTION_LEVEL_LSA_LIGHT = 4;
pub const PROTECTION_LEVEL_WINTCB = 5;
pub const PROTECTION_LEVEL_CODEGEN_LIGHT = 6;
pub const PROTECTION_LEVEL_AUTHENTICODE = 7;
pub const PROTECTION_LEVEL_PPL_APP = 8;
pub const PROTECTION_LEVEL_NONE = 4294967294;
pub const POWER_REQUEST_CONTEXT_DETAILED_STRING = 2;
pub const POWER_REQUEST_CONTEXT_SIMPLE_STRING = 1;
pub const THREAD_TERMINATE = 1;
pub const THREAD_SUSPEND_RESUME = 2;
pub const THREAD_GET_CONTEXT = 8;
pub const THREAD_SET_CONTEXT = 16;
pub const THREAD_SET_INFORMATION = 32;
pub const THREAD_QUERY_INFORMATION = 64;
pub const THREAD_SET_THREAD_TOKEN = 128;
pub const THREAD_IMPERSONATE = 256;
pub const THREAD_DIRECT_IMPERSONATION = 512;
pub const THREAD_SET_LIMITED_INFORMATION = 1024;
pub const THREAD_QUERY_LIMITED_INFORMATION = 2048;
pub const THREAD_RESUME = 4096;
pub const THREAD_ALL_ACCESS = 2097151;
pub const THREAD_DELETE = 65536;
pub const THREAD_READ_CONTROL = 131072;
pub const THREAD_WRITE_DAC = 262144;
pub const THREAD_WRITE_OWNER = 524288;
pub const THREAD_SYNCHRONIZE = 1048576;
pub const THREAD_STANDARD_RIGHTS_REQUIRED = 983040;
pub const EVENT_ALL_ACCESS = 2031619;
pub const EVENT_MODIFY_STATE = 2;
pub const MUTEX_ALL_ACCESS = 2031617;
pub const MUTEX_MODIFY_STATE = 1;
pub const SEMAPHORE_ALL_ACCESS = 2031619;
pub const SEMAPHORE_MODIFY_STATE = 2;
pub const TIMER_ALL_ACCESS = 2031619;
pub const TIMER_MODIFY_STATE = 2;
pub const TIMER_QUERY_STATE = 1;
pub const SYNCHRONIZATION_DELETE = 65536;
pub const SYNCHRONIZATION_READ_CONTROL = 131072;
pub const SYNCHRONIZATION_WRITE_DAC = 262144;
pub const SYNCHRONIZATION_WRITE_OWNER = 524288;
pub const SYNCHRONIZATION_SYNCHRONIZE = 1048576;
pub const CONDITION_VARIABLE_LOCKMODE_SHARED = 1;
pub const INIT_ONCE_CHECK_ONLY = 1;
pub const INIT_ONCE_ASYNC = 2;
pub const INIT_ONCE_INIT_FAILED = 4;
pub const INIT_ONCE_CTX_RESERVED_BITS = 2;
pub const ALL_PROCESSOR_GROUPS = 65535;
pub const RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO = 16777216;
pub const RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN = 33554432;
pub const RTL_CRITICAL_SECTION_FLAG_STATIC_INIT = 67108864;
pub const RTL_CRITICAL_SECTION_FLAG_RESOURCE_TYPE = 134217728;
pub const RTL_CRITICAL_SECTION_FLAG_FORCE_DEBUG_INFO = 268435456;
pub const RTL_CRITICAL_SECTION_ALL_FLAG_BITS = 4278190080;
pub const RTL_CRITICAL_SECTION_DEBUG_FLAG_STATIC_INIT = 1;
pub const FLS_OUT_OF_INDEXES = 4294967295;
pub const PRIVATE_NAMESPACE_FLAG_DESTROY = 1;
pub const TLS_OUT_OF_INDEXES = 4294967295;
pub const PROC_THREAD_ATTRIBUTE_REPLACE_VALUE = 1;
pub const THREAD_POWER_THROTTLING_CURRENT_VERSION = 1;
pub const THREAD_POWER_THROTTLING_EXECUTION_SPEED = 1;
pub const THREAD_POWER_THROTTLING_VALID_FLAGS = 1;
pub const PME_CURRENT_VERSION = 1;
pub const PME_FAILFAST_ON_COMMIT_FAIL_DISABLE = 0;
pub const PME_FAILFAST_ON_COMMIT_FAIL_ENABLE = 1;
pub const PROCESS_POWER_THROTTLING_CURRENT_VERSION = 1;
pub const PROCESS_POWER_THROTTLING_EXECUTION_SPEED = 1;
pub const PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION = 4;
pub const PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND = 1;
pub const PROCESS_LEAP_SECOND_INFO_VALID_FLAGS = 1;
pub const CREATE_MUTEX_INITIAL_OWNER = 1;
pub const CREATE_WAITABLE_TIMER_MANUAL_RESET = 1;
pub const CREATE_WAITABLE_TIMER_HIGH_RESOLUTION = 2;
pub const SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY = 1;
pub const SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY = 2;
pub const SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE = 4;
pub const INFINITE = 4294967295;
pub const PROC_THREAD_ATTRIBUTE_NUMBER = 65535;
pub const PROC_THREAD_ATTRIBUTE_THREAD = 65536;
pub const PROC_THREAD_ATTRIBUTE_INPUT = 131072;
pub const PROC_THREAD_ATTRIBUTE_ADDITIVE = 262144;
pub const PROCESS_CREATION_MITIGATION_POLICY_DEP_ENABLE = 1;
pub const PROCESS_CREATION_MITIGATION_POLICY_DEP_ATL_THUNK_ENABLE = 2;
pub const PROCESS_CREATION_MITIGATION_POLICY_SEHOP_ENABLE = 4;
pub const PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_MASK = 768;
pub const PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_ALWAYS_ON = 256;
pub const PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_ALWAYS_OFF = 512;
pub const PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_ALWAYS_ON_REQ_RELOCS = 768;
pub const PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_MASK = 12288;
pub const PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_ALWAYS_ON = 4096;
pub const PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_ALWAYS_OFF = 8192;
pub const PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_RESERVED = 12288;
pub const PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_MASK = 196608;
pub const PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_ALWAYS_ON = 65536;
pub const PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_ALWAYS_OFF = 131072;
pub const PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_RESERVED = 196608;
pub const PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_MASK = 3145728;
pub const PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_ALWAYS_ON = 1048576;
pub const PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_ALWAYS_OFF = 2097152;
pub const PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_RESERVED = 3145728;
pub const PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_MASK = 50331648;
pub const PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_ALWAYS_ON = 16777216;
pub const PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_ALWAYS_OFF = 33554432;
pub const PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_RESERVED = 50331648;
pub const PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_MASK = 805306368;
pub const PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_ALWAYS_ON = 268435456;
pub const PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_ALWAYS_OFF = 536870912;
pub const PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_RESERVED = 805306368;
pub const PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_MASK = 12884901888;
pub const PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_ALWAYS_ON = 4294967296;
pub const PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_ALWAYS_OFF = 8589934592;
pub const PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_RESERVED = 12884901888;
pub const PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_MASK = 206158430208;
pub const PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_ALWAYS_ON = 68719476736;
pub const PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_ALWAYS_OFF = 137438953472;
pub const PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_ALWAYS_ON_ALLOW_OPT_OUT = 206158430208;
pub const PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_MASK = 3298534883328;
pub const PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_ALWAYS_ON = 1099511627776;
pub const PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_ALWAYS_OFF = 2199023255552;
pub const PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_EXPORT_SUPPRESSION = 3298534883328;
pub const PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_MASK = 52776558133248;
pub const PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_ALWAYS_ON = 17592186044416;
pub const PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_ALWAYS_OFF = 35184372088832;
pub const PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_ALLOW_STORE = 52776558133248;
pub const PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_MASK = 844424930131968;
pub const PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_ALWAYS_ON = 281474976710656;
pub const PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_ALWAYS_OFF = 562949953421312;
pub const PROCESS_CREATION_MITIGATION_POLICY_AUDIT_NONSYSTEM_FONTS = 844424930131968;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_MASK = 13510798882111488;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_ALWAYS_ON = 4503599627370496;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_ALWAYS_OFF = 9007199254740992;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_RESERVED = 13510798882111488;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_MASK = 216172782113783808;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_ALWAYS_ON = 72057594037927936;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_ALWAYS_OFF = 144115188075855872;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_RESERVED = 216172782113783808;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_MASK = 3458764513820540928;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_ALWAYS_ON = 1152921504606846976;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_ALWAYS_OFF = 2305843009213693952;
pub const PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_RESERVED = 3458764513820540928;
pub const PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_MASK = 48;
pub const PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_ALWAYS_ON = 16;
pub const PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_ALWAYS_OFF = 32;
pub const PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_AUDIT = 48;
pub const PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_MASK = 768;
pub const PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_ALWAYS_ON = 256;
pub const PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_ALWAYS_OFF = 512;
pub const PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_RESERVED = 768;
pub const PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_MASK = 12288;
pub const PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_ALWAYS_ON = 4096;
pub const PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_ALWAYS_OFF = 8192;
pub const PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_NOINHERIT = 12288;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_MASK = 196608;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_ALWAYS_ON = 65536;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_ALWAYS_OFF = 131072;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_RESERVED = 196608;
pub const PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_MASK = 3145728;
pub const PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_ALWAYS_ON = 1048576;
pub const PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_ALWAYS_OFF = 2097152;
pub const PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_RESERVED = 3145728;
pub const PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_MASK = 50331648;
pub const PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_ALWAYS_ON = 16777216;
pub const PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_ALWAYS_OFF = 33554432;
pub const PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_RESERVED = 50331648;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_MASK = 805306368;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_ON = 268435456;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_OFF = 536870912;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_STRICT_MODE = 805306368;
pub const PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_MASK = 12884901888;
pub const PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_ON = 4294967296;
pub const PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_OFF = 8589934592;
pub const PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_RELAXED_MODE = 12884901888;
pub const PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_MASK = 206158430208;
pub const PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_ON = 68719476736;
pub const PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_OFF = 137438953472;
pub const PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_NON_EHCONT = 206158430208;
pub const PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_MASK = 3298534883328;
pub const PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_ON = 1099511627776;
pub const PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_OFF = 2199023255552;
pub const PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_RESERVED = 3298534883328;
pub const PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_MASK = 52776558133248;
pub const PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_ALWAYS_ON = 17592186044416;
pub const PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_ALWAYS_OFF = 35184372088832;
pub const PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_RESERVED = 52776558133248;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_MASK = 844424930131968;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_ALWAYS_ON = 281474976710656;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_ALWAYS_OFF = 562949953421312;
pub const PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_RESERVED = 844424930131968;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_MASK = 13510798882111488;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_ALWAYS_ON = 4503599627370496;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_ALWAYS_OFF = 9007199254740992;
pub const PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_RESERVED = 13510798882111488;
pub const PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_MASK = 216172782113783808;
pub const PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_ALWAYS_ON = 72057594037927936;
pub const PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_ALWAYS_OFF = 144115188075855872;
pub const PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_RESERVED = 216172782113783808;
pub const PROCESS_CREATION_CHILD_PROCESS_RESTRICTED = 1;
pub const PROCESS_CREATION_CHILD_PROCESS_OVERRIDE = 2;
pub const PROCESS_CREATION_CHILD_PROCESS_RESTRICTED_UNLESS_SECURE = 4;
pub const PROCESS_CREATION_ALL_APPLICATION_PACKAGES_OPT_OUT = 1;
pub const PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_ENABLE_PROCESS_TREE = 1;
pub const PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_DISABLE_PROCESS_TREE = 2;
pub const PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_OVERRIDE = 4;
pub const PROCESS_CREATION_DESKTOP_APP_TRUSTED_LAUNCH_ALLOW_WINDOWS_HOST = 8;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_MASK = 805306368;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_ON = 268435456;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_OFF = 536870912;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_RESERVED = 805306368;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_MASK = 12884901888;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_ON = 4294967296;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_OFF = 8589934592;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_RESERVED = 12884901888;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_MASK = 206158430208;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_ON = 68719476736;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_OFF = 137438953472;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_RESERVED = 206158430208;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_MASK = 3298534883328;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_DEFER = 0;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_ON = 1099511627776;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_OFF = 2199023255552;
pub const PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_RESERVED = 3298534883328;
pub const PROC_THREAD_ATTRIBUTE_PARENT_PROCESS = 131072;
pub const PROC_THREAD_ATTRIBUTE_HANDLE_LIST = 131074;
pub const PROC_THREAD_ATTRIBUTE_GROUP_AFFINITY = 196611;
pub const PROC_THREAD_ATTRIBUTE_PREFERRED_NODE = 131076;
pub const PROC_THREAD_ATTRIBUTE_IDEAL_PROCESSOR = 196613;
pub const PROC_THREAD_ATTRIBUTE_UMS_THREAD = 196614;
pub const PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY = 131079;
pub const PROC_THREAD_ATTRIBUTE_SECURITY_CAPABILITIES = 131081;
pub const PROC_THREAD_ATTRIBUTE_PROTECTION_LEVEL = 131083;
pub const PROC_THREAD_ATTRIBUTE_PSEUDOCONSOLE = 131094;
pub const PROC_THREAD_ATTRIBUTE_MACHINE_TYPE = 131097;
pub const PROC_THREAD_ATTRIBUTE_ENABLE_OPTIONAL_XSTATE_FEATURES = 196635;
pub const PROC_THREAD_ATTRIBUTE_WIN32K_FILTER = 131088;
pub const PROC_THREAD_ATTRIBUTE_JOB_LIST = 131085;
pub const PROC_THREAD_ATTRIBUTE_CHILD_PROCESS_POLICY = 131086;
pub const PROC_THREAD_ATTRIBUTE_ALL_APPLICATION_PACKAGES_POLICY = 131087;
pub const PROC_THREAD_ATTRIBUTE_DESKTOP_APP_POLICY = 131090;
pub const PROC_THREAD_ATTRIBUTE_MITIGATION_AUDIT_POLICY = 131096;
pub const PROC_THREAD_ATTRIBUTE_COMPONENT_FILTER = 131098;
pub const DEBUG_PROCESS = 1;
pub const DEBUG_ONLY_THIS_PROCESS = 2;
pub const CREATE_SUSPENDED = 4;
pub const DETACHED_PROCESS = 8;
pub const CREATE_NEW_CONSOLE = 16;
pub const NORMAL_PRIORITY_CLASS = 32;
pub const IDLE_PRIORITY_CLASS = 64;
pub const HIGH_PRIORITY_CLASS = 128;
pub const REALTIME_PRIORITY_CLASS = 256;
pub const CREATE_NEW_PROCESS_GROUP = 512;
pub const CREATE_UNICODE_ENVIRONMENT = 1024;
pub const CREATE_SEPARATE_WOW_VDM = 2048;
pub const CREATE_SHARED_WOW_VDM = 4096;
pub const CREATE_FORCEDOS = 8192;
pub const BELOW_NORMAL_PRIORITY_CLASS = 16384;
pub const ABOVE_NORMAL_PRIORITY_CLASS = 32768;
pub const INHERIT_PARENT_AFFINITY = 65536;
pub const INHERIT_CALLER_PRIORITY = 131072;
pub const CREATE_PROTECTED_PROCESS = 262144;
pub const EXTENDED_STARTUPINFO_PRESENT = 524288;
pub const PROCESS_MODE_BACKGROUND_BEGIN = 1048576;
pub const PROCESS_MODE_BACKGROUND_END = 2097152;
pub const CREATE_SECURE_PROCESS = 4194304;
pub const CREATE_BREAKAWAY_FROM_JOB = 16777216;
pub const CREATE_PRESERVE_CODE_AUTHZ_LEVEL = 33554432;
pub const CREATE_DEFAULT_ERROR_MODE = 67108864;
pub const CREATE_NO_WINDOW = 134217728;
pub const PROFILE_USER = 268435456;
pub const PROFILE_KERNEL = 536870912;
pub const PROFILE_SERVER = 1073741824;
pub const CREATE_IGNORE_SYSTEM_DEFAULT = 2147483648;
pub const PROCESS_TERMINATE = 1;
pub const PROCESS_CREATE_THREAD = 2;
pub const PROCESS_SET_SESSIONID = 4;
pub const PROCESS_VM_OPERATION = 8;
pub const PROCESS_VM_READ = 16;
pub const PROCESS_VM_WRITE = 32;
pub const PROCESS_DUP_HANDLE = 64;
pub const PROCESS_CREATE_PROCESS = 128;
pub const PROCESS_SET_QUOTA = 256;
pub const PROCESS_SET_INFORMATION = 512;
pub const PROCESS_QUERY_INFORMATION = 1024;
pub const PROCESS_SUSPEND_RESUME = 2048;
pub const PROCESS_QUERY_LIMITED_INFORMATION = 4096;
pub const PROCESS_SET_LIMITED_INFORMATION = 8192;
pub const PROCESS_ALL_ACCESS = 2097151;
pub const PROCESS_DELETE = 65536;
pub const PROCESS_READ_CONTROL = 131072;
pub const PROCESS_WRITE_DAC = 262144;
pub const PROCESS_WRITE_OWNER = 524288;
pub const PROCESS_SYNCHRONIZE = 1048576;
pub const PROCESS_STANDARD_RIGHTS_REQUIRED = 983040;
pub const QUEUE_USER_APC_FLAGS_NONE = 0;
pub const QUEUE_USER_APC_FLAGS_SPECIAL_USER_APC = 1;
pub const QUEUE_USER_APC_CALLBACK_DATA_CONTEXT = 65536;
pub const ThreadMemoryPriority = 0;
pub const ThreadAbsoluteCpuPriority = 1;
pub const ThreadDynamicCodePolicy = 2;
pub const ThreadPowerThrottling = 3;
pub const ThreadInformationClassMax = 4;
pub const ProcessMemoryPriority = 0;
pub const ProcessMemoryExhaustionInfo = 1;
pub const ProcessAppMemoryInfo = 2;
pub const ProcessInPrivateInfo = 3;
pub const ProcessPowerThrottling = 4;
pub const ProcessReservedValue1 = 5;
pub const ProcessTelemetryCoverageInfo = 6;
pub const ProcessProtectionLevelInfo = 7;
pub const ProcessLeapSecondInfo = 8;
pub const ProcessMachineTypeInfo = 9;
pub const ProcessOverrideSubsequentPrefetchParameter = 10;
pub const ProcessMaxOverridePrefetchParameter = 11;
pub const ProcessInformationClassMax = 12;
pub const UserEnabled = 1;
pub const KernelEnabled = 2;
pub const Wow64Container = 4;
pub const PMETypeFailFastOnCommitFailure = 0;
pub const PMETypeMax = 1;
pub const AVRT_PRIORITY_VERYLOW = -2;
pub const AVRT_PRIORITY_LOW = -1;
pub const AVRT_PRIORITY_NORMAL = 0;
pub const AVRT_PRIORITY_HIGH = 1;
pub const AVRT_PRIORITY_CRITICAL = 2;
pub const RTWQ_STANDARD_WORKQUEUE = 0;
pub const RTWQ_WINDOW_WORKQUEUE = 1;
pub const RTWQ_MULTITHREADED_WORKQUEUE = 2;
pub const ProcessDEPPolicy = 0;
pub const ProcessASLRPolicy = 1;
pub const ProcessDynamicCodePolicy = 2;
pub const ProcessStrictHandleCheckPolicy = 3;
pub const ProcessSystemCallDisablePolicy = 4;
pub const ProcessMitigationOptionsMask = 5;
pub const ProcessExtensionPointDisablePolicy = 6;
pub const ProcessControlFlowGuardPolicy = 7;
pub const ProcessSignaturePolicy = 8;
pub const ProcessFontDisablePolicy = 9;
pub const ProcessImageLoadPolicy = 10;
pub const ProcessSystemCallFilterPolicy = 11;
pub const ProcessPayloadRestrictionPolicy = 12;
pub const ProcessChildProcessPolicy = 13;
pub const ProcessSideChannelIsolationPolicy = 14;
pub const ProcessUserShadowStackPolicy = 15;
pub const ProcessRedirectionTrustPolicy = 16;
pub const ProcessUserPointerAuthPolicy = 17;
pub const ProcessSEHOPPolicy = 18;
pub const MaxProcessMitigationPolicy = 19;
pub const UmsThreadInvalidInfoClass = 0;
pub const UmsThreadUserContext = 1;
pub const UmsThreadPriority = 2;
pub const UmsThreadAffinity = 3;
pub const UmsThreadTeb = 4;
pub const UmsThreadIsSuspended = 5;
pub const UmsThreadIsTerminated = 6;
pub const UmsThreadMaxInfoClass = 7;
pub const TP_CALLBACK_PRIORITY_HIGH = 0;
pub const TP_CALLBACK_PRIORITY_NORMAL = 1;
pub const TP_CALLBACK_PRIORITY_LOW = 2;
pub const TP_CALLBACK_PRIORITY_INVALID = 3;
pub const TP_CALLBACK_PRIORITY_COUNT = 3;
pub const ProcThreadAttributeParentProcess = 0;
pub const ProcThreadAttributeHandleList = 2;
pub const ProcThreadAttributeGroupAffinity = 3;
pub const ProcThreadAttributePreferredNode = 4;
pub const ProcThreadAttributeIdealProcessor = 5;
pub const ProcThreadAttributeUmsThread = 6;
pub const ProcThreadAttributeMitigationPolicy = 7;
pub const ProcThreadAttributeSecurityCapabilities = 9;
pub const ProcThreadAttributeProtectionLevel = 11;
pub const ProcThreadAttributeJobList = 13;
pub const ProcThreadAttributeChildProcessPolicy = 14;
pub const ProcThreadAttributeAllApplicationPackagesPolicy = 15;
pub const ProcThreadAttributeWin32kFilter = 16;
pub const ProcThreadAttributeSafeOpenPromptOriginClaim = 17;
pub const ProcThreadAttributeDesktopAppPolicy = 18;
pub const ProcThreadAttributePseudoConsole = 22;
pub const ProcThreadAttributeMitigationAuditPolicy = 24;
pub const ProcThreadAttributeMachineType = 25;
pub const ProcThreadAttributeComponentFilter = 26;
pub const ProcThreadAttributeEnableOptionalXStateFeatures = 27;
pub const ProcThreadAttributeTrustedApp = 29;
pub const ProcThreadAttributeSveVectorLength = 30;

pub const aliases = struct {
    pub const THREAD_CREATION_FLAGS = u32;
    pub const THREAD_PRIORITY = i32;
    pub const WORKER_THREAD_FLAGS = u32;
    pub const CREATE_EVENT = u32;
    pub const CREATE_PROCESS_LOGON_FLAGS = u32;
    pub const PROCESS_AFFINITY_AUTO_UPDATE_FLAGS = u32;
    pub const PROCESS_DEP_FLAGS = u32;
    pub const PROCESS_NAME_FORMAT = u32;
    pub const PROCESSOR_FEATURE_ID = u32;
    pub const GET_GUI_RESOURCES_FLAGS = u32;
    pub const STARTUPINFOW_FLAGS = u32;
    pub const MEMORY_PRIORITY = u32;
    pub const PROCESS_PROTECTION_LEVEL = u32;
    pub const POWER_REQUEST_CONTEXT_FLAGS = u32;
    pub const THREAD_ACCESS_RIGHTS = u32;
    pub const SYNCHRONIZATION_ACCESS_RIGHTS = u32;
    pub const PROCESS_CREATION_FLAGS = u32;
    pub const PROCESS_ACCESS_RIGHTS = u32;
    pub const QUEUE_USER_APC_FLAGS = i32;
    pub const THREAD_INFORMATION_CLASS = i32;
    pub const PROCESS_INFORMATION_CLASS = i32;
    pub const MACHINE_ATTRIBUTES = i32;
    pub const PROCESS_MEMORY_EXHAUSTION_TYPE = i32;
    pub const AVRT_PRIORITY = i32;
    pub const RTWQ_WORKQUEUE_TYPE = i32;
    pub const PROCESS_MITIGATION_POLICY = i32;
    pub const UMS_THREAD_INFO_CLASS = i32;
    pub const TP_CALLBACK_PRIORITY = i32;
    pub const PROC_THREAD_ATTRIBUTE_NUM = u32;
    pub const PTP_POOL = isize;
    pub const PTP_CLEANUP_GROUP = isize;
    pub const AVRT_TASK_HANDLE = ?*anyopaque;
    pub const AVRT_THREAD_ORDERING_GROUP_HANDLE = ?*anyopaque;
    pub const LPPROC_THREAD_ATTRIBUTE_LIST = ?*anyopaque;
    pub const PTP_IO = isize;
    pub const PTP_TIMER = isize;
    pub const PTP_WAIT = isize;
    pub const PTP_WORK = isize;
    pub const PTP_CALLBACK_INSTANCE = isize;
    pub const OVERRIDE_PREFETCH_PARAMETER = u32;
    pub const LPTHREAD_START_ROUTINE = ?*const anyopaque;
    pub const PINIT_ONCE_FN = ?*const anyopaque;
    pub const PTIMERAPCROUTINE = ?*const anyopaque;
    pub const PTP_WIN32_IO_CALLBACK = ?*const anyopaque;
    pub const RTWQPERIODICCALLBACK = ?*const anyopaque;
    pub const PRTL_UMS_SCHEDULER_ENTRY_POINT = ?*const anyopaque;
    pub const WAITORTIMERCALLBACK = ?*const anyopaque;
    pub const WORKERCALLBACKFUNC = ?*const anyopaque;
    pub const APC_CALLBACK_FUNCTION = ?*const anyopaque;
    pub const PFLS_CALLBACK_FUNCTION = ?*const anyopaque;
    pub const PTP_SIMPLE_CALLBACK = ?*const anyopaque;
    pub const PTP_CLEANUP_GROUP_CANCEL_CALLBACK = ?*const anyopaque;
    pub const PTP_WORK_CALLBACK = ?*const anyopaque;
    pub const PTP_TIMER_CALLBACK = ?*const anyopaque;
    pub const PTP_WAIT_CALLBACK = ?*const anyopaque;
    pub const LPFIBER_START_ROUTINE = ?*const anyopaque;
    pub const PPS_POST_PROCESS_INIT_ROUTINE = ?*const anyopaque;
};
