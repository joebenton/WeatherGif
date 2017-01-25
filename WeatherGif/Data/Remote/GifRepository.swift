//
//  GifRepository.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import Foundation

protocol GifRepository {
    func getRandomGif(tag: String, completion: @escaping (_ gif: Gif?, _ errorMessage: String?) -> Void)
}
