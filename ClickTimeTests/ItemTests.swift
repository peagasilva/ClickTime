//
//  ItemTests.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/27/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import XCTest

@testable import ClickTime

class ItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldSetTitle() {
        let item = Item(title: "Test title")
        
        let expectedTitle = "Test title"
        
        XCTAssertNotNil(item, "should not be nil.")
        XCTAssertEqual(item.title, expectedTitle, "should be \(expectedTitle).")
    }
    
    func testInit_ShouldSetTitleAndTimestamp() {
        let item = Item(title: "Test title", timestamp: 0.0)
        
        let expectedTitle = "Test title"
        let expectedTimestamp = 0.0
        
        XCTAssertNotNil(item, "should not be nil.")
        XCTAssertEqual(item.title, expectedTitle, "should be \(expectedTitle).")
        XCTAssertEqual(0.0, item.timestamp, "should be \(expectedTimestamp).")
    }
    
    func testEqualItems_ShouldBeEqual() {
        let firstItem = Item(title: "First")
        let secondItem = Item(title: "First")
        
        XCTAssertNotNil(firstItem, "firstItem should not be nil.")
        XCTAssertNotNil(secondItem, "secondItem should not be nil.")
        XCTAssertEqual(firstItem, secondItem, "items should be equal")
        
    }
    func testWhenTitleIsDifferent_ShouldBeNotEqual() {
        let firstItem = Item(title: "First title")
        let secondItem = Item(title: "Second title")
        
        XCTAssertNotNil(firstItem, "firstItem should not be nil.")
        XCTAssertNotNil(secondItem, "secondItem should not be nil.")
        XCTAssertNotEqual(firstItem, secondItem, "items should be different.")
    }
    
    func testWhenTimestampIsDifferent_ShouldBeNotEqual() {
        let firstItem = Item(title: "First title", timestamp: 1.0)
        let secondItem = Item(title: "Second title", timestamp: 0.0)
        
        XCTAssertNotNil(firstItem, "firstItem should not be nil.")
        XCTAssertNotNil(secondItem, "secondItem should not be nil.")
        XCTAssertNotEqual(firstItem, secondItem, "items should be different.")
    }
}
