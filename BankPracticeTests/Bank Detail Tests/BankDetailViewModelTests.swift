//
//  BankDetailViewModelTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class BankDetailViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_text_color_is_white() {
        let bank = Bank(isSample: true)
        let sut = BankDetailViewModel(bank: bank)
        XCTAssertEqual(sut.textColor, UIColor.white)
    }
    
    func test_when_roi_is_positive_background_color_is_green() {
        let bank = Bank(name: "Foo Bank", amount: 0.0, ROI: 1.0, id: 1)
        let sut = BankDetailViewModel(bank: bank)
        XCTAssertEqual(sut.backgroundColorBasedOnROI, UIColor.green)
    }
    
    func test_when_roi_is_0_background_color_is_red() {
        let bank = Bank(name: "Foo Bank", amount: 0.0, ROI: 0.0, id: 1)
        let sut = BankDetailViewModel(bank: bank)
        XCTAssertEqual(sut.backgroundColorBasedOnROI, UIColor.red)
    }
    
    func test_when_roi_is_not_positive_background_color_is_red() {
        let bank = Bank(name: "Foo Bank", amount: 0.0, ROI: -1.0, id: 1)
        let sut = BankDetailViewModel(bank: bank)
        XCTAssertEqual(sut.backgroundColorBasedOnROI, UIColor.red)
    }

}
