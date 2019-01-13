//
//  BankCellViewModelTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/13/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class AccountCellViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_account_amount_when_valid_gets_formatted() {
        let account = Account(isSample: true)
        let accountCellViewModel = AccountCellViewModel(account: account)
        XCTAssertEqual(accountCellViewModel.formattedAmount, "$100.00")
    }

}
