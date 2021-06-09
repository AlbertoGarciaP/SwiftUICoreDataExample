//
//  SwiftUICoreDataExampleApp.swift
//  SwiftUICoreDataExample
//
//  Created by Alberto Garcia on 08/06/21.
//

import SwiftUI

@main
struct SwiftUICoreDataExampleApp: App {
    let persistentController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentController.container.viewContext)
        }
    }
}
