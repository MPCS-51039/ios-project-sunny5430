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
    var refreshControl = UIRefreshControl()
    
    @objc func refreshData(sender: AnyObject){
        viewWillAppear(true)
        self.refreshControl.endRefreshing()
//        print("refreshed")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.drinkService = DrinkService() // __Service: get data from somewhere else
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //Initialize the refresh control
        self.tableView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self,
                                 action: #selector(refreshData),
                                 for: .valueChanged)
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        guard let confirmedService = self.drinkService else { return }
        
        confirmedService.getDrinks(completion: {drinks, error in
            guard let drinks = drinks, error == nil else {
                print("DrinkCallingError: ", error!)
                self.displayAlert(message: "Something's wrong with the API. \nCheck internet connection and refresh.")
                return
            }
            self.drinks = drinks
            self.tableView.reloadData()
        })
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
    
    
    func displayAlert(message: String) {
        //Declare Alert message
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: UIAlertController.Style.alert)
        
        //Create button with action handler
        let refreshButton = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            self.tableView.reloadData()
//            print("OK button tapped")
        })
        
        alert.addAction(refreshButton)
        self.present(alert, animated: true, completion: nil)
        
    }

}

extension DrinkListViewController: UITableViewDataSource {
    //MARK:DataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.drinks.count == 0 {
            self.tableView.setEmptyMessage("This is an empty drink menu:(")
        } else {
            self.tableView.restore()
        }
        
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

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x:0, y:0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

