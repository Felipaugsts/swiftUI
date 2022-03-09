//
//  ContentView.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 09/03/22.
//
import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                HomePage()
            } else {
                LoginView()
            }
                
            
        }
//        .onAppear(perform: authenticate)
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
