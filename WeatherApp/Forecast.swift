//
//  Forecast.swift
//  WeatherApp
//
//  Created by Flavien Medina on 11/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import Foundation

struct Forecast {
    var icon, summary, hourlySumary, dailySummary : String
    var temperature, windSpeed, pressure, humidity, uvIndex: Int
    var hourly: [(Int, String, Int, Int)]
    var daily: [(Int, String, Int, Int)]
}
