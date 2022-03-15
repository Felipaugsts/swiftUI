//
//  Container.swift
//  swiftUI-project
//
//  Created by FELIPE AUGUSTO SILVA on 15/03/22.
//

import Foundation
import Swinject

class FireContainer {
    public static var shared: Container {
       let container = Container()
        
        container.register(FireAPIProtocol.self) { _ in FireAPI()}
        
        container.register(FireRepository.self) { r in FireRepository(api: r.resolve(FireAPIProtocol.self)!) }
        
        

        container.register(AuthViewModel.self) { r in AuthViewModel(repository: r.resolve(FireRepository.self)! as! FireRepositoryProtocol)}
        
        
        return container
    }
}
