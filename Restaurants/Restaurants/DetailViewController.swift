//
//  DetailViewController.swift
//  Restaurants
//
//  Created by Jim Liu on 2/29/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit
import MapKit


class DetailViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let annotation = MKPointAnnotation()

    var restaurant: Restaurant? {
        didSet {
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.mapView.addAnnotation(annotation)
        
        self.previewImage.layer.cornerRadius = 4.0
        self.previewImage.layer.masksToBounds = true
        
        self.mapView.layer.cornerRadius = 4.0
        self.mapView.layer.masksToBounds = true
        
        if let restaurant = self.restaurant {
            self.title = restaurant.name
            self.previewImage.setImageWithUrl(restaurant.imageUrl, contentMode: UIViewContentMode.ScaleAspectFill)
            
            self.nameLabel.text = "\(restaurant.name)"
            self.ratingView.rating = restaurant.rating
            self.ratingView.text = "\(restaurant.rating)"
            self.ratingView.updateOnTouch = false
            self.addressLabel.text = restaurant.address
            let coordinate = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            annotation.coordinate = coordinate
            self.mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpanMake(0.01, 0.01)), animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        var view = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as? MKPinAnnotationView
        if view == nil {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            view!.canShowCallout = false
        }
        return view
    }


}

