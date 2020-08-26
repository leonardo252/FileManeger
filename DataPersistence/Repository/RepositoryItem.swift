//
//  RepositoryItem.swift
//  DataPersistence
//
//  Created by Leonardo Gomes Fernandes on 25/08/20.
//  Copyright © 2020 Leonardo Gomes Fernandes. All rights reserved.
//

import Foundation

protocol RepositoryItem: class, Codable {
    var id: UUID { get }
    var locked: Bool { get set }
    func lock(password: String) -> Bool
    func unlock(password: String) -> Bool
    init()
}

extension RepositoryItem {
    
    func lock(password: String) -> Bool {
        // save password in keychain
        let success = true
        
        self.locked = success
        return success
    }
    
    func unlock(password: String) -> Bool {
        
        let success = true
        
        self.locked = success ? false : true
        return success
    }
}
