//
//  HomePage.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 09/03/22.
//

import SwiftUI
import FirebaseAuth

struct HomePage: View {
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        VStack {
            Text("Home Page")
            Button(action: {
                try! Auth.auth().signOut()
                settings.isLoggedIn = false
            }){
                Text("Logout")
            }
        }
        .background(.red)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
