//
//  BankCellViewModelTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/13/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class BankCellViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_bank_amount_when_valid_gets_formatted() {
        let bank = Bank(isSample: true)
        let bankCellViewModel = BankCellViewModel(bank: bank)
        XCTAssertEqual(bankCellViewModel.formattedAmount, "$100.00")
    }

}
