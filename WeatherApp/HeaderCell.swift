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
    @IBOutlet weak var forecastInfos: UILabel!
    
    func configure(withCity city: City) {
        icon.sd_setImage(with: URL(string: (city.forecast?.icon)!))
        temperature.text = "\(String(describing: city.forecast?.temperature))"
        forecastInfos.text = city.forecast?.summary
    }
    
}
