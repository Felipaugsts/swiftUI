//
//  swiftUI_projectApp.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 09/03/22.
//

import SwiftUI
import Firebase 

@main

struct swiftUI_projectApp: App {
    init() {
      FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSettings())
        }
    }
}
