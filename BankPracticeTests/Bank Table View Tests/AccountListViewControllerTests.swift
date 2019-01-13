//
//  BankListViewControllerTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class AccountListViewControllerTests: XCTestCase {
    
    var sut: AccountListViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "AccountListViewController") as? AccountListViewController
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
        XCTAssertTrue(sut.tableView.dataSource is AccountListDataProvider)
    }
    
    func test_loading_view_sets_tableView_delegate() {
        XCTAssertTrue(sut.tableView.delegate is AccountListDataProvider)
    }
    
    func test_loading_view_data_source_is_delegate() {
        XCTAssertEqual(sut.tableView.delegate as? AccountListDataProvider, sut.tableView.dataSource as? AccountListDataProvider)
    }
    
    func test_view_did_load_sets_account_data_manager_to_data_provider() {
        XCTAssertTrue(sut.accountDataManager === sut.dataProvider.accountDataManager)
    }
}

extension AccountListViewControllerTests {
    
    class MockNavigationController: UINavigationController {
        var lastPushedController: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            lastPushedController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
    
}
