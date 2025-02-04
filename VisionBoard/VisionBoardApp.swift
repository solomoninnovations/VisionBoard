//
//  VisionBoardApp.swift
//  VisionBoard
//
//  Created by Austin Firestone on 2/4/25.
//

import SwiftUI

@main
struct VisionBoardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
