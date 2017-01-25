//
//  ForecastRepository.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation

protocol ForecastRepository {
    func getForecast(withLatitude lat: Double, withLongitude lng: Double, completion: (_ forecast: Forecast?, _ errorMessage: String?) -> Void)
}