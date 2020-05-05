//
//  FlickrModel.swift
//  JsonParsing
//
//  Created by Surabhi Agnihotri on 5/5/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit

struct Flickr: Codable {
    let photos: Details?
}

struct Details: Codable {
    let photo: [Photo]?
}

struct Photo: Codable {
    let title: String?
    let url_z: URL?
}
