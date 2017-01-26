//
//  GiphyAPIImpl.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation
import Alamofire

class GiphyAPIImpl: GifRepository {
    let apiKey = "dc6zaTOxFJmzC"
    let domain = "http://api.giphy.com/v1/gifs"
    let randomEndpoint = "/random"
    
    func getRandomGif(tag: String, completion: @escaping (_ gif: Gif?, _ errorMessage: String?) -> Void) {
        let url = "\(domain)\(randomEndpoint)?api_key=\(apiKey)&tag=\(tag)"
    
        Alamofire.request(url).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, Any> {
                let gif = Gif(jsonDictionary: JSON)
                completion(gif, nil)
            }
        }
    }
}
