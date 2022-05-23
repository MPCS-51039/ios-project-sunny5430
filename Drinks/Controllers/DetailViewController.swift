//
//  DetailViewController.swift
//  Drinks
//
//  Created by Wu, Kevin on 7/11/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var drinkImageView: UIImageView!
    
    
    var drink: Drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drinkNameLabel.text = drink.name
        self.priceLabel.text = "$\(drink.price)"
        self.contentsLabel.text = drink.content
        self.caloriesLabel.text = "\(drink.calories)"
//        print(drink)
        
        DispatchQueue.global(qos: .userInitiated).async {
        let drinkImageData = NSData(contentsOf: URL(string: self.drink!.imageUrl)!)
        DispatchQueue.main.async {
            self.drinkImageView.image = UIImage(data: drinkImageData! as Data)
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
