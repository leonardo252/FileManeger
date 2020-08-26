//
//  OnBoardViewController.swift
//  DataPersistence
//
//  Created by Leonardo Gomes Fernandes on 25/08/20.
//  Copyright © 2020 Leonardo Gomes Fernandes. All rights reserved.
//

import UIKit

class OnBoardViewController: UIViewController {

    let box: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 50, height: 50)
        view.frame.origin = CGPoint(x: 200, y: 300)
        view.backgroundColor = .red
        return view
    }()

    let box1: UIView = {
           let view = UIView()
           view.frame.size = CGSize(width: 50, height: 50)
           view.frame.origin = CGPoint(x: 100, y: 400)
           view.backgroundColor = .blue
           return view
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .white
        view.addSubview(box)
        view.addSubview(box1)
        box1.frame.origin = CGPoint(x: 200, y: 100)
        
    }

}
