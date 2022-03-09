//
//  LoginView.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 09/03/22.
//

import SwiftUI

struct LoginView: View {
@State var userEmail = ""
    @State var password = ""
    var body: some View {
        VStack {
    
                 VStack {

                     ULineTextField(fieldText: "Email", field: $userEmail)
                     UnderLineSecurityField(field: $password, fieldText: "Password")
                 }
                 .padding()
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
