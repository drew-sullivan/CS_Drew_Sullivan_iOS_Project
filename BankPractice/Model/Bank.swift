//
//  Bank.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import Foundation

public struct Bank: Equatable {
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
        self.name = "Foo Bank"
        self.amount = 100.0
        self.ROI = 99.0
        self.id = 1
    }
    
    public static func ==(lhs: Bank, rhs: Bank) -> Bool {
        return lhs.id == rhs.id
    }
}
