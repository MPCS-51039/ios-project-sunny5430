//
//  Drink.swift
//  Drinks
//
//  Created by Wu, Kevin on 7/4/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import Foundation

class Drink: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Drink(name \(self.name), content: \(self.content), price: \(self.price))"
    }
    
    var name: String
    var content: String
    var calories: Int
    var price: Float
    var imageUrl: String
    
    var tasted: Bool = false
    var isFavorite:Bool = false
    
    init(name: String, content: String, cal calories: Int, price: Float, imageUrl: String) {
        self.name = name
        self.content = content
        self.calories = calories
        self.price = price
        self.imageUrl = imageUrl
    }
}
