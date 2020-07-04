//
//  DrinkService.swift
//  Drinks
//
//  Created by Wu, Kevin on 7/4/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import Foundation

class DrinkService {
    
    func getDrinks() -> [Drink] {
        return [
            Drink(name:"Bubble Tea", content: "Classic milk tea with tapioca balls", cal: 400, price: 4.99),
            Drink(name:"3 Guys", content: "Milk tea with tapioca, grass jelly & pudding", cal: 300, price: 5.99),
            Drink(name:"Taro Milk Tea", content: "Nostagic taro flavored milk tea", cal: 305, price: 4.59),
            Drink(name:"Bubble Tea", content: "Classic milk tea with tapioca balls", cal: 400, price: 4.99),
            Drink(name:"3 Guys", content: "Milk tea with tapioca, grass jelly & pudding", cal: 300, price: 5.99),
            Drink(name:"Taro Milk Tea", content: "Nostagic taro flavored milk tea", cal: 305, price: 4.59),Drink(name:"Bubble Tea", content: "Classic milk tea with tapioca balls", cal: 400, price: 4.99),
            Drink(name:"3 Guys", content: "Milk tea with tapioca, grass jelly & pudding", cal: 300, price: 5.99),
            Drink(name:"Taro Milk Tea", content: "Nostagic taro flavored milk tea", cal: 305, price: 4.59)
        ]
        
    }
}


