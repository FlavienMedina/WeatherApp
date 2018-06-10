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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let citys = CitiesData.list
        
        for city in citys{
            let pin = MKPointAnnotation()
            pin.coordinate = city.coordinates
            pin.title = city.name
            self.mapView.addAnnotation(pin)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        print(view.annotation?.title! as Any)
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.coordinates = view.annotation?.coordinate
        detailsViewController.name = view.annotation?.title!
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
