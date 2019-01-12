//
//  BankDetailViewControllerTests.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import BankPractice

class BankDetailViewControllerTests: XCTestCase {
    
    var sut: BankDetailViewController!
    var bank: Bank!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "BankDetailViewController") as? BankDetailViewController
        sut.loadViewIfNeeded()
        
        bank = Bank(isSample: true)
        let bankDataManager = BankDataManager.shared
        bankDataManager.add(bank)
        sut.bank = bank
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_has_roi_label() {
        XCTAssertTrue(sut.roiLabel.isDescendant(of: sut.view))
    }
    
    func test_setting_bank_info_sets_label_text() {
       XCTAssertEqual(sut.roiLabel.text, "\(bank.ROI)")
    }

}
