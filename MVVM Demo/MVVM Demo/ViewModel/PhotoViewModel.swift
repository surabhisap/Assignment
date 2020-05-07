//
//  PhotoViewModel.swift
//  MVVM Demo
//
//  Created by Surabhi Agnihotri on 5/7/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation
import UIKit

struct PhotoViewModel {
    
    let name: String
    let url: URL?
    
    // Dependency Injection
    init(photo: Photo) {
        self.name = photo.title!
        self.url = photo.url_z
    }
}
