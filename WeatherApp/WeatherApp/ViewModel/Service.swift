//
//  Service.swift
//  WeatherApp
//
//  Created by Surabhi Agnihotri on 5/8/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchWeatherData(city: String, completion: @escaping (Main?, Error?) -> ()) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city),usa&APPID=9144e2881834317757784f6f6bbd8e00"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch weather data:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherData.main, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }

}
