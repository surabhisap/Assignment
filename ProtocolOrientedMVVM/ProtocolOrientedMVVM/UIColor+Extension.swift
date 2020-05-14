//
//  UIColor+Extension.swift
//  ProtocolOrientedMVVM
//
//  Created by Surabhi Agnihotri on 5/14/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
