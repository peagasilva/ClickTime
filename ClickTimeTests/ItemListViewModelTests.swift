//
//  ItemListViewModelTests.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/28/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import XCTest
import RxSwift

@testable import ClickTime

class ItemListViewModelTests: XCTestCase {
    
    var sut: ItemListViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = ItemListViewModel()
        
        XCTAssertNotNil(sut)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddItem() {
        sut.createItem()
        
        let expectedCount = 1
        
        XCTAssertEqual(sut.itemManager.itemsCount, expectedCount, "itemCount should be 1.")
        
        let item = sut.itemAtIndex(0)
        
        XCTAssertNotNil(item)
    }
    
    func testAddItem_ShouldHaveTitleForItem() {
        sut.createItem()
        
        let expectedCount = 1
        
        XCTAssertEqual(sut.itemManager.itemsCount, expectedCount, "itemCount should be 1.")
        
        let title = sut.titleForItemAtIndexPathRow(0)
        
        XCTAssertNotNil(title, "should not be nil.")
    }
    
    func testRemoveAllItems() {
        sut.createItem()

        var expectedCount = 1
        
        XCTAssertEqual(sut.itemManager.itemsCount, expectedCount, "itemCount should be 1.")
        
        sut.removeAllItems()
        
        expectedCount = 0
        
        XCTAssertEqual(sut.itemManager.itemsCount, expectedCount, "itemCount should be 0.")
    }
    
    func testTimeString() {
        let date = NSDate(timeIntervalSince1970: 1469718000)
        let timeString = sut.timeStringFromDate(date)
        let expectedString = "12:00:00"
        
        XCTAssertEqual(timeString, expectedString, "should be equal.")
    }
    
    func testIsEmpty() {
        sut.createItem()
        XCTAssert(!sut.isEmpty(), "should not be empty.")
        
        sut.removeAllItems()
        
        XCTAssert(sut.isEmpty(), "should be empty.")
    }
}

internal extension ItemListViewModel {
    func itemAtIndex(index: Int) -> Item {
        return itemManager.itemAtIndex(index)
    }
}
