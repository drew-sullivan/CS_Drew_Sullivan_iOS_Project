//
//  BankListDataProviderTests.swift
//  Drew_Sullivan_CS_iOS_ProjectTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class AccountListDataProviderTests: XCTestCase {
    
    var controller: AccountListViewController!
    var sut: AccountListDataProvider!
    var tableView: UITableView!

    override func setUp() {
        super.setUp()
        
        sut = AccountListDataProvider()
        sut.accountDataManager = AccountDataManager.shared
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "AccountListViewController") as? AccountListViewController
        
        controller.loadViewIfNeeded()

        tableView = controller.tableView
        tableView.dataSource = sut
    }

    override func tearDown() {
        AccountDataManager.shared.clear()
        
        super.tearDown()
    }

    func test_number_of_sections_is_one() {
        XCTAssertEqual(tableView.numberOfSections, 1)
    }
    
    func test_number_of_rows_in_section_one_is_equal_to_num_accounts() {
        sut.accountDataManager?.add(Account(isSample: true))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.accountDataManager?.add(Account(isSample: true))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_cell_for_row_at_returns_account_cell() {
        sut.accountDataManager?.add(Account(isSample: true))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is AccountTableViewCell)
    }
    
    func test_cell_for_row_dequeues_cell_from_table_view() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(MockAccountCell.self, forCellReuseIdentifier: "AccountTableViewCell")

        sut.accountDataManager?.add(Account(isSample: true))
        mockTableView.reloadData()

        let _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mockTableView.cellWasDequeued)
    }
    
    func test_cell_for_row_at_calls_config_cell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(MockAccountCell.self, forCellReuseIdentifier: "AccountTableViewCell")
        
        let account = Account(isSample: true)
        sut.accountDataManager?.add(account)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockAccountCell
        
        if let testAccount = cell.caughtAccount {
            XCTAssertEqual(testAccount, account)
        } else {
            XCTFail()
        }
    }
    
    func test_selecting_a_cell_sends_notification() {
        let account = Account(isSample: true)
        sut.accountDataManager?.add(account)
        
        expectation(forNotification: NSNotification.Name(rawValue: "AccountSelectedNotification"), object: nil) { (notification) -> Bool in
            guard let index = notification.userInfo?["index"] as? Int else { return false }
            return index == 0
        }
        
        tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        waitForExpectations(timeout: 3, handler: nil)
    }

}

extension AccountListDataProviderTests {
    
    class MockTableView: UITableView {
        var cellWasDequeued = false
        var dataWasReloaded = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellWasDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        override func reloadData() {
            dataWasReloaded = true
            return super.reloadData()
        }
    }
    
    class MockAccountCell: AccountTableViewCell {
        var caughtAccount: Account?
        
        override func configCell(with account: Account) {
            caughtAccount = account
        }
    }
    
}
