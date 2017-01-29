//
//  ForecastViewController.swift
//  WeatherGif
//
//  Created by Joe on 25/01/2017.
//  Copyright © 2017 Joe Benton. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    var presenter: ForecastPresenter?
    
    @IBOutlet weak var weatherGifWebView: UIWebView!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var refreshBtn: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        presenter = ForecastPresenter(view: self)
        presenter?.getLocation()
    }
    @IBAction func refreshBtnPressed(_ sender: Any) {
        presenter?.refreshPressed()
    }
}

extension ForecastViewController: ForecastView {
    func setForecast(forecast: Forecast) {
        weatherTypeLabel.text = forecast.weatherSummary
        if let temperature = forecast.temperature {
            temperatureLabel.text = "\(temperature) Degrees Outside"
        }
    }
    
    func setGifImage(gif: Gif) {
        guard let gifUrlString = gif.imageUrl else {
            return
        }
        
        if let gifUrl = URL(string: gifUrlString) {
            weatherGifWebView.loadRequest(URLRequest(url: gifUrl))
        }
    }
    
    func toggleLoadingState(loading: Bool) {
        switch loading {
        case true:
            loadingIndicator.startAnimating()
            refreshBtn.isHidden = true
        case false:
            loadingIndicator.stopAnimating()
            refreshBtn.isHidden = false
        }
    }
}
