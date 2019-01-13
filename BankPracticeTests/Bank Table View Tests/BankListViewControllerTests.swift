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
    
    var sut: BankListViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "BankListViewController") as? BankListViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_table_view_is_not_nil_after_viewDidLoad() {
        XCTAssertNotNil(sut)
    }
    
    func test_tableView_after_viewDidLoad_is_not_nil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_loading_view_sets_table_view_data_source() {
        XCTAssertTrue(sut.tableView.dataSource is BankListDataProvider)
    }
    
    func test_loading_view_sets_tableView_delegate() {
        XCTAssertTrue(sut.tableView.delegate is BankListDataProvider)
    }
    
    func test_loading_view_data_source_is_delegate() {
        XCTAssertEqual(sut.tableView.delegate as? BankListDataProvider, sut.tableView.dataSource as? BankListDataProvider)
    }
    
    func test_view_did_load_sets_bank_data_manager_to_data_provider() {
        XCTAssertTrue(sut.bankDataManager === sut.dataProvider.bankDataManager)
    }
}

extension BankListViewControllerTests {
    
    class MockNavigationController: UINavigationController {
        var lastPushedController: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            lastPushedController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
    
}
