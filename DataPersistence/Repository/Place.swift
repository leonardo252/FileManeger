//
//  Place.swift
//  DataPersistence
//
//  Created by Leonardo Gomes Fernandes on 25/08/20.
//  Copyright © 2020 Leonardo Gomes Fernandes. All rights reserved.
//

import Foundation

class Place: RepositoryItem {

    static let placeholder: (name: String, address: String) = (name: "Untitled Note",
                                                                address: "It's your story to tell.")
    
    required init() {
        self.id = UUID()
        self.name = Self.placeholder.name
        self._address = Self.placeholder.address
        self.locked = false
    }
    
    let id: UUID
    var name: String
    private var _address: String
    var address:  String{
        get { locked ? "Classified." : _address}
        set { _address = locked ? _address : newValue}
    }
    var locked: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, name, _address = "address", locked
    }
}
