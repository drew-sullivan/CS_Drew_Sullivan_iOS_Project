//
//  BankTableViewCellTests.swift
//  Drew_Sullivan_CS_iOS_ProjectTests
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class AccountTableViewCellTests: XCTestCase {
    
    var cell: AccountTableViewCell!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AccountListViewController") as! AccountListViewController
        
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: IndexPath(row: 0, section: 0)) as? AccountTableViewCell
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_cell_has_account_name_label() {
        XCTAssertTrue(cell.accountNameLabel.isDescendant(of: cell.contentView))
    }
    
    func test_cell_has_amount_label() {
        XCTAssertTrue(cell.amountLabel.isDescendant(of: cell.contentView))
    }
    
    func test_config_cell_sets_account_name_label() {
        cell.configCell(with: Account(isSample: true))
        XCTAssertEqual(cell.accountNameLabel.text, "Foo Account")
    }
    
    func test_config_cell_sets_amount_label() {
        cell.configCell(with: Account(isSample: true))
        XCTAssertEqual(cell.amountLabel.text, "$100.00")
    }

}

extension AccountTableViewCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
