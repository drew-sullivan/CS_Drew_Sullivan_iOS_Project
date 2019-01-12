//
//  BankListViewControllerTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class BankListViewControllerTests: XCTestCase {
    
    var vc: BankListViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "BankListViewController") as? BankListViewController
        vc.loadViewIfNeeded()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_table_view_is_not_nil_after_viewDidLoad() {
        XCTAssertNotNil(vc)
    }
    
    func test_tableView_after_viewDidLoad_is_not_nil() {
        XCTAssertNotNil(vc.tableView)
    }
    
    func test_loading_view_sets_table_view_data_source() {
        XCTAssertTrue(vc.tableView.dataSource is BankListDataProvider)
    }
    
    func test_loading_view_sets_tableView_delegate() {
        XCTAssertTrue(vc.tableView.delegate is BankListDataProvider)
    }
    
    func test_loading_view_data_source_is_delegate() {
        XCTAssertEqual(vc.tableView.delegate as? BankListDataProvider, vc.tableView.dataSource as? BankListDataProvider)
    }
}
