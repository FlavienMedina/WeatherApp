//
//  ExtraInfo2Cell.swift
//  WeatherApp
//
//  Created by Abdoulaye on 13/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit

class ExtraInfo2Cell: UITableViewCell {
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var pressureValue: UILabel!
    @IBOutlet weak var uvLabel: UILabel!
    @IBOutlet weak var uvValue: UILabel!
    
    func configure(forecast: Forecast) {
        
        pressureLabel.text = "Pressure"
        pressureValue.text = "\(forecast.pressure) hPa"
        uvLabel.text = "UV Index"
        uvValue.text = "\(forecast.uvIndex)"
    }
   

}
