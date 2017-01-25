//
//  ForecastViewController.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {

    var presenter: ForecastPresenter?
    var locationManager: CLLocationManager?
    
    @IBOutlet weak var weatherGifWebView: UIWebView!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        presenter = ForecastPresenter(view: self)
        presenter?.getLocation()
    }
}

extension ForecastViewController: ForecastView {
    func setForecast(forecast: Forecast) {
        weatherTypeLabel.text = forecast.weatherSummary
        if let temperature = forecast.temperature {
            temperatureLabel.text = String(temperature)
        }
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
    
    func setGifImage(gif: Gif) {
    }
}

extension ForecastViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        presenter?.locationAuthorizationChanged(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            presenter?.didUpdateLocations(locations: locations)
        }
    }
}
