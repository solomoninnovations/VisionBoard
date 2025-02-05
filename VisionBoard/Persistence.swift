import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "VisionBoard")
        
        if let description = container.persistentStoreDescriptions.first {
            // Set the CloudKit container identifier
            description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(
                containerIdentifier: "iCloud.VisionBoard"
            )
            // Enable persistent history tracking for better sync
            description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
            // Post remote change notifications to trigger UI updates
            description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        }

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error loading persistent stores: \(error), \(error.userInfo)")
            }
        }
        
        // Automatically merge changes from CloudKit
        container.viewContext.automaticallyMergesChangesFromParent = true
        // Set a merge policy to resolve conflicts
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        // 🔄 Debugging: Print when CloudKit Sync is triggered
        NotificationCenter.default.addObserver(forName: .NSPersistentStoreRemoteChange, object: nil, queue: .main) { _ in
            print("🔄 CloudKit sync triggered! Updating UI.")
        }
    }
    
    // Optional: Helper to force a CloudKit sync on demand.
    func forceCloudKitSync() {
        let taskContext = container.newBackgroundContext()
        taskContext.perform {
            do {
                try taskContext.setQueryGenerationFrom(.current)
                print("🔄 Forced CloudKit sync")
            } catch {
                print("⚠️ Error forcing sync: \(error)")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("✅ Context saved successfully.")
            } catch {
                let nsError = error as NSError
                print("❌ Error saving context: \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
