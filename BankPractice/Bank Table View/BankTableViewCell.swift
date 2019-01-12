//
//  BankTableViewCell.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class BankTableViewCell: UITableViewCell {
    
    @IBOutlet var accountNameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    func configCell(with bank: Bank) {
        accountNameLabel.text = bank.name
        amountLabel.text = "\(bank.amount)"
    }
}
