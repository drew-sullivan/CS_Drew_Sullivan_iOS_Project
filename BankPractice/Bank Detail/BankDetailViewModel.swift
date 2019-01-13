//
//  BankDetailViewModel.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class BankDetailViewModel {
    private let bank: Bank
    
    public var textColor = UIColor.white
    
    public init(bank: Bank) {
        self.bank = bank
    }
    
    public var roi: String {
        return "\(bank.ROI)"
    }
    
    public var backgroundColorBasedOnROI: UIColor {
        let roi = bank.ROI
        if roi > 0.0 {
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
}
