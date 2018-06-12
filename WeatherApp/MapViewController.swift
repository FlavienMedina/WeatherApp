//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Flavien Medina on 10/06/2018.
//  Copyright © 2018 Flavien Medina. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var rightBarButtonItem: UINavigationItem!
    
    var citys: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.navigationItem.title = "WeatherApp";
        
        let citys = CitiesData.list
        
        for city in citys{
            let pin = MKPointAnnotation()
            pin.coordinate = city.coordinates
            pin.title = city.name
            self.mapView.addAnnotation(pin)
            self.citys.append(City(name: city.name, coordinates: city.coordinates))
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.coordinates = view.annotation?.coordinate
        detailsViewController.name = view.annotation?.title!
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
