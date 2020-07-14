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
//        self.drinks = self.drinkService.getDrinks()
        self.drinkService.getDrinks(completion: {drinks, error in
            guard let drinks = drinks, error == nil else {
                return
            }
            self.drinks = drinks
            self.tableView.reloadData()
        })
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmedCell = self.tableView.cellForRow(at: selectedIndexPath) as? DrinkCell
            else { return }
        
        let confirmedDrink = confirmedCell.drink
        destination.drink = confirmedDrink
        
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
        
        cell.drink = currentDrink
        
        
        return cell
    }
}

extension DrinkListViewController: UITableViewDelegate {
    //MARK:Delegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if
//            let cell = self.tableView.cellForRow(at: indexPath) as? DrinkCell,
//            let confirmedDrink = cell.drink
//        {
//            confirmedDrink.tasted = true
//            cell.accessoryType = confirmedDrink.tasted ? .checkmark : .none
//        }
//    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let cell = self.tableView.cellForRow(at: indexPath) as! DrinkCell
        let confirmedDrink = cell.drink!
        
        let favorite = confirmedDrink.isFavorite
        let title = favorite ? NSLocalizedString("Unlike", comment: "Unlike") : NSLocalizedString("Like", comment: "Like")
        
        
        let setFavorite = UIContextualAction(style: .normal, title: title, handler: {(action: UIContextualAction, view:UIView, complete:(Bool) ->Void) in
            confirmedDrink.isFavorite = !confirmedDrink.isFavorite
            complete(true)
        })
        setFavorite.backgroundColor = confirmedDrink.isFavorite ? .systemPink: .blue
        
        //let drinkIcon = UIImageView()
        let displayedIcon = favorite ? UIImage(systemName: "heart.slash", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)):UIImage(systemName: "heart.fill")
        setFavorite.image = displayedIcon
        
        return UISwipeActionsConfiguration(actions: [setFavorite])
        
    }

}
