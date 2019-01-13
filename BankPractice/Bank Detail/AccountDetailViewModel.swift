//
//  BankDetailViewModel.swift
//  BankPractice
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
    
    public var roi: String {
        return "\(account.ROI)"
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
