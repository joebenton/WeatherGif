//
//  DarkSkiesImpl.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation
import Alamofire

class DarkSkiesImpl: ForecastRepository {
    let apiKey = "e3600943b59b9ae256dde42ebef68348"
    let domain = "https://api.darksky.net"
    let forecastEndpoint = "/forecast"
    
    func getForecast(lat: Double, lng: Double, completion: @escaping (_ forecast: Forecast?, _ errorMessage: String?) -> Void) {
        let url = "\(domain)\(forecastEndpoint)/\(apiKey)/\(lat),\(lng)?exclude=[minutely,hourly,daily,alerts,flags]"
        
        Alamofire.request(url).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, Any> {
                let forecast = Forecast(jsonDictionary: JSON)
                completion(forecast, nil)
            }
        }
    }
}
