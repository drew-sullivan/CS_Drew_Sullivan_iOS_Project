//
//  BankTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class AccountTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_init_sets_expected_member_var() {
        let account = Account(isSample: true)
        XCTAssertEqual(account.name, "Foo Account", "Names should be equal")
    }

}
