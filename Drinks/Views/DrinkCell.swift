//
//  DrinkCell.swift
//  Drinks
//
//  Created by Wu, Kevin on 6/29/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import UIKit

class DrinkCell: UITableViewCell {
    
    @IBOutlet weak var drinkPriceLabel: UILabel!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkTypeLabel: UILabel!
    
    var drink: Drink? {
        didSet {
            self.drinkNameLabel.text = drink?.name
            self.drinkTypeLabel.text = drink?.content
            self.drinkPriceLabel.text = "$\(drink?.price ?? 0)"
            self.accessoryType = drink!.tasted ? .checkmark : .none
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
