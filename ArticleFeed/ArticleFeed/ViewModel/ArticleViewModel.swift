//
//  ArticleViewModel.swift
//  ArticleFeed
//
//  Created by Surabhi Agnihotri on 5/15/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleConfigurable {
    func fetchData(completion: @escaping ([Docs]?, Error?) -> ())
}

class ArticleViewModel: ArticleConfigurable {
    
    func fetchData(completion: @escaping ([Docs]?, Error?) -> ()){
        Service.shared.fetchArticleData { (data, err) in
            guard let articleData = data else { return }
            completion(articleData, nil)
        }
    }
    
}
