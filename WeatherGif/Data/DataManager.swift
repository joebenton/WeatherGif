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
    var gifRepository: GifRepository = GiphyAPIImpl()
    
    func getForecast(withLatitude lat: Double, withLongitude lng: Double, completion: @escaping (_ forecast: Forecast?, _ errorMessage: String?) -> Void) {
        forecastRepository.getForecast(withLatitude: lat, withLongitude: lng) { (forecast, errorMessage) in
            completion(forecast, errorMessage)
        }
    }
    
    func getRandomGif(tag: String, completion: @escaping (_ gif: Gif?, _ errorMessage: String?) -> Void) {
        gifRepository.getRandomGif(tag: tag) { (gif, errorMessage) in
            completion(gif, errorMessage)
        }
    }

}
