//
//  BankDetailViewController.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class BankDetailViewController: UIViewController {
    
    var bank: Bank!
    
    @IBOutlet var roiLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard bank != nil else { return }
        
        roiLabel.text = "\(bank.ROI)"
        roiLabel.textColor = UIColor.white
    }
    
}
