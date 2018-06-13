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

    func configure(hourly: (String, Int, Double, Int)) {
        print(hourly)
        icon.image = UIImage(named: "\(hourly.0)")
        time.text = "\(hourly.1)"
        humidity.text = "\(hourly.2)"
        temperature.text = "\(hourly.3)"

    }


}
