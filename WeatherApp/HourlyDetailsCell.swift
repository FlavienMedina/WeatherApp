//
//  HourlyDetailsCell.swift
//  WeatherApp
//
//  Created by Abdoulaye on 13/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit

class HourlyDetailsCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    func configure(forecast: Forecast) {
        print(forecast)
        temp.text = "25°C"
        pressure.text = "5%"
        hour.text = "Minuit"  // A changer 
        icon.image = UIImage(named: "\(forecast.icon)")
    }
    

}
