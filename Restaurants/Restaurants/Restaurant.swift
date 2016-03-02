//
//  Restaurant.swift
//  Restaurants
//
//  Created by Jim Liu on 2/29/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Restaurant {
    
    init(name: String,
        address: String,
        imageUrl: String,
        latitude: Double,
        longitude: Double,
        rating: Double) {
            self.name = name
            self.address = address
            self.imageUrl = imageUrl
            self.latitude = latitude
            self.longitude = longitude
            self.rating = rating
    }
    
    var name: String
    var imageUrl: String
    
    var address: String
    
    var latitude: Double
    var longitude: Double

    var rating: Double
    
}
