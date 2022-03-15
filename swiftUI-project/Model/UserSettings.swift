//
//  UserSettings.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 15/03/22.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var isLoggedIn : Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "login")
        }
    }
    init() {
        self.isLoggedIn = false
    }
}
