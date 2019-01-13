//
//  BankListDataProvider.swift
//  Drew_Sullivan_CS_iOS_Project
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class AccountListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate, AccountDataManagerSettable {
    
    public var accountDataManager: AccountDataManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountDataManager?.numAccounts ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
        
        guard let accountDataManager = accountDataManager else { fatalError() }
        
        let account = accountDataManager.account(at: indexPath.row)
        cell.configCell(with: account)
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("AccountSelectedNotification"), object: self, userInfo: ["index": indexPath.row])
    }
    
}

@objc protocol AccountDataManagerSettable {
    var accountDataManager: AccountDataManager? { get set }
}
