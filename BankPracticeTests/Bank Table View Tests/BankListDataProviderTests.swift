//
//  BankListDataProviderTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class BankListDataProviderTests: XCTestCase {
    
    var controller: BankListViewController!
    var sut: BankListDataProvider!
    var tableView: UITableView!

    override func setUp() {
        super.setUp()
        
        sut = BankListDataProvider()
        sut.bankDataManager = BankDataManager.shared
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "BankListViewController") as? BankListViewController
        
        controller.loadViewIfNeeded()

        tableView = controller.tableView
        tableView.dataSource = sut
    }

    override func tearDown() {
        BankDataManager.shared.clear()
        
        super.tearDown()
    }

    func test_number_of_sections_is_one() {
        XCTAssertEqual(tableView.numberOfSections, 1)
    }
    
    func test_number_of_rows_in_section_one_is_equal_to_num_banks() {
        sut.bankDataManager?.add(Bank(isSample: true))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.bankDataManager?.add(Bank(isSample: true))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_cell_for_row_at_returns_bank_cell() {
        sut.bankDataManager?.add(Bank(isSample: true))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is BankTableViewCell)
    }
    
    func test_cell_for_row_dequeues_cell_from_table_view() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(MockBankCell.self, forCellReuseIdentifier: "BankTableViewCell")

        sut.bankDataManager?.add(Bank(isSample: true))
        mockTableView.reloadData()

        let _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mockTableView.cellWasDequeued)
    }
    
    func test_cell_for_row_at_calls_config_cell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(MockBankCell.self, forCellReuseIdentifier: "BankTableViewCell")
        
        let bank = Bank(isSample: true)
        sut.bankDataManager?.add(bank)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockBankCell
        
        if let testBank = cell.caughtBank {
            XCTAssertEqual(testBank, bank)
        } else {
            XCTFail()
        }
    }
    
    func test_selecting_a_cell_sends_notification() {
        let bank = Bank(isSample: true)
        sut.bankDataManager?.add(bank)
        
        expectation(forNotification: NSNotification.Name(rawValue: "BankSelectedNotification"), object: nil) { (notification) -> Bool in
            guard let index = notification.userInfo?["index"] as? Int else { return false }
            return index == 0
        }
        
        tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        waitForExpectations(timeout: 3, handler: nil)
    }

}

extension BankListDataProviderTests {
    
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
    
    class MockBankCell: BankTableViewCell {
        var caughtBank: Bank?
        
        override func configCell(with bank: Bank) {
            caughtBank = bank
        }
    }
    
}
