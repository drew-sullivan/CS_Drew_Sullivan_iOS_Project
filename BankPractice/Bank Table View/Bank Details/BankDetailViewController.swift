//
//  BankDetailViewController.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class BankDetailViewController: UIViewController {
    
    var bankDetailViewModel: BankDetailViewModel!
    
    @IBOutlet var roiLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        roiLabel.text = bankDetailViewModel.roi
        roiLabel.textColor = bankDetailViewModel.textColor
        view.backgroundColor = bankDetailViewModel.backgroundColorBasedOnROI
    }
    
}
