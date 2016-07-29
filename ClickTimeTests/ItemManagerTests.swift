//
//  ItemManagerTests.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/27/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import XCTest

@testable import ClickTime

class ItemManagerTests: XCTestCase {
    
    var sut: ItemManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = ItemManager()
    }
    
    override func tearDown() {
        sut.removeAllItems()
        sut = nil
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testItemCount_Initially_ShouldBeZero() {
        let expectedCount = 0
        
        XCTAssertEqual(sut.itemsCount, expectedCount, "itemsCount should be \(expectedCount)")
    }
    
    func testItemCount_AfterAddingOneItem_IsOne() {
        sut.addItem(Item(title: "Test title"))
        
        let expectedCount = 1
        
        XCTAssertEqual(sut.itemsCount, expectedCount, "itemsCount should be \(expectedCount)")
    }
    
    func testItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = Item(title: "Item")
        
        sut.addItem(item)
        
        let returnedItem = sut.itemAtIndex(0)
        
        XCTAssertEqual(item, returnedItem, "should be the same item")
    }
    
    func testRemoveAllItems_ShouldResultInCountsBeZero() {
        sut.addItem(Item(title: "First"))
        sut.addItem(Item(title: "Second"))
        
        var expectedCount = 2
        
        XCTAssertEqual(sut.itemsCount, expectedCount, "itemsCount should be \(expectedCount)")
        
        sut.removeAllItems()
        
        expectedCount = 0
        
        XCTAssertEqual(sut.itemsCount, expectedCount, "itemsCount should be \(expectedCount)")
    }
    
    func testAddingTheSameItem_DoesNotIncreaseCount() {
        sut.addItem(Item(title: "First"))
        sut.addItem(Item(title: "First"))
        
        let expectedCount = 1
        
        XCTAssertEqual(sut.itemsCount, expectedCount, "itemsCount should be \(expectedCount)")
    }
}
