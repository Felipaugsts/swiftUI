//
//  FireApi.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 15/03/22.
//

import Foundation
import FirebaseAuth

enum NetworkError: Error {
    case wrongPassword
    case badURL
}


protocol FireAPIProtocol {
    
    func login(email: String, password: String, completion: @escaping (Result< Int, NetworkError>) -> ())
}

class FireAPI: FireAPIProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Int, NetworkError>) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, Error in
            if Error == nil {
                completion(.success(200))
            } else {
                completion(.failure(.wrongPassword))
            }
        }
    }
 
    
    
}
