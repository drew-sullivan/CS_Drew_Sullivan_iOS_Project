//
//  Bank.swift
//  Drew_Sullivan_CS_iOS_Project
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import Foundation

public struct Account: Equatable, Codable {
    let name: String
    let amount: Double
    let ROI: Double
    let id: Int
    
    init(name: String, amount: Double, ROI: Double, id: Int) {
        self.name = name
        self.amount = amount
        self.ROI = ROI
        self.id = id
    }
    
    init(isSample: Bool) {
        self.name = "Foo Account"
        self.amount = 100.0
        self.ROI = 9.9
        self.id = 1
    }
    
    public static func ==(lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id
    }
}
