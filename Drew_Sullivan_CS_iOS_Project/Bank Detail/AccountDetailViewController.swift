//
//  BankDetailViewController.swift
//  Drew_Sullivan_CS_iOS_Project
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {
    
    var accountDetailViewModel: AccountDetailViewModel!
    
    @IBOutlet var roiLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        roiLabel.text = accountDetailViewModel.roi
        roiLabel.textColor = accountDetailViewModel.textColor
        view.backgroundColor = accountDetailViewModel.backgroundColorBasedOnROI
    }
    
}
