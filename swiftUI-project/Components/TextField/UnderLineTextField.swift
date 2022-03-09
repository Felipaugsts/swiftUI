//
//  AuthTextField.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 09/03/22.
//

import SwiftUI


struct ULineTextField: View {
    var fieldText: String
    @Binding var field: String
    @State var underline = false
    
     var body: some View {

               VStack {
                    TextField(fieldText, text: $field)
                            .padding(.leading, 20)
                            .padding(.trailing, 16)
                    Rectangle()
                         .frame(height: 1)
                         .foregroundColor(.black)
                         .padding(.leading, 16)
                         .padding(.trailing, 16)
               }
     }
}
