//
//  OpenWeatherMapModel.swift
//  WeatherApp
//
//  Created by Surabhi Agnihotri on 5/8/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let main: Main?
}

struct Main: Codable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Double?
    let humidity: Double?
}


