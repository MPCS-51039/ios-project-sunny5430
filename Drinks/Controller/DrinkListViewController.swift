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
    
    var drinks : [Drink] = []
    var drinkService: DrinkService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.drinkService = DrinkService() // __Service: get data from somewhere else
        self.drinks = self.drinkService.getDrinks()
        
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
        
        let currentDrink = self.drinks[indexPath.row]
        cell.drinkNameLabel.text = currentDrink.name
        cell.drinkTypeLabel.text = currentDrink.content
        
        return cell
    }
}

extension DrinkListViewController: UITableViewDelegate {
    //MARK:Delegate
    
}
