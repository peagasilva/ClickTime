//
//  Item.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/27/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

struct Item: Equatable {
    let title: String
    let timestamp: Double?
    
    init(title: String, timestamp: Double? = nil) {
        self.title = title
        self.timestamp = timestamp
    }
}

func ==(lhs: Item, rhs: Item) -> Bool {
    if lhs.timestamp != rhs.timestamp ||
        lhs.title != rhs.title {
        return false
    }
    
    return true
}
