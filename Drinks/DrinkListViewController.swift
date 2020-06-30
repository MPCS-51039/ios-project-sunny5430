//
//  ViewController.swift
//  Drinks
//
//  Created by Wu, Kevin on 6/28/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import UIKit

class DrinkListViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    var drinks : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.drinks = ["Milk Tea", "Fruit Tea", "Specialty", "Seasonal",
        "Milk Tea", "Fruit Tea", "Specialty", "Seasonal",
        "Milk Tea", "Fruit Tea", "Specialty", "Seasonal",
        "Milk Tea", "Fruit Tea", "Specialty", "Seasonal",
        "Milk Tea", "Fruit Tea", "Specialty", "Seasonal",
        "Milk Tea", "Fruit Tea", "Specialty", "Seasonal",
        "Milk Tea", "Fruit Tea", "Specialty", "Seasonal"]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    

}

extension DrinkListViewController: UITableViewDataSource {
    //MARK:DataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drinks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "drinkCell") as! DrinkCell
        
        cell.drinkNameLabel.text = self.drinks[indexPath.row]
        cell.drinkTypeLabel.text = "lots of boba"
        
        return cell
    }
}

extension DrinkListViewController: UITableViewDelegate {
    //MARK:Delegate
    
}
