//
//  HeaderCell.swift
//  WeatherApp
//
//  Created by Abdoulaye on 11/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var forecast: UILabel!
    
    func configure(withCocktail city: City) {
        icon.sd_setImage(with: URL(string: cocktail.imageUrl))
        temperature.text = city.name
        //forecast.text = city.glassType
    }
    
}
