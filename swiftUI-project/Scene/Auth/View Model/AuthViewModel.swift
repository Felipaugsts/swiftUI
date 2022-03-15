//
//  AuthViewModel.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 15/03/22.
//

import Foundation

class AuthViewModel {
    var repository: FireRepositoryProtocol
    
    init(repository: FireRepositoryProtocol) {
        self.repository = repository
    }
    
    func tap(email: String, password: String, completion: @escaping (String) ->()) {
        repository.login(email: email, password: password) { result in
            switch result {
            case .success(let num):
                print("\(num)")
                completion("\(num)")
            case .failure(let error):
                print("error", error)
                completion("\(error)")
            }
        }
    }
}
