//
//  SDULifeApp.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

@main
struct SDULifeApp: App {
    
    @State(initialValue: "en") var lang: String
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Login()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
