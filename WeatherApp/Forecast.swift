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
    var hourly: [(String, String, Double, Int)]
    var daily: [(String, String, Int, Int)]
    
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
        self.daily = []

        for i in 0 ..< json["hourly"]["data"].count {
            let icon = json["hourly"]["data"][i]["icon"].stringValue
            let time = Date(timeIntervalSince1970: TimeInterval(json["hourly"]["data"][i]["time"].intValue))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "DDDD" //Specify your format that you want
            let strDate = dateFormatter.string(from: time)
            
            let humidity = json["hourly"]["data"][i]["humidity"].doubleValue
            let temperature = json["hourly"]["data"][i]["temperature"].intValue
            let tuple = (icon, strDate, humidity, temperature)
            self.hourly.append(tuple)
        }
        
        for i in 0 ..< json["daily"]["data"].count {
            let icon = json["daily"]["data"][i]["icon"].stringValue
            let time = Date(timeIntervalSince1970: TimeInterval(json["daily"]["data"][i]["time"].intValue))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH" //Specify your format that you want
            let strDate = dateFormatter.string(from: time)
            
            let maxTemperature = json["daily"]["data"][i]["temperatureHigh"].intValue
            let minTemperature = json["daily"]["data"][i]["temperatureLow"].intValue
            let tuple = (icon, strDate, maxTemperature, minTemperature)
            self.daily.append(tuple)
        }
    }
    
}
