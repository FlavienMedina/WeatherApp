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
    
    func configure(forecast: Forecast) {
        print(forecast)
        temperature.text = "\(forecast.temperature)"
        forecastInfos.text = forecast.summary
        icon.image = UIImage(named: "\(forecast.icon)")
    }
    
}
