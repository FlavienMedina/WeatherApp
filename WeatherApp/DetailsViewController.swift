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
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return city?.forecast!.hourlySumary.count ?? 0
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            if let city = city {
                cell.configure(withCity: city)
            }
            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientsCell
//            if let cocktail = cocktail {
//                cell.configure(ingredient: cocktail.ingredients[indexPath.row])
//            }
//            return cell
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "instructionsCell", for: indexPath) as! InstructionsCell
//            if let cocktail = cocktail {
//                cell.configure(withCocktail: cocktail)
//            }
//            return cell
        default:
            return UITableViewCell()
        
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
//        case 1:
//            return "Ingredients"
//        case 2:
//            return "Instructions"
        default:
            return nil
        }
    }
    
}
