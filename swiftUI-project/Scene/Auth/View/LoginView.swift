//
//  LoginView.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 09/03/22.
//

import SwiftUI

struct LoginView: View {
    @State var userEmail: String = ""
    @State var password: String = ""
    @State var isLoading: Bool = false
    @EnvironmentObject var settings: UserSettings
    
    var login: AuthViewModel = FireContainer.shared.resolve(AuthViewModel.self)!
    var body: some View {
        VStack {
                Spacer()
    
                 VStack (spacing: 15) {
                     Image("logo")
                         .resizable()
                         .frame(width: 80, height: 80, alignment: .center)
                         .padding()
                     
                     Text("Login")
                         .font(.title)
                         .fontWeight(.semibold)
                     
                     ULineTextField(fieldText: "Email", field: $userEmail)
                         .padding(.bottom, 20)
                         .disabled(isLoading)
                     UnderLineSecurityField(field: $password, fieldText: "Password")
                         .disabled(isLoading)
                     
                     HStack {
                         Spacer()
                     
                     Text("Need help?")
                         .font(.caption)
                         .fontWeight(.semibold)
                         .foregroundColor(.black.opacity(0.5))
                     }.padding(.trailing, 20)
                     
                     if isLoading {
                         LottieView(name: "loader", loopMode: .loop)
                             .frame(width: 100, height: 100)
                         Spacer()
                     }
                     else
                     {
                     HStack {
      
                         Button(action: {
                             if !userEmail.isEmpty && !password.isEmpty {
                                 withAnimation(.spring()) {
                                     isLoading = true
                                     login.tap(email: userEmail, password: password) {
                                         result in
                                         if result == "wrongPassword" {
                                             print("wrong password")
                                         } else if result == "200" {
                                             settings.isLoggedIn = true
                                         }
                                             isLoading = false
                                         
                                     }
                                 }
                                 
                             }
                             
                         }) {
                             Text("Login")
                                 .font(.title2)
                         }
                      
                         .frame(width: UIScreen.main.bounds.width - 60, height: 45)
                         .background(.blue.opacity(0.6))
                         .foregroundColor(.white)
                         .cornerRadius(8)
                     }
                     
                     .padding(.top, 44)
                     
                     Text("Or loggin in with")
                         .fontWeight(.regular)
                         .foregroundColor(.black.opacity(0.5))
                         .padding([.top, .bottom], 15)
                     
                     HStack (spacing: 50) {
                     Button(action: {}) {
                         Image("google")
                             .resizable()
                             .frame(width: 30, height: 30)
                     }
                     Button(action: {}) {
                         Image("google")
                             .resizable()
                             .frame(width: 30, height: 30)
                     }
                     Button(action: {}) {
                         Image("google")
                             .resizable()
                             .frame(width: 30, height: 30)
                     }
                     }
                     
                     
                     HStack {
                         Text("Newbie?")
                             .fontWeight(.regular)
                             .foregroundColor(.black.opacity(0.5))
                         
                     }
                 }
                 }
                 .frame(height: UIScreen.main.bounds.height - 200)
                 .background(.white)
                 .cornerRadius(20)
            }
        .background(
            .linearGradient(Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
