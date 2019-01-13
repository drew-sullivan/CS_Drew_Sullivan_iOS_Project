//
//  Drew_Sullivan_CS_iOS_ProjectUITests.swift
//  Drew_Sullivan_CS_iOS_ProjectUITests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class AccountPracticeUITests: XCTestCase {
    
    let tableName = "AccountListViewController"
    var app: XCUIApplication!
    var table: XCUIElement!

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
        app = XCUIApplication()
        table = app.tables[tableName]

    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_row_tap_segues_to_detail_and_back() {
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Royal Bank of Canada"]/*[[".cells.staticTexts[\"Royal Bank of Canada\"]",".staticTexts[\"Royal Bank of Canada\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Royal Bank of Canada"].buttons["Accounts"].tap()
    }

}
