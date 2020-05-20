//
//  DetailViewController.swift
//  Alamofire MVVM
//
//  Created by Surabhi Agnihotri on 5/20/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewConfigurable?
    private let photoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Photo Detail"
        setUpImageView()
        setPhotoTitle()
    }
}

private extension DetailViewController {
    
    func setUpImageView() {
        
        photoImageView.contentMode = .scaleAspectFill
        view.addSubview(photoImageView)
        
        photoImageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        viewModel?.getImage(completion: { (photo) in
            self.photoImageView.image = photo
        })
    }
    
    func setPhotoTitle() {
        
        let photoNameLabel = UILabel()
        photoNameLabel.textAlignment = .center
        photoNameLabel.textColor = .black
        photoNameLabel.font = .boldSystemFont(ofSize: 30)
        photoNameLabel.numberOfLines = 0
        view.addSubview(photoNameLabel)
        
        photoNameLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
        }
        photoNameLabel.text = viewModel?.photoModel.name
    }
}
