//
//  BankDetailViewModel.swift
//  Drew_Sullivan_CS_iOS_Project
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class AccountDetailViewModel {
    
    private let account: Account
    public var textColor = UIColor.white
    
    public init(account: Account) {
        self.account = account
    }
    
    public var title: String {
        return account.name
    }
    
    public var roi: String {
        let nf = NumberFormatter()
        nf.numberStyle = NumberFormatter.Style.percent
        nf.multiplier = 1
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        if let formattedPercentage = nf.string(from: (account.ROI as NSNumber)) {
            return formattedPercentage
        } else {
            return "Error"
        }
    }
    
    public var backgroundColorBasedOnROI: UIColor {
        let roi = account.ROI
        if roi > 0.0 {
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
}
