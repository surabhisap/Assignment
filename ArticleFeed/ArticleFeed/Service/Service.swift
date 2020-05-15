//
//  Service.swift
//  ArticleFeed
//
//  Created by Surabhi Agnihotri on 5/15/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchArticleData(completion: @escaping ([Docs]?, Error?) -> ()) {
        let urlString = "https://api.plos.org/search?q=title:DNA"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch data:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let articleData = try JSONDecoder().decode(ArticleObject.self, from: data)
                DispatchQueue.main.async {
                    completion(articleData.response?.docs, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }

}
