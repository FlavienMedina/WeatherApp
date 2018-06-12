//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Flavien Medina on 12/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit
import SDWebImage

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityName: UILabel!
    
    func configure(city: City) {
        cityName.text = city.name
    }
}

