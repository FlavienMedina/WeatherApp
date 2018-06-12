//
//  DailyForecastCell.swift
//  WeatherApp
//
//  Created by Abdoulaye on 11/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit

class DailyForecastCell: UITableViewCell {

    @IBOutlet weak var dailyInfos: UILabel!
    
    func configure(forecast: Forecast) {
        dailyInfos.text = forecast.dailySummary
    }

}
