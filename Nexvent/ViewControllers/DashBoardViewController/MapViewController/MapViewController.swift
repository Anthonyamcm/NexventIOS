//
//  LocationViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 23/04/2021.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    var map: Map!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        map = Map(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        self.view.addSubview(map)
    
        
        configureLocationServices()
        
    }
    
    func centerMapOnUserLocation() {
            guard let coordinate = locationManager.location?.coordinate else {return}
            let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 12000, longitudinalMeters: 12000)
            map.setRegion(coordinateRegion, animated: true)
        }

        func configureLocationServices() {
            if authorizationStatus == .notDetermined {
                locationManager.requestAlwaysAuthorization()
            } else {
                map.mapType = MKMapType.standard
                map.isZoomEnabled = true
                map.isScrollEnabled = true
                map.isUserInteractionEnabled = true
                map.showsUserLocation = true
                map.overrideUserInterfaceStyle = .light
                map.center = view.center
                centerMapOnUserLocation()
                return
            }
        }

        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            centerMapOnUserLocation()
        }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @objc func backPressed(sender: UIButton!){
        self.dismiss(animated: true, completion: nil)
    }
    

}
