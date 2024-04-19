//
//  ViewController.swift
//  NearMeMap
//
//  Created by Suraj Gupta on 18/04/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    
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
       
        // initialize locationManager
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        locationManager?.requestWhenInUseAuthorization() // Privacy - Location When In Use Usage Description
        locationManager?.requestAlwaysAuthorization() // different key for this - Privacy - Location Always and When In Use Usage Description
        
        locationManager?.requestLocation()
       
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
    
    
    
    // this function is to zoom in the location based on a authorization stratus
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager,
              let location = locationManager.location else{
                  return
              }
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 700, longitudinalMeters: 700)
            mapView.setRegion(region, animated: true)
        case .denied:
            print("Location services has been denied")
        case .notDetermined, .restricted:
            print("Location services has been denied and restricted")
        default:
            print("unknown reason")
        }
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}

