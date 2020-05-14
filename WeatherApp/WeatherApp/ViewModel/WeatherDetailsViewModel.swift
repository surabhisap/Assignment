//
//  WeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by Surabhi Agnihotri on 5/13/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation

protocol WeatherDetailsViewConfigurable {
    
    var weatherData: [Weather: String] { get }
    
    var fieldArray: [Weather] { get }
}

class WeatherDetailsViewModel: WeatherDetailsViewConfigurable {
    
    let weatherData: [Weather: String]
    
    let fieldArray = Weather.allCases
    
    init(weatherData: [Weather: String]) {
        
        self.weatherData = weatherData
    }
}
