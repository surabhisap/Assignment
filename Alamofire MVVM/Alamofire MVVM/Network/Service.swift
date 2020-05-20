//
//  Service.swift
//  Alamofire MVVM
//
//  Created by Surabhi Agnihotri on 5/19/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation
import Alamofire

class Service: NSObject {
    
    func fetchPhotos(completion: @escaping ([Photo]?, Error?) -> ()) {
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=a6d819499131071f158fd740860a5a88&extras=url_z,date_taken&format=json&nojsoncallback=1"
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).validate().responseDecodable(of: Photos.self) { response in
            guard let response = response.value else { return }
            completion(response.photos?.photo, nil)
        }
    }
}
