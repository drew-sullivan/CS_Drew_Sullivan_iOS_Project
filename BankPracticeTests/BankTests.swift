//
//  BankTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class BankTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_sets_expected_member_var() {
        let name = "Foo"
        let bank = Bank(name: "Foo", amount: 3.14, ROI: 2.18, id: 1)
        XCTAssertEqual(bank.name, name, "Names should be equal")
    }

}
