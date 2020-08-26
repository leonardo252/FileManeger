//
//  OnBoardingStatusModel.swift
//  DataPersistence
//
//  Created by Leonardo Gomes Fernandes on 25/08/20.
//  Copyright © 2020 Leonardo Gomes Fernandes. All rights reserved.
//

import Foundation

struct OnBoardingStatus: Codable {
    static let plistName: String = "OnBoardingStatus"
    
    let firstLaunch: Bool = true
    let firstLaunchTimestamp: TimeInterval = Date().timeIntervalSince1970
    
    private enum CodingKeys: String, CodingKey {
        case firstLaunch, firstLaunchTimestamp
    }
}
