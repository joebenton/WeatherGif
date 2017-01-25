//
//  DarkSkiesImpl.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation

class DarkSkiesImpl: ForecastRepository {
    let apiKey = "e3600943b59b9ae256dde42ebef68348"
    let domain = "https://api.darksky.net"
    let forecastEndpoint = "/forecast"
    
    func getForecast(withLatitude lat: Double, withLongitude lng: Double, completion: (_ forecast: Forecast?, _ errorMessage: String?) -> Void) {
        let url = "\(domain)\(forecastEndpoint)/\(apiKey)/\(lat),\(lng)"
        print(url)
        
        let forecast = Forecast(weatherSummary: "Rain", temperature: "23")
        completion(forecast, nil)
    }
}
