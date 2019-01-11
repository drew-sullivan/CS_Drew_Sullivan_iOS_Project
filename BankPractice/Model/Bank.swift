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
        self.name = "drew"
        self.amount = Double.random(in: 0...3)
        self.ROI = Double.random(in: 0...3)
        self.id = Int.random(in: 1...100)
    }
    
    public static func ==(lhs: Bank, rhs: Bank) -> Bool {
        return lhs.id == rhs.id
    }
}
