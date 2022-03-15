//
//  FireRepository.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 15/03/22.
//

import Foundation

protocol FireRepositoryProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Int, NetworkError>) -> ())
    func logout()
}

class FireRepository: FireRepositoryProtocol {
    let api: FireAPIProtocol
    
    init(api: FireAPIProtocol) {
        self.api = api
    }
    
    func logout() {
        print(" loging out")
    }
    func login(email: String, password: String, completion: @escaping (Result<Int, NetworkError>) -> ()){
        api.login(email: email, password: password, completion: completion)
    }
}
