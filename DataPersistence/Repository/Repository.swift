//
//  Repository.swift
//  DataPersistence
//
//  Created by Leonardo Gomes Fernandes on 25/08/20.
//  Copyright © 2020 Leonardo Gomes Fernandes. All rights reserved.
//

import Foundation
 
protocol Repository: class {
    
    associatedtype Item: RepositoryItem
    
    var items: [Item] { get set }
    
    func createNewItem() -> Item?
    func readAllItems() -> [Item]
    func readItem(id: UUID) -> Item?
    func updateItem(item: Item)
    func deleteItem(id: UUID)
    func lock(id: UUID, password: String) -> Bool
    func unlock(id: UUID, password: String) -> Bool
}

extension Repository {
    
    func createNewItem() -> Item? {
        
        let newItem = Item()
        items.append(newItem)
        if let data = try? JSONEncoder().encode(newItem) {
            FileHelper().createFile(with: data, name: newItem.id.uuidString)
        }
        return newItem
    }
    
    func readAllItems() -> [Item] {
        
        let fileNames: [String] = FileHelper().contentsForDirectory(atPath: "")
        
        self.items = fileNames.compactMap { (fileName) -> Item? in
            if let data = FileHelper().retrieveFile(at: fileName) {
                let item = try? JSONDecoder().decode(Item.self, from: data)
                return item
            }
            return nil
        }
        
        return items
    }
    
    func readItem(id: UUID) -> Item? {
        
        return readAllItems().first(where: { $0.id == id})
    }
    
    func updateItem(item: Item) {
        
        self.items = items.map { $0.id == item.id ? item : $0 }
    }
    
    func deleteItem(id: UUID) {
        
    }
    
    func lock(id: UUID, password: String) -> Bool {
        
        guard let item = readItem(id: id) else { return false }
        
        if item.lock(password: password) {
            
            updateItem(item: item)
            return true
        }
        return false
    }
    
    func unlock(id: UUID, password: String) -> Bool {
        
        guard let item = readItem(id: id) else { return false }
        
        if item.unlock(password: password) {
            updateItem(item: item)
            return true
        }
        return false
    }
    
}
