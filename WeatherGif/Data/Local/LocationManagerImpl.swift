//
//  LocationManagerImpl.swift
//  WeatherGif
//
//  Created by Joe Benton on 29/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate {
    func locationAuthorizationChanged(status: CLAuthorizationStatus)
    func didUpdateLocations(locations: [CLLocation])
}

class LocationManagerImpl: NSObject, LocationManager {
    var locationManager: CLLocationManager?
    var delegate: LocationManagerDelegate?

    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    func requestLocationAuthorization() {
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager?.stopUpdatingLocation()
    }
}

extension LocationManagerImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        delegate?.locationAuthorizationChanged(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            delegate?.didUpdateLocations(locations: locations)
        }
    }
}
