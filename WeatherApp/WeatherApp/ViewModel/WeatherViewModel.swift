//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Surabhi Agnihotri on 5/8/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    func weatheModel(main: Main) -> [Weather: String] {
        var data = [Weather: String]()
        data[.temperature] = "\(main.temp ?? 0)"
        data[.feelsLike] = "\(main.feels_like ?? 0)"
        data[.minimumTemperature] = "\(main.temp_min ?? 0)"
        data[.maximumemperature] = "\(main.temp_max ?? 0)"
        data[.pressure] = "\(main.pressure ?? 0)"
        data[.humidity] = "\(main.humidity ?? 0)"
        return data
    }
    
    func trimWhiteSpaces(from city: String) -> String {
        let trimmedString = city.replacingOccurrences(of: "\\s", with: "%20", options: .regularExpression)
        return trimmedString
    }
    
    func fetchData(city: String, completion: @escaping (Main) -> ()) {
           Service.shared.fetchWeatherData(city: city) { (data, err) in
               guard let weatherData = data else { return }
               completion(weatherData)
           }
       }
}

enum Weather: String, CaseIterable {
    case temperature = "Temperature"
    case feelsLike = "Feels Like"
    case minimumTemperature = "Minimum Temperature"
    case maximumemperature = "Maximum Temperature"
    case pressure = "Pressure"
    case humidity = "Humidity"
}
