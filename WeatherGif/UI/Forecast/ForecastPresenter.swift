//
//  ForecastPresenter.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation
import CoreLocation

protocol ForecastView {
    func setForecast(forecast: Forecast)
    func setGifImage(gif: Gif)
    func toggleLoadingState(loading: Bool)
}

class ForecastPresenter {
    
    fileprivate var view: ForecastView?
    fileprivate var dataManager: DataManager?
    fileprivate var locationManager: LocationManager?
    fileprivate var currentLocation: CLLocation?
    fileprivate var forecast: Forecast?
    fileprivate var gif: Gif?
    
    init(view: ForecastView, dataManager: DataManager? = DataManager(), locationManager: LocationManager? = LocationManagerImpl()) {
        self.view = view
        self.dataManager = dataManager
        self.locationManager = locationManager
        self.locationManager?.delegate = self
    }
    
    func getLocation() {
        locationManager?.requestLocationAuthorization()
    }
    
    func getWeatherForecast() {
        guard let lat = currentLocation?.coordinate.latitude, let lng = currentLocation?.coordinate.longitude else {
            return
        }
        
        view?.toggleLoadingState(loading: true)
        
        dataManager?.getForecast(lat: lat, lng: lng, completion: { (forecast, errorMessage) in
            if let forecast = forecast {
                self.forecast = forecast
                
                self.view?.setForecast(forecast: forecast)
                
                self.getWeatherGif()
            } else if let errorMessage = errorMessage {
                print(errorMessage)
                
                self.view?.toggleLoadingState(loading: false)
            }
        })
    }
    
    func getWeatherGif() {
        guard let forecastSummary = forecast?.weatherSummary else {
            return
        }
        
        dataManager?.getRandomGif(tag: forecastSummary, completion: { (gif, errorMessage) in
            if let gif = gif {
                self.gif = gif
                
                self.view?.setGifImage(gif: gif)
            } else if let errorMessage = errorMessage {
                print(errorMessage)
            }
            
            self.view?.toggleLoadingState(loading: false)
        })
    }
    
    func refreshPressed() {
        getWeatherForecast()
    }
}

extension ForecastPresenter: LocationManagerDelegate {
    func locationAuthorizationChanged(status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }
    
    func didUpdateLocations(locations: [CLLocation]) {
        if locations.count > 0 {
            self.currentLocation = locations.first
            locationManager?.stopUpdatingLocation()
            
            getWeatherForecast()
        }
    }
}

