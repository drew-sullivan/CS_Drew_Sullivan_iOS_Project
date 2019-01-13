//
//  BankCellViewModel.swift
//  Drew_Sullivan_CS_iOS_Project
//
//  Created by Drew Sullivan on 1/13/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit
import Foundation

class AccountCellViewModel {
    
    private let account: Account
    
    public init(account: Account) {
        self.account = account
    }
    
    public var formattedAmount: String {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        if let formattedAmount = nf.string(from: account.amount as NSNumber) {
            return formattedAmount
        } else {
            return "N/A"
        }
    }
}
