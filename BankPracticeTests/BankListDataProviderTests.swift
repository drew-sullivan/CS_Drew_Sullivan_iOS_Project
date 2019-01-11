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
    
    var dataProvider: BankListDataProvider!
    var tableView: UITableView!

    override func setUp() {
        super.setUp()
        
        dataProvider = BankListDataProvider()
        dataProvider.bankDataManager = BankDataManager.shared
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BankListViewController") as! BankListViewController
        
        vc.loadViewIfNeeded()

        tableView = vc.tableView
        tableView.dataSource = dataProvider
    }

    override func tearDown() {
        BankDataManager.shared.clear()
        
        super.tearDown()
    }

    func test_number_of_sections_is_one() {
        XCTAssertEqual(tableView.numberOfSections, 1)
    }
    
    func test_number_of_rows_in_section_one_is_equal_to_num_banks() {
        dataProvider.bankDataManager?.add(Bank(isSample: true))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        dataProvider.bankDataManager?.add(Bank(isSample: true))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_cell_for_row_at_returns_bank_cell() {
        dataProvider.bankDataManager?.add(Bank(isSample: true))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is BankTableViewCell)
    }
    
    func test_cell_for_row_dequeues_cell_from_table_view() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = dataProvider
        mockTableView.register(BankTableViewCell.self, forCellReuseIdentifier: "BankTableViewCell")
        
        dataProvider.bankDataManager?.add(Bank(isSample: true))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellWasDequeued)
    }
    
    func test_cell_for_row_at_calls_config_cell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = dataProvider
        mockTableView.register(MockBankCell.self, forCellReuseIdentifier: "BankTableViewCell")
        
        let bank = Bank(isSample: true)
        dataProvider.bankDataManager?.add(bank)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockBankCell
        
        if let testBank = cell.caughtBank {
            XCTAssertEqual(testBank, bank)
        } else {
            XCTFail()
        }
    }

}

extension BankListDataProviderTests {
    
    class MockTableView: UITableView {
        var cellWasDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellWasDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockBankCell: BankTableViewCell {
        var caughtBank: Bank?
        
        override func configCell(with bank: Bank) {
            caughtBank = bank
        }
    }
    
}
