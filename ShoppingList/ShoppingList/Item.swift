//
//  Item.swift
//  ShoppingList
//
//  Created by Jim Liu on 2/8/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import Foundation

// Shopping Item
class Item {
    
    var quantity: Int!
    var description: String!
    
    init(quantity: Int!, description: String!) {
        self.quantity = quantity
        self.description = description
    }
    
    func toString() -> String {
        return "\(self.quantity)x \(self.description)"
    }
}