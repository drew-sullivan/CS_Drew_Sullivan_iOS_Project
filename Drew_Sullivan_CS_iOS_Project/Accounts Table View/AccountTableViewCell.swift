//
//  BankTableViewCell.swift
//  Drew_Sullivan_CS_iOS_Project
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    @IBOutlet var accountNameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
        
    func configCell(with account: Account) {
        let accountCellViewModel = AccountCellViewModel(account: account)
        accountNameLabel.text = account.name
        amountLabel.text = accountCellViewModel.formattedAmount
    }
}
