//
//  BankListViewController.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class BankListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & BankDataManagerSettable)!
    
    let bankDataManager = BankDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        dataProvider.bankDataManager = bankDataManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bankDataManager.fetchBankData { (isDone) in
            if isDone {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "BankDetailViewSegue"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                if let bank = dataProvider.bankDataManager?.bank(at: row) {
                    let bankDetailViewModel = BankDetailViewModel(bank: bank)
                    let bankDetailViewController = segue.destination as! BankDetailViewController
                    bankDetailViewController.bankDetailViewModel = bankDetailViewModel
                }
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
}
