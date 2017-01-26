//
//  Gif.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation

struct Gif {
    var imageUrl: String?
    
    init(jsonDictionary: Dictionary<String, Any>) {
        if let dataDict = jsonDictionary["data"] as? Dictionary<String,Any> {
            
            if let imageUrl = dataDict["image_url"] as? String {
                self.imageUrl = imageUrl
            }
        }
    }
}
