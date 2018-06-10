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

class DetailsViewController: UIViewController {
    
    var coordinates: CLLocationCoordinate2D?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailsView")
        let title = name!
        let coordinate = coordinates!
        print(title)
        self.navigationItem.title = name;
        let url: String = "https://api.darksky.net/forecast/6d354170db20f516b7a66c9ec9318c9b/\(coordinate.latitude),\(coordinate.longitude)"
        print(url)
        getApi(url: url)
    }
    
    func getApi(url : String){
        Alamofire.request(url)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                // make sure we got some JSON since that's what we expect
                guard let value = response.result.value else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(String(describing: response.result.error))")
                    return
                }
                let json = JSON(value);
                print(json)
//                for drink in json["drinks"].arrayValue {
//                    self.cocktails.append(Cocktail(json: drink))
//                }
        }
    }
    
}
