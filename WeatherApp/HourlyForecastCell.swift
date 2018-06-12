//
//  HourlyForecatViewCell.swift
//  WeatherApp
//
//  Created by Abdoulaye on 11/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit

class HourlyForecastCell: UITableViewCell {

    @IBOutlet weak var hourlyInfos: UILabel!
    
    func configure(forecast: Forecast) {
        hourlyInfos.text = forecast.hourlySummary
    }

}
