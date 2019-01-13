//
//  BankCellViewModel.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/13/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit
import Foundation

class BankCellViewModel {
    private let bank: Bank
    
    public init(bank: Bank) {
        self.bank = bank
    }
    
    public var formattedAmount: String {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        if let formattedAmount = nf.string(from: bank.amount as NSNumber) {
            return formattedAmount
        } else {
            return "N/A"
        }
    }
}
