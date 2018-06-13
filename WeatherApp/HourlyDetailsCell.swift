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
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var time: UILabel!

    func configure(hourly: (String, String, Double, Int)) {
        let conv = Int(hourly.2*100)
        icon.image = UIImage(named: "\(hourly.0)")
        time.text = "\(hourly.1)"
        humidity.text = "\(conv)%"
        temperature.text = "\(hourly.3)°C"

    }


}
