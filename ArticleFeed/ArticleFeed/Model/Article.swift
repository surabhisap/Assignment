//
//  Article.swift
//  ArticleFeed
//
//  Created by Surabhi Agnihotri on 5/15/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation
import UIKit

struct ArticleObject: Codable {
    let response: Response?
}

struct Response: Codable {
    let docs: [Docs]?
    
}

struct Docs: Codable {
    let title_display: String?
    let journal: String?
}
