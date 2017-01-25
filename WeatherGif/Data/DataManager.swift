//
//  DataManager.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation

class DataManager {
    
    var forecastRepository: ForecastRepository = DarkSkiesImpl()
    
    func getForecast(withLatitude lat: Double, withLongitude lng: Double, completion: @escaping (_ forecast: Forecast?, _ errorMessage: String?) -> Void) {
        forecastRepository.getForecast(withLatitude: lat, withLongitude: lng) { (forecast, errorMessage) in
            completion(forecast, errorMessage)
        }
    }
}
