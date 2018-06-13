//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Flavien Medina on 10/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class DetailsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var coordinates: CLLocationCoordinate2D?
    var name: String?
    var forecast: Forecast?
    var selectCity: City?
    var city: City?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.navigationItem.title = name;
        if (selectCity != nil){
            coordinates = selectCity?.coordinates
            name = selectCity?.name
        }
        let url: String = "https://api.darksky.net/forecast/6d354170db20f516b7a66c9ec9318c9b/\(coordinates!.latitude),\(coordinates!.longitude)?units=si"
        requestForecast(url: url)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return forecast?.hourly.count ?? 0
            case 3:
                return 1
            case 4:
                return forecast?.daily.count ?? 0
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            cell.isUserInteractionEnabled = false
            if let test = forecast {
                cell.configure(forecast: test)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyForecastText", for: indexPath) as! HourlyForecastCell
            cell.isUserInteractionEnabled = false
            if let test = forecast {
                cell.configure(forecast: test)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyDetails", for: indexPath) as! HourlyDetailsCell
            cell.isUserInteractionEnabled = false
            if let forecast = forecast {
                cell.configure(hourly: forecast.hourly[indexPath.row])
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dailySummary", for: indexPath) as! DailyForecastCell
            cell.isUserInteractionEnabled = false
            if let test = forecast {
                cell.configure(forecast: test)
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dailyDetails", for: indexPath) as! DailyDetailsCell
            cell.isUserInteractionEnabled = false
            if let forecast = forecast {
                cell.configure(daily: forecast.daily[indexPath.row])
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func requestForecast(url : String){
        Alamofire.request(url)
            .responseJSON { response in
                
                guard response.result.error == nil else {
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                guard response.result.value != nil else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(String(describing: response.result.error))")
                    return
                }
                
                if let value = response.result.value {
                    let forecastJSON = JSON(value);
                    self.forecast = Forecast(json: forecastJSON)
                    self.tableView.reloadData()
                }
        }
    }
    
}
