//
//  Forecast.swift
//  WeatherApp
//
//  Created by Flavien Medina on 11/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Forecast {
    var icon, summary, hourlySummary, dailySummary : String
    var temperature, windSpeed, pressure, humidity, uvIndex: Int
    var hourly: [(String, Int, Double, Int)]
//    var daily: [(String, Int, Int, Int)]
    
    init(json: JSON) {
        self.icon = json["currently"]["icon"].stringValue
        self.summary = json["currently"]["summary"].stringValue
        self.hourlySummary = json["hourly"]["summary"].stringValue
        self.dailySummary = json["daily"]["summary"].stringValue
        
        self.temperature = json["currently"]["temperature"].intValue
        self.windSpeed = json["currently"]["windSpeed"].intValue
        self.pressure = json["currently"]["pressure"].intValue
        self.humidity = json["currently"]["humidity"].intValue
        self.uvIndex = json["currently"]["uvIndex"].intValue
        
        self.hourly = []
        
        for i in 0 ..< json["hourly"]["data"].count {
            let icon = json["hourly"]["data"][i]["icon"].stringValue
            let time = json["hourly"]["data"][i]["time"].intValue
            let humidity = json["hourly"]["data"][i]["humidity"].doubleValue
            let temperature = json["hourly"]["data"][i]["temperature"].intValue
            let tuple = (icon, time, humidity, temperature)
            self.hourly.append(tuple)
        }
    }
    
}
