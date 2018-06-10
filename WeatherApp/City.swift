//
//  City.swift
//  Efreitech - Final
//
//  Created by Pierre-Yves Touzain on 11/05/2018.
//  Copyright © 2018 TYP Studio. All rights reserved.
//

import Foundation
import CoreLocation

struct City {
    var name: String
    var coordinates: CLLocationCoordinate2D
    var icon: String
    var temperature: Int
    var summary: String
    var windSpeed: Int
    var pressure: Int
    var humidity: Int
    var uvIndex: Int
    var hourlySummary: String
    var dailySummary: String
    
//    var forecast: Forecast?
    
    init(name: String, coordinates: CLLocationCoordinate2D) {
        self.name = name
        self.coordinates = coordinates
    }
}
