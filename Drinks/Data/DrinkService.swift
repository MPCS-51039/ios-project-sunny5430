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
            Drink(name:"Okinawa Black Sugar Latte", content: "Fresh milk with flavored topioca", cal: 270, price: 6.99),
            Drink(name:"Matcha Latte", content: "Authentic matcha flavor", cal: 180, price: 3.99),
            Drink(name:"Grapefruit Green Tea", content: "With freshly squeezed grapefruit", cal: 88, price: 7.99),
            Drink(name:"Lemon Green Tea", content: "Green tea with refreshing flavor", cal: 45, price: 5.99),
            Drink(name:"Lemon Black Tea", content: "Shrilanka black tea with lemon", cal: 88, price: 5.99),
            Drink(name:"Passionfruit Green Tea", content: "Passionfruit flavored", cal: 61, price: 5.99),
            Drink(name:"Mango Green Tea", content: "With freshly squeezed mango", cal: 70, price: 6.99),
            Drink(name:"Lava Pearl Milk Tea", content: "Black sugar coated tapioca with milk tea", cal: 472, price: 8.99),
            Drink(name:"Lava Pearl Jasmine Milk Tea", content: "Black sugar coated tapioca with jasmine milk tea", cal: 546, price: 8.99),
            Drink(name:"Lava Pearl Latte", content: "Black sugar coated tapioca with fresh milk ", cal: 369, price: 9.99),
            Drink(name:"Lava Pearl Hoji Milk Tea", content: "Black sugar coated tapioca with Hojicha Milk Tea ", cal: 546, price: 8.99),
            Drink(name:"Lava Pearl Matcha Latte", content: "Black sugar coated tapioca with matcha tea & fresh milk ", cal: 369, price: 8.99),
            
        ]
        
    }
}


