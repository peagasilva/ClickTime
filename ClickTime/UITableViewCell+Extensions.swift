//
//  UITableViewCell+Extensions.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/27/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    /// Returns a default identifier that matches the class name.
    static var defaultIdentifier: String {
        return String(self)
    }
}
