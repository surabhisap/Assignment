//
//  DetailViewModel.swift
//  Alamofire MVVM
//
//  Created by Surabhi Agnihotri on 5/20/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Alamofire

protocol DetailViewConfigurable {
    
    var photoModel: PhotoViewConfigurable { get }
    func getImage(completion: @escaping (UIImage) -> Void)
}

class DetailViewModel: DetailViewConfigurable {
    
    let photoModel: PhotoViewConfigurable
    
    init(photoModel: PhotoViewConfigurable) {
        self.photoModel = photoModel
    }
    
    func getImage(completion: @escaping (UIImage) -> Void) {
        
        AF.request(photoModel.url?.absoluteString ?? "", method: .get).response{ response in
            switch response.result {
            case .success(let responseData):
                if let responseData = responseData, let image = UIImage(data: responseData, scale:1) {
                    completion(image)
                }
            case .failure(let error):
                print("error--->",error)
            }
        }
    }
}
