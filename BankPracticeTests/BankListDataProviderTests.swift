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

        tableView = UITableView()
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
        dataProvider.bankDataManager?.add(Bank(name: "Foo", amount: 1.0, ROI: 1.0, id: 1))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        dataProvider.bankDataManager?.add(Bank(name: "Bar", amount: 1.0, ROI: 1.0, id: 2))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_cell_for_row_at_returns_bank_cell() {
        dataProvider.bankDataManager?.add(Bank(name: "Bar", amount: 1.0, ROI: 1.0, id: 2))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is BankTableViewCell)
    }

}
