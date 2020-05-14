//
//  PhotoViewModel.swift
//  MVVM Demo
//
//  Created by Surabhi Agnihotri on 5/7/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoViewConfigurable {
    
    var name: String { get }
    var url: URL? { get }
}


struct PhotoViewModel: PhotoViewConfigurable {
    
    let name: String
    let url: URL?
    
    // Dependency Injection
    init(photo: Photo) {
        self.name = photo.title!
        self.url = photo.url_z
    }
}
