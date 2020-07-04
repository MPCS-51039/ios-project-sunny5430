//
//  Drink.swift
//  Drinks
//
//  Created by Wu, Kevin on 7/4/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import Foundation

class Drink {
    var name: String
    var content: String
    var calories: Int
    var price: Float
    
    init(name: String, content: String, cal calories: Int, price: Float) {
        self.name = name
        self.content = content
        self.calories = calories
        self.price = price
    }
}
