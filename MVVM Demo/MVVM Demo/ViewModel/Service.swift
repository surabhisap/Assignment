//
//  Service.swift
//  MVVM Demo
//
//  Created by Surabhi Agnihotri on 5/7/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchPhotos(completion: @escaping ([Photo]?, Error?) -> ()) {
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=a6d819499131071f158fd740860a5a88&extras=url_z,date_taken&format=json&nojsoncallback=1"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch photos:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let flicker = try JSONDecoder().decode(Flickr.self, from: data)
                DispatchQueue.main.async {
                    completion(flicker.photos?.photo, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }
}
