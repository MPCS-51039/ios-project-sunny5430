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
    private let urlString = //"123"
        "https://run.mocky.io/v3/407a9e66-48a4-4d82-be6b-4c966492fdec" // with data
//        "https://run.mocky.io/v3/a24e3aea-ac02-46a7-996f-f545b7151f23" // empty
    
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
//
//        ]
//
//    }
//}


