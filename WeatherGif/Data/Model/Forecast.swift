//
//  Forecast.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation

struct Forecast {
    var weatherSummary: String?
    var temperature: Double?
    
    init(jsonDictionary: Dictionary<String, Any>) {
        if let currentlyDict = jsonDictionary["currently"] as? Dictionary<String,Any> {
            
            if let summary = currentlyDict["summary"] as? String {
                self.weatherSummary = summary
            }
            
            if let temperature = currentlyDict["temperature"] as? Double {
                self.temperature = temperature
            }
        }
    }
}
