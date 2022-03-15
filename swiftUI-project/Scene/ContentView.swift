//
//  ContentView.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 09/03/22.
//
import LocalAuthentication
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var fireAuth = false
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        VStack {
            if settings.isLoggedIn {
                HomePage()
            } else {
                LoginView()
            }
                
            
        }
        .onAppear(perform: isUserAuthenticated)
    }
    func isUserAuthenticated() {
        print("settings.isLoggedIn", settings.isLoggedIn)
        if Auth.auth().currentUser != nil {
            authenticate()
            settings.isLoggedIn = true
            print("logged in ")
        } else {
            print(" not logged in ")
            settings.isLoggedIn = false
        }
        print("settings.isLoggedIn", settings.isLoggedIn)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    self.isUnlocked = true
                }
                else {
                    self.isUnlocked = false
                }
            }
        } else {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
