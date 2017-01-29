//
//  LocationManager.swift
//  WeatherGif
//
//  Created by Joe Benton on 29/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManager {
    var locationManager: CLLocationManager? { get set }
    var delegate: LocationManagerDelegate? { get set }
    func requestLocationAuthorization()
    func startUpdatingLocation()
    func stopUpdatingLocation()
}
