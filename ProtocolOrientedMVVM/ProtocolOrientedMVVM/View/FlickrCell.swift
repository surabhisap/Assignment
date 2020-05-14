//
//  FlickrCell.swift
//  ProtocolOrientedMVVM
//
//  Created by Surabhi Agnihotri on 5/14/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation
import UIKit

class FlickrCell: UITableViewCell {
    
    var photoViewModel: PhotoViewConfigurable! {
        didSet {
            textLabel?.text = photoViewModel.name
            detailTextLabel?.text = photoViewModel.url?.absoluteString
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .white
        textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
        detailTextLabel?.textColor = isHighlighted ? .white : .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // cell customization
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

