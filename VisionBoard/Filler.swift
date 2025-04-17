//
//  Filler.swift
//  VisionBoard
//
//  Created by Austin Firestone on 4/16/25.
//

/*
 
 CoreData: debug: CoreData+CloudKit: -[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:](36): Validating options: <NSCloudKitMirroringDelegateOptions: 0x600003000240> containerIdentifier:iCloud.VisionBoard databaseScope:Private ckAssetThresholdBytes:<null> operationMemoryThresholdBytes:<null> useEncryptedStorage:NO useDeviceToDeviceEncryption:NO automaticallyDownloadFileBackedFutures:NO automaticallyScheduleImportAndExportOperations:YES skipCloudKitSetup:NO preserveLegacyRecordMetadataBehavior:NO useDaemon:YES apsConnectionMachServiceName:<null> containerProvider:<PFCloudKitContainerProvider: 0x600000004230> storeMonitorProvider:<PFCloudKitStoreMonitorProvider: 0x600000004240> metricsClient:<PFCloudKitMetricsClient: 0x600000004250> metadataPurger:<PFCloudKitMetadataPurger: 0x600000004260> scheduler:<null> notificationListener:<null> containerOptions:<null> defaultOperationConfiguration:<null> progressProvider:<NSPersistentCloudKitContainer: 0x600001708100> test_useLegacySavePolicy:YES archivingUtilities:<PFCloudKitArchivingUtilities: 0x600000004270> bypassSchedulerActivityForInitialImport:NO bypassDasdRateLimiting:NO
 storeOptions: {
     NSInferMappingModelAutomaticallyOption = 1;
     NSMigratePersistentStoresAutomaticallyOption = 1;
     NSPersistentCloudKitContainerOptionsKey = "<NSPersistentCloudKitContainerOptions: 0x6000021011d0>";
     NSPersistentHistoryTrackingKey = 1;
     NSPersistentStoreMirroringOptionsKey =     {
         NSPersistentStoreMirroringDelegateOptionKey = "<NSCloudKitMirroringDelegate: 0x600003d082d0>";
     };
     NSPersistentStoreRemoteChangeNotificationOptionKey = 1;
 }
 CoreData: debug: CoreData+CloudKit: -[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:](429): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Observing store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](591): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Successfully enqueued setup request: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](3553): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Checking for pending requests.
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke(3566): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Executing: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5
 CoreData: warning: CoreData+CloudKit: -[PFCloudKitSetupAssistant _checkAccountStatus:]_block_invoke(342): Fetched account info for store 5D0AF265-F054-42F6-8127-B9E2B38FB902: <CKAccountInfo: 0x60000177f600; accountStatus=No account, accountPartition=Prod, deviceToDeviceEncryptionAvailability=(none), hasValidCredentials=false, walrus=Disabled, needsToVerifyTerms=false, accountAccessAuthorization=Yes, validationCounter=1>
 (null)
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke(1242): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Failed to set up CloudKit integration for store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke(1242): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Failed to set up CloudKit integration for store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate recoverFromError:](2312): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Attempting recovery from error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate recoverFromError:](2312): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Attempting recovery from error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](2622): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Failed to recover from error: NSCocoaErrorDomain:134400
 Recovery encountered the following error: (null):0
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](2622): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Failed to recover from error: NSCocoaErrorDomain:134400
 Recovery encountered the following error: (null):0
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](3584): Finished request: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5 with result: <NSCloudKitMirroringResult: 0x600000cab720> storeIdentifier: 5D0AF265-F054-42F6-8127-B9E2B38FB902 success: 0 madeChanges: 0 error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](3553): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Checking for pending requests.
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke(3569): <NSCloudKitMirroringDelegate: 0x600003d082d0>: No more requests to execute.
 🔄 Forced CloudKit fetch
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 NSBundle file:///Library/Developer/CoreSimulator/Volumes/iOS_22A3351/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS%2018.0.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/MetalTools.framework/ principal class is nil because all fallbacks have failed
 fopen failed for data file: errno = 2 (No such file or directory)
 Errors found! Invalidating cache...
 fopen failed for data file: errno = 2 (No such file or directory)
 Errors found! Invalidating cache...
 [ERROR] Could not create a bookmark: NSError: Cocoa 4097 "connection to service named com.apple.FileProvider"
 ✅ Context saved successfully.
 🔄 CloudKit sync triggered! Updating UI.
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 Snapshotting a view (0x106504900, UIKeyboardImpl) that is not in a visible window requires afterScreenUpdates:YES.
 [C:3] Error received: Connection interrupted.
 
 CoreData: debug: CoreData+CloudKit: -[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:](36): Validating options: <NSCloudKitMirroringDelegateOptions: 0x600003000240> containerIdentifier:iCloud.VisionBoard databaseScope:Private ckAssetThresholdBytes:<null> operationMemoryThresholdBytes:<null> useEncryptedStorage:NO useDeviceToDeviceEncryption:NO automaticallyDownloadFileBackedFutures:NO automaticallyScheduleImportAndExportOperations:YES skipCloudKitSetup:NO preserveLegacyRecordMetadataBehavior:NO useDaemon:YES apsConnectionMachServiceName:<null> containerProvider:<PFCloudKitContainerProvider: 0x600000004230> storeMonitorProvider:<PFCloudKitStoreMonitorProvider: 0x600000004240> metricsClient:<PFCloudKitMetricsClient: 0x600000004250> metadataPurger:<PFCloudKitMetadataPurger: 0x600000004260> scheduler:<null> notificationListener:<null> containerOptions:<null> defaultOperationConfiguration:<null> progressProvider:<NSPersistentCloudKitContainer: 0x600001708100> test_useLegacySavePolicy:YES archivingUtilities:<PFCloudKitArchivingUtilities: 0x600000004270> bypassSchedulerActivityForInitialImport:NO bypassDasdRateLimiting:NO
 storeOptions: {
     NSInferMappingModelAutomaticallyOption = 1;
     NSMigratePersistentStoresAutomaticallyOption = 1;
     NSPersistentCloudKitContainerOptionsKey = "<NSPersistentCloudKitContainerOptions: 0x6000021011d0>";
     NSPersistentHistoryTrackingKey = 1;
     NSPersistentStoreMirroringOptionsKey =     {
         NSPersistentStoreMirroringDelegateOptionKey = "<NSCloudKitMirroringDelegate: 0x600003d082d0>";
     };
     NSPersistentStoreRemoteChangeNotificationOptionKey = 1;
 }
 CoreData: debug: CoreData+CloudKit: -[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:](429): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Observing store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](591): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Successfully enqueued setup request: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](3553): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Checking for pending requests.
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke(3566): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Executing: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5
 CoreData: warning: CoreData+CloudKit: -[PFCloudKitSetupAssistant _checkAccountStatus:]_block_invoke(342): Fetched account info for store 5D0AF265-F054-42F6-8127-B9E2B38FB902: <CKAccountInfo: 0x60000177f600; accountStatus=No account, accountPartition=Prod, deviceToDeviceEncryptionAvailability=(none), hasValidCredentials=false, walrus=Disabled, needsToVerifyTerms=false, accountAccessAuthorization=Yes, validationCounter=1>
 (null)
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke(1242): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Failed to set up CloudKit integration for store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke(1242): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Failed to set up CloudKit integration for store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate recoverFromError:](2312): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Attempting recovery from error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate recoverFromError:](2312): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Attempting recovery from error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](2622): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Failed to recover from error: NSCocoaErrorDomain:134400
 Recovery encountered the following error: (null):0
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](2622): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Failed to recover from error: NSCocoaErrorDomain:134400
 Recovery encountered the following error: (null):0
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](3584): Finished request: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5 with result: <NSCloudKitMirroringResult: 0x600000cab720> storeIdentifier: 5D0AF265-F054-42F6-8127-B9E2B38FB902 success: 0 madeChanges: 0 error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](3553): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Checking for pending requests.
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke(3569): <NSCloudKitMirroringDelegate: 0x600003d082d0>: No more requests to execute.
 🔄 Forced CloudKit fetch
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 NSBundle file:///Library/Developer/CoreSimulator/Volumes/iOS_22A3351/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS%2018.0.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/MetalTools.framework/ principal class is nil because all fallbacks have failed
 fopen failed for data file: errno = 2 (No such file or directory)
 Errors found! Invalidating cache...
 fopen failed for data file: errno = 2 (No such file or directory)
 Errors found! Invalidating cache...
 [ERROR] Could not create a bookmark: NSError: Cocoa 4097 "connection to service named com.apple.FileProvider"
 ✅ Context saved successfully.
 🔄 CloudKit sync triggered! Updating UI.
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 Snapshotting a view (0x106504900, UIKeyboardImpl) that is not in a visible window requires afterScreenUpdates:YES.
 [C:3] Error received: Connection interrupted.
 
 CoreData: debug: CoreData+CloudKit: -[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:](36): Validating options: <NSCloudKitMirroringDelegateOptions: 0x600003000240> containerIdentifier:iCloud.VisionBoard databaseScope:Private ckAssetThresholdBytes:<null> operationMemoryThresholdBytes:<null> useEncryptedStorage:NO useDeviceToDeviceEncryption:NO automaticallyDownloadFileBackedFutures:NO automaticallyScheduleImportAndExportOperations:YES skipCloudKitSetup:NO preserveLegacyRecordMetadataBehavior:NO useDaemon:YES apsConnectionMachServiceName:<null> containerProvider:<PFCloudKitContainerProvider: 0x600000004230> storeMonitorProvider:<PFCloudKitStoreMonitorProvider: 0x600000004240> metricsClient:<PFCloudKitMetricsClient: 0x600000004250> metadataPurger:<PFCloudKitMetadataPurger: 0x600000004260> scheduler:<null> notificationListener:<null> containerOptions:<null> defaultOperationConfiguration:<null> progressProvider:<NSPersistentCloudKitContainer: 0x600001708100> test_useLegacySavePolicy:YES archivingUtilities:<PFCloudKitArchivingUtilities: 0x600000004270> bypassSchedulerActivityForInitialImport:NO bypassDasdRateLimiting:NO
 storeOptions: {
     NSInferMappingModelAutomaticallyOption = 1;
     NSMigratePersistentStoresAutomaticallyOption = 1;
     NSPersistentCloudKitContainerOptionsKey = "<NSPersistentCloudKitContainerOptions: 0x6000021011d0>";
     NSPersistentHistoryTrackingKey = 1;
     NSPersistentStoreMirroringOptionsKey =     {
         NSPersistentStoreMirroringDelegateOptionKey = "<NSCloudKitMirroringDelegate: 0x600003d082d0>";
     };
     NSPersistentStoreRemoteChangeNotificationOptionKey = 1;
 }
 CoreData: debug: CoreData+CloudKit: -[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:](429): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Observing store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](591): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Successfully enqueued setup request: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](3553): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Checking for pending requests.
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke(3566): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Executing: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5
 CoreData: warning: CoreData+CloudKit: -[PFCloudKitSetupAssistant _checkAccountStatus:]_block_invoke(342): Fetched account info for store 5D0AF265-F054-42F6-8127-B9E2B38FB902: <CKAccountInfo: 0x60000177f600; accountStatus=No account, accountPartition=Prod, deviceToDeviceEncryptionAvailability=(none), hasValidCredentials=false, walrus=Disabled, needsToVerifyTerms=false, accountAccessAuthorization=Yes, validationCounter=1>
 (null)
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke(1242): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Failed to set up CloudKit integration for store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke(1242): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Failed to set up CloudKit integration for store: <NSSQLCore: 0x103604b80> (URL: file:///Users/austinfirestone/Library/Developer/CoreSimulator/Devices/DFC0F233-CD02-4A95-BBD0-DFB80995181A/data/Containers/Data/Application/911A1C49-F443-445F-8779-82AFB351CF33/Library/Application%20Support/VisionBoard.sqlite)
 Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate recoverFromError:](2312): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Attempting recovery from error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate recoverFromError:](2312): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Attempting recovery from error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](2622): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Failed to recover from error: NSCocoaErrorDomain:134400
 Recovery encountered the following error: (null):0
 CoreData: error: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](2622): <NSCloudKitMirroringDelegate: 0x600003d082d0> - Failed to recover from error: NSCocoaErrorDomain:134400
 Recovery encountered the following error: (null):0
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](3584): Finished request: <NSCloudKitMirroringDelegateSetupRequest: 0x600002123b60> 826E5E87-7EAF-4009-94A0-5F5593CA1FE5 with result: <NSCloudKitMirroringResult: 0x600000cab720> storeIdentifier: 5D0AF265-F054-42F6-8127-B9E2B38FB902 success: 0 madeChanges: 0 error: Error Domain=NSCocoaErrorDomain Code=134400 "Unable to initialize without an iCloud account (CKAccountStatusNoAccount)." UserInfo={NSLocalizedFailureReason=Unable to initialize without an iCloud account (CKAccountStatusNoAccount).}
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](3553): <NSCloudKitMirroringDelegate: 0x600003d082d0>: Checking for pending requests.
 CoreData: CloudKit: CoreData+CloudKit: -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke(3569): <NSCloudKitMirroringDelegate: 0x600003d082d0>: No more requests to execute.
 🔄 Forced CloudKit fetch
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 🔄 CloudKit sync triggered! Updating UI.
 NSBundle file:///Library/Developer/CoreSimulator/Volumes/iOS_22A3351/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS%2018.0.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/MetalTools.framework/ principal class is nil because all fallbacks have failed
 fopen failed for data file: errno = 2 (No such file or directory)
 Errors found! Invalidating cache...
 fopen failed for data file: errno = 2 (No such file or directory)
 Errors found! Invalidating cache...
 [ERROR] Could not create a bookmark: NSError: Cocoa 4097 "connection to service named com.apple.FileProvider"
 ✅ Context saved successfully.
 🔄 CloudKit sync triggered! Updating UI.
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID. inputModality = Keyboard, inputOperation = dismissAutoFillPanel, customInfoType = UIUserInteractionRemoteInputOperations
 Snapshotting a view (0x106504900, UIKeyboardImpl) that is not in a visible window requires afterScreenUpdates:YES.
 [C:3] Error received: Connection interrupted.
 
 */
