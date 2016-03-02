//
//  DataSource.swift
//  Restaurants
//
//  Created by Jim Liu on 3/1/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class DataSource {
    
    // data came from http://api.tripadvisor.com/api/partner/2.0/location/35805/restaurants?key=HackTripAdvisor-ade29ff43aed
    // hard code
    
    static func loadRestaurants() -> [Restaurant] {
        let restaurants: [Restaurant] = [
            Restaurant(name: "Alinea", address: "1723 North Halsted St., Chicago, IL 60614-5501", imageUrl: "http://media-cdn.tripadvisor.com/media/photo-s/06/ac/4d/ea/alinea.jpg", latitude: 41.91342, longitude: -87.64829, rating: 4.5),
            Restaurant(name: "Bavette's Bar and Boeuf", address: "218 W Kinzie, Chicago, IL 60654", imageUrl: "http://media-cdn.tripadvisor.com/media/photo-s/09/da/82/5c/bavette-s-bar-and-boeuf.jpg", latitude: 41.88934, longitude: -87.63495, rating: 4.5),
            Restaurant(name: "Mexique", address: "50 W Randolph St, Chicago, IL 60601", imageUrl: "http://media-cdn.tripadvisor.com/media/photo-f/05/ef/32/be/mexique.jpg", latitude: 41.88434, longitude: -87.630005, rating: 4.5),
            Restaurant(name: "Bohemian House", address: "1529 W Chicago Ave, Chicago, IL 60622", imageUrl: "http://media-cdn.tripadvisor.com/media/photo-s/06/69/7d/2b/getlstd-property-photo.jpg", latitude: 41.896065, longitude: -87.66607, rating: 4.5),
            Restaurant(name: "Eddie V's Prime Seafood", address: "521 N Rush Street Suite R01, Chicago, IL 60611", imageUrl: "http://media-cdn.tripadvisor.com/media/photo-f/06/12/6d/da/eddie-v-s.jpg", latitude: 41.891754, longitude: -87.62515, rating: 4.5),
            Restaurant(name: "Garrett Popcorn Shops", address: "625 N Michigan Ave, Chicago, IL 60611", imageUrl: "http://media-cdn.tripadvisor.com/media/photo-f/01/f9/d3/4d/pork-shoulder.jpg", latitude: 41.893055, longitude: -87.62417, rating: 4.5)
        ]
        
        return restaurants
    }
}
