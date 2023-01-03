//
//  WishAppApp.swift
//  WishApp
//
//  Created by Marcus Moore on 12/28/22.
//

import SwiftUI

@main
struct WishAppApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(EnviromentVars())
        }
    }
}
