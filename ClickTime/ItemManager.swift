//
//  ItemManager.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/27/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import RxSwift

class ItemManager {
    
    // MARK: - Properties
    // MARK: var
    var itemsCount: Int {
        return items.value.count
    }
    
    private var items = Variable([Item]())
    
    // MARK: - Methods
    
    /**
     Returns an Observable from the items in the manager.
     
     - returns: An Observable of the items.
     */
    func allItems() -> Observable<[Item]> {
        return items.asObservable()
    }
    
    /**
     Adds a new Item to the items array. It does not add an Item if it already exists.
     
     - parameter item: Item to be added.
     */
    func addItem(item: Item) {
        if !items.value.contains(item) {
            items.value.append(item)
        }
    }
    
    /**
     Returns an Item at the specific index.
     
     - parameter index: The index desired.
     
     - returns: Returns an Item.
     */
    func itemAtIndex(index: Int) -> Item {
        return items.value[index]
    }

    /**
     Removes all Items from the manager.
     */
    func removeAllItems() {
        items.value.removeAll()
    }
}
