//
//  ViewController.swift
//  NearMeMap
//
//  Created by Suraj Gupta on 18/04/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    lazy var mapView: MKMapView = {
        
        let map = MKMapView()
        map.showsUserLocation = true
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    lazy var searchTextField: UITextField = {
        
        let searchTextField = UITextField()
        searchTextField.layer.cornerRadius = 10
        searchTextField.clipsToBounds = true
        searchTextField.backgroundColor = UIColor.systemBackground
        searchTextField.placeholder = "Search"
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        searchTextField.leftViewMode = .always
        
        return searchTextField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(mapView)
        view.addSubview(searchTextField)
        
//        view.bringSubviewToFront(searchTextField)
        
        // constraints of mapView to make it visible on a view
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // constraints to make searchTextField avialable
        searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width/1.2).isActive = true
        searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        searchTextField.returnKeyType = .go
    }
    


}

