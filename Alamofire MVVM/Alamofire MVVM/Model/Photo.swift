//
//  Photo.swift
//  Alamofire MVVM
//
//  Created by Surabhi Agnihotri on 5/19/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation

struct Photos: Codable {
    let photos: Details?
}

struct Details: Codable {
    let photo: [Photo]?
}

struct Photo: Codable {
    let title: String?
    let url_z: URL?
}
