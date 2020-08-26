//
//  ViewController.swift
//  DataPersistence
//
//  Created by Leonardo Gomes Fernandes on 25/08/20.
//  Copyright © 2020 Leonardo Gomes Fernandes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
//    private var placeRepository: PlacesRepository {
//        PlacesRepository()
//    }
    
    private var placeRepository = PlacesRepository()

    var index: Int = 0
    
    lazy var button:UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newPlace))
        barButton.style = .done
        return barButton
    }()
    
    let box: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 50, height: 50)
        view.frame.origin = CGPoint(x: 100, y: 300)
        view.backgroundColor = .black
        return view
    }()

    let box1: UIView = {
           let view = UIView()
           view.frame.size = CGSize(width: 50, height: 50)
           view.frame.origin = CGPoint(x: 200, y: 300)
           view.backgroundColor = .green
           return view
       }()
    
    let id: UILabel = {
       let label = UILabel()
        label.frame.size = CGSize(width: 400, height: 100)
        return label
    }()
    let name: UILabel = {
       let label = UILabel()
        label.frame.size = CGSize(width: 400, height: 100)
        label.frame.origin = CGPoint(x: 0, y: 100)
        return label
    }()
    let address: UILabel = {
       let label = UILabel()
        label.frame.size = CGSize(width: 400, height: 100)
        label.frame.origin = CGPoint(x: 0, y: 200)
        return label
    }()
    
    let id2: UILabel = {
       let label = UILabel()
        label.frame.size = CGSize(width: 400, height: 100)
        label.frame.origin = CGPoint(x: 0, y: 200)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = button

        super.viewWillAppear(true)
        view.backgroundColor = .orange
        
        view.addSubview(box)
        view.addSubview(box1)
        box1.frame.origin = CGPoint(x: 200, y: 300)
        view.addSubview(id)
//        view.addSubview(name)
//        view.addSubview(address)
        view.addSubview(id2)
        
//        placeRepository.readAllItems()
        var last = placeRepository.items.count
        print("Count of PlaceRepository before readALL: \(last)")
        placeRepository.readAllItems()
        last = placeRepository.items.count
        print("Count of PlaceRepository after readALL: \(last)")
    }

    @objc func newPlace() {
        if let newPlace = placeRepository.createNewItem() {
            print(newPlace.id)
            self.id.text = newPlace.id.uuidString
            self.name.text = newPlace.name
            self.address.text = newPlace.address
            print("id: "+placeRepository.items[index].id.uuidString+" name: "+placeRepository.items[index].name)

            newPlace.name = "new Name"
            print("id: "+placeRepository.items[index].id.uuidString+" name: "+placeRepository.items[index].name)
            
            placeRepository.updateItem(item: newPlace)
            print("id: "+placeRepository.items[index].id.uuidString+" name: "+placeRepository.items[index].name)
            index += 1
            
        }
    }

}

