//
//  ExtraInfoCell.swift
//  WeatherApp
//
//  Created by Abdoulaye on 13/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit

class ExtraInfoCell: UITableViewCell {

    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var windValue: UILabel!
   
    
    
    func configure(forecast: Forecast) {
        humidityLabel.text = "Humidity"
        humidityValue.text = "\(forecast.humidity)%"
        windLabel.text = "Wind Speed"
        windValue.text = "\(forecast.windSpeed) km/h"
       
    }

}
