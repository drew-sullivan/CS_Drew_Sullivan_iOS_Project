//
//  BankListViewController.swift
//  Drew_Sullivan_CS_iOS_Project
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class AccountListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & AccountDataManagerSettable)!
    
    let accountDataManager = AccountDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        dataProvider.accountDataManager = accountDataManager
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        accountDataManager.fetchAccountDataFromAPI { (dataIsLoaded) in
            if dataIsLoaded {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AccountDetailViewSegue"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                if let account = dataProvider.accountDataManager?.account(at: row) {
                    let accountDetailViewModel = AccountDetailViewModel(account: account)
                    let accountDetailViewController = segue.destination as! AccountDetailViewController
                    accountDetailViewController.accountDetailViewModel = accountDetailViewModel
                }
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
}
