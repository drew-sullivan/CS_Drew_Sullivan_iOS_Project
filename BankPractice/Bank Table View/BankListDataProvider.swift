//
//  BankListDataProvider.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class BankListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate, BankDataManagerSettable {
    
    public var bankDataManager: BankDataManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankDataManager?.numBanks ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankTableViewCell", for: indexPath) as! BankTableViewCell
        
        guard let bankDataManager = bankDataManager else { fatalError() }
        
        let bank = bankDataManager.bank(at: indexPath.row)
        cell.configCell(with: bank)
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("BankSelectedNotification"), object: self, userInfo: ["index": indexPath.row])
    }
    
}

@objc protocol BankDataManagerSettable {
    var bankDataManager: BankDataManager? { get set }
}
