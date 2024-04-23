//
//  PlaceAnnotations.swift
//  NearMeMap
//
//  Created by Suraj Gupta on 19/04/24.
//

import Foundation
import MapKit

class PlaceAnnotations: MKPointAnnotation {
   
    let mapItem: MKMapItem
    let id = UUID()
    var isSelected: Bool = false
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
        super.init()
        self.coordinate = mapItem.placemark.coordinate
    }
    
    var name: String {
        mapItem.name ?? ""
    }
    
    var phone: String {
        mapItem.phoneNumber ?? ""
    }
    
    var address: String {
        "\(mapItem.placemark.subThoroughfare ?? "") \(mapItem.placemark.thoroughfare ?? "") \(mapItem.placemark.locality ?? "")"
    }
    
    var location: CLLocation {
        mapItem.placemark.location ?? CLLocation.default
    }
}
