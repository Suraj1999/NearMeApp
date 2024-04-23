//
//  PlacesTableViewController.swift
//  NearMeMap
//
//  Created by Suraj Gupta on 23/04/24.
//

import Foundation
import UIKit
import MapKit

class PlacesTableViewController: UITableViewController{
    
    var userLocation: CLLocation
    let places: [PlaceAnnotations]
    
    init(userLocation: CLLocation, places: [PlaceAnnotations]) {
        self.userLocation = userLocation
        self.places = places
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlacesCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath)
        let place = places[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = place.name
        content.secondaryText = "Secondary Text"
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}


