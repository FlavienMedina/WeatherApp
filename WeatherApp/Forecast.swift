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
    var icon, summary, hourlySumary, dailySummary : String
    var temperature, windSpeed, pressure, humidity, uvIndex: Int
//    var hourly: [(Int, String, Int, Int)]
//    var daily: [(Int, String, Int, Int)]
    
    init(json: JSON) {
        self.icon = json["currently"]["icon"].stringValue
        self.summary = json["currently"]["summary"].stringValue
        self.hourlySumary = json["hourly"]["summary"].stringValue
        self.dailySummary = json["daily"]["summary"].stringValue
        
        self.temperature = json["currently"]["temperature"].intValue
        self.windSpeed = json["currently"]["windSpeed"].intValue
        self.pressure = json["currently"]["pressure"].intValue
        self.humidity = json["currently"]["humidity"].intValue
        self.uvIndex = json["currently"]["uvIndex"].intValue

        
        
//        for i in json["hourly"]["data"] {
//            let ingredient = json["strIngredient\(i)"].stringValue
//            let measure = json["strMeasure\(i)"].stringValue
//        }
    }
    
}
