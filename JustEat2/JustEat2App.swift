//
//  JustEat2App.swift
//  JustEat2
//
//  Created by Rapipay on 15/02/23.
//

import SwiftUI

@main
struct JustEat2App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSettings())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
