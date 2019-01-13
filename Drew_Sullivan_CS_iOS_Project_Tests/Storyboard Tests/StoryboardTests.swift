//
//  StoryboardTests.swift
//  Drew_Sullivan_CS_iOS_ProjectTests
//
//  Created by Drew Sullivan on 1/13/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class StoryboardTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_initial_view_controller_is_account_table_view_controller() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is AccountListViewController)
    }

}
