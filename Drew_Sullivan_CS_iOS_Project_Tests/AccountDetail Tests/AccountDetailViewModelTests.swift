//
//  BankDetailViewModelTests.swift
//  Drew_Sullivan_CS_iOS_ProjectTests
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class AccountDetailViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_text_color_is_white() {
        let account = Account(isSample: true)
        let sut = AccountDetailViewModel(account: account)
        XCTAssertEqual(sut.textColor, UIColor.white)
    }
    
    func test_when_roi_is_positive_background_color_is_green() {
        let account = Account(name: "Foo Account", amount: 0.0, ROI: 1.0, id: 1)
        let sut = AccountDetailViewModel(account: account)
        XCTAssertEqual(sut.backgroundColorBasedOnROI, UIColor.green)
    }
    
    func test_when_roi_is_0_background_color_is_red() {
        let account = Account(name: "Foo Account", amount: 0.0, ROI: 0.0, id: 1)
        let sut = AccountDetailViewModel(account: account)
        XCTAssertEqual(sut.backgroundColorBasedOnROI, UIColor.red)
    }
    
    func test_when_roi_is_not_positive_background_color_is_red() {
        let account = Account(name: "Foo Account", amount: 0.0, ROI: -1.0, id: 1)
        let sut = AccountDetailViewModel(account: account)
        XCTAssertEqual(sut.backgroundColorBasedOnROI, UIColor.red)
    }

}
