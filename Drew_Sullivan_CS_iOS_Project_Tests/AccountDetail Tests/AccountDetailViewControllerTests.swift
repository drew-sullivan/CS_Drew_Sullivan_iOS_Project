//
//  BankDetailViewControllerTests.swift
//  Drew_Sullivan_CS_iOS_ProjectTests
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class AccountDetailViewControllerTests: XCTestCase {
    
    var sut: AccountDetailViewController!
    var account: Account!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "AccountDetailViewController") as? AccountDetailViewController
        sut.loadViewIfNeeded()
        
        account = Account(isSample: true)
        let accountDataManager = AccountDataManager.shared
        accountDataManager.add(account)
        let accountDetailViewModel = AccountDetailViewModel(account: account)
        sut.accountDetailViewModel = accountDetailViewModel
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_has_roi_label() {
        XCTAssertTrue(sut.roiLabel.isDescendant(of: sut.view))
    }
    
    func test_setting_account_info_sets_label_text() {
       XCTAssertEqual(sut.roiLabel.text, "9.9%")
    }

}
