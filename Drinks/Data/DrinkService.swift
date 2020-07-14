//
//  DrinkService.swift
//  Drinks
//
//  Created by Wu, Kevin on 7/4/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import Foundation

enum DrinkCallingError: Error {
    case problemGeneratingURL
    case problemGeneratingDataFromAPI
    case problemDecodingData
}


class DrinkService {
    private let urlString =
        "https://run.mocky.io/v3/407a9e66-48a4-4d82-be6b-4c966492fdec"
    
    func getDrinks(completion: @escaping ([Drink]?, Error?) -> ()) {
        guard let url = URL(string: self.urlString) else {
            DispatchQueue.main.async {
                completion(nil, DrinkCallingError.problemGeneratingURL)
            }
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, DrinkCallingError.problemGeneratingDataFromAPI)
                }
                return
            }
        
        do {
            let drinkResult = try JSONDecoder().decode(DrinkResult.self, from: data)
            DispatchQueue.main.async {completion(drinkResult.drinks, nil)}
            
            } catch (let error) {
                print(error)
                DispatchQueue.main.async {
                    completion(nil, DrinkCallingError.problemDecodingData)
                }
            }
        
        }
        task.resume()
        }
    }
    
//    func getDrinks() -> [Drink] {
//        return [
//            Drink(name:"Bubble Tea", content: "Classic milk tea with tapioca balls", cal: 400, price: 4.99, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/mgibqmo5xki1zcqaxfiu"),
//            Drink(name:"3 Guys", content: "Milk tea with tapioca, grass jelly & pudding", cal: 300, price: 5.99, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/jzd5ikiogsbgf1ulhy1s"),
//            Drink(name:"Taro Milk Tea", content: "Nostagic taro flavored milk tea", cal: 305, price: 4.59, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/ixgq9x5tc4yvpjz043wn"),
//            Drink(name:"Okinawa Black Sugar Latte", content: "Fresh milk with flavored topioca", cal: 270, price: 6.99, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/fnrrhohwv3b0lfawiyfq"),
//            Drink(name:"Matcha Latte", content: "Authentic matcha flavor", cal: 180, price: 3.99, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/idniavmo7k7gjolaroww"),
//            Drink(name:"Grapefruit Green Tea", content: "With freshly squeezed grapefruit", cal: 88, price: 7.99, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/ydb5x5hlgkau5fvw6i0a"),
//            Drink(name:"Lemon Green Tea", content: "Green tea with refreshing flavor", cal: 45, price: 5.99, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/qjwcphekxzqve0oxgv9n"),
//            Drink(name:"Lemon Black Tea", content: "Shrilanka black tea with lemon", cal: 88, price: 5.99, imageUrl: "https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/vpuhljmmdcu2zalo1y0u"),
//            Drink(name:"Passionfruit Green Tea", content: "Passionfruit flavored", cal: 61, price: 5.99, imageUrl:"https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/ajy1obzbtwywntu63u03"),
//            Drink(name:"Mango Green Tea", content: "With freshly squeezed mango", cal: 70, price: 6.99, imageUrl:"https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/uihhmqh49n67gicletko"),
//            Drink(name:"Lava Pearl Milk Tea", content: "Black sugar coated tapioca with milk tea", cal: 472, price: 8.99, imageUrl:"https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/lvgxe1gfbkuotfr7eg4o"),
//            Drink(name:"Lava Pearl Jasmine Milk Tea", content: "Black sugar coated tapioca with jasmine milk tea", cal: 546, price: 8.99, imageUrl:"https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/wlxd3kitw3krv6dg6ppa"),
//            Drink(name:"Lava Pearl Latte", content: "Black sugar coated tapioca with fresh milk ", cal: 369, price: 9.99, imageUrl:"https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/zjeccitjshrwfxeg37df"),
//            Drink(name:"Lava Pearl Hoji Milk Tea", content: "Black sugar coated tapioca with Hojicha Milk Tea ", cal: 546, price: 8.99, imageUrl:"https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/tqxuagaa3d9svtnmkgvc"),
//            Drink(name:"Lava Pearl Matcha Latte", content: "Black sugar coated tapioca with matcha tea & fresh milk ", cal: 369, price: 8.99, imageUrl:"https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_150,h_130,f_auto,g_auto,q_auto,dpr_auto,c_fill/ylvxneimaax7m1lpxabh"),
//
//        ]
//
//    }
//}


