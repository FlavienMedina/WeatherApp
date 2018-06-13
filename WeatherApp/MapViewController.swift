//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Flavien Medina on 10/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDataSource{
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var sideBarHidden = true
    var cities: [City] = CitiesData.list

    @IBOutlet weak var mapView: MKMapView!
     @IBAction func rightBarBtnOnPress(_ sender: UIBarButtonItem) {
        if sideBarHidden {
            sideBarConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        else{
            sideBarConstraint.constant = 200
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        sideBarHidden = !sideBarHidden
    }
    
    @IBOutlet weak var sideBarConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        tableView.dataSource = self
        sideBarConstraint.constant = 200
        self.navigationItem.title = "WeatherApp";
                
        for city in cities{
            let pin = MKPointAnnotation()
            pin.coordinate = city.coordinates
            pin.title = city.name
            self.mapView.addAnnotation(pin)
            self.cities.append(City(name: city.name, coordinates: city.coordinates))
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        cell.configure(city: cities[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegueCell" {
            if let vc = segue.destination as? DetailsViewController, let index = tableView.indexPathForSelectedRow?.row {
                sideBarConstraint.constant = 200
                vc.selectCity = cities[index]
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.coordinates = view.annotation?.coordinate
        detailsViewController.name = view.annotation?.title!
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
