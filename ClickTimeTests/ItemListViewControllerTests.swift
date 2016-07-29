//
//  ItemListViewControllerTests.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/28/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import XCTest
import RxSwift

@testable import ClickTime

class ItemListViewControllerTests: XCTestCase {
    
    var sut: ItemListViewController!
    var addButton: UIBarButtonItem!
    var removeButton: UIBarButtonItem!
    var tableview: UITableView!
    
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier(String(ItemListViewController)) as! ItemListViewController
        
        XCTAssertNotNil(sut.view)
        XCTAssertNil(sut.presentedViewController)
        
        tableview = UITableView()
        
        guard let addButton = sut.navigationItem.rightBarButtonItem else {
            XCTFail()
            return
        }
        
        guard let removeButton = sut.navigationItem.leftBarButtonItem else {
            XCTFail()
            return
        }
        
        self.addButton = addButton
        self.removeButton = removeButton
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testItemListViewController_HasAddBarButtonWithSelfAsTarget() {
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.target as? UIViewController, sut)
    }
    
    func testItemListViewController_HasRemoveBarButtonWithSelfAsTarget() {
        XCTAssertNotNil(sut.navigationItem.leftBarButtonItem)
        XCTAssertEqual(sut.navigationItem.leftBarButtonItem?.target as? UIViewController, sut)
    }
    
    func testAddItem_ShouldAddItem() {
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        
        XCTAssertNotNil(addButton.action)
        
        sut.performSelector(addButton.action, withObject: addButton)
        
        let item = sut.itemListViewModel.itemAtIndex(0);
        
        XCTAssertNotNil(item)
        XCTAssertTrue(!sut.itemListViewModel.isEmpty())
    }
    
    func testRemoveAllItems_ShouldRemoveItems() {
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        
        XCTAssertNotNil(removeButton.action)
        
        sut.performSelector(addButton.action, withObject: addButton)
        
        XCTAssertTrue(!sut.itemListViewModel.isEmpty())

        sut.performSelector(removeButton.action, withObject: removeButton)
        
        XCTAssertTrue(sut.itemListViewModel.isEmpty())
    }
}
