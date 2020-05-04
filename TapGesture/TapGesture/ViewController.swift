//
//  ViewController.swift
//  TapGesture
//
//  Created by Surabhi Agnihotri on 5/4/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    var animalImageViewOrigin: CGPoint!
    
    var colors: [UIColor] = [.red, .green, .yellow, .blue, .gray]
    var selectedColorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGusture(view: animalImageView)
        animalImageViewOrigin = animalImageView.frame.origin
        view.bringSubviewToFront(animalImageView)
        animalImageView.isUserInteractionEnabled = true
    }
    
    func addPanGusture(view: UIView) {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        view.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 2
    }
    
    @objc func doubleTapped(sender: UITapGestureRecognizer) {
        
        view.backgroundColor = colors[selectedColorIndex]
        selectedColorIndex += 1
        if selectedColorIndex == colors.count { selectedColorIndex = 0 }
    }
}

