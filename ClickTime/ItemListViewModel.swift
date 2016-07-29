//
//  ItemListViewModel.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/27/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import RxSwift

class ItemListViewModel {
    
    // MARK: - Properties
    // MARK: let
    
    internal let itemManager = ItemManager()
    
    // MARK: var
    
    internal lazy var dateFormatter: NSDateFormatter = {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        return dateFormatter
    }()
    
    // MARK: - Methods
    
    /**
     Returns the title for the specific row requested.
     
     - parameter row: The specific row (Int).
     
     - returns: The title string.
     */
    func titleForItemAtIndexPathRow(row: Int) -> String {
        return itemManager.itemAtIndex(row).title
    }
    
    /**
     Returns an Observable from the items.
     
     - returns: Observable<[Item]>.
     */
    func observableItems() -> Observable<[Item]> {
        return itemManager.allItems()
    }
    
    
    /**
     Creates a new item (Item).
     */
    func createItem() {
        let time = timeStringFromDate()
        
        itemManager.addItem(Item(title: time))
    }
    
    /**
     Removes all items.
     */
    func removeAllItems() {
        itemManager.removeAllItems()
    }
    
    /**
     Checks if items are empty or not.
     
     - returns: A Bool value.
     */
    func isEmpty() -> Bool {
        if !(itemManager.itemsCount > 0) {
            return true
        } else {
            return false
        }
    }
    
    /**
     Creates a string from a date. It uses de current date in case none is passed.
     
     - returns: A formatted time string (HH:mm:ss).
     */
    internal func timeStringFromDate(date: NSDate = NSDate()) -> String {
        return dateFormatter.stringFromDate(date)
    }
}
