//
//  DailyDetailsCell.swift
//  WeatherApp
//
//  Created by Flavien Medina on 13/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit

class DailyDetailsCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    
    func configure(daily: (String, String, Int, Int)) {
        print(daily)
        icon.image = UIImage(named: "\(daily.0)")
        time.text = "\(daily.1)"
        maxTemperature.text = "\(daily.3)°C"
        minTemperature.text = "\(daily.2)°C"
    }
    
    
}
