//
//  ViewController.swift
//  PanGustureRecognizer
//
//  Created by Surabhi Agnihotri on 5/4/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fileImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGusture(view: fileImageView)
        fileViewOrigin = fileImageView.frame.origin
        view.bringSubviewToFront(fileImageView)
        fileImageView.isUserInteractionEnabled = true
    }
    
    func addPanGusture(view: UIView) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
            
        case .began, .changed:
            fileView.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            
        case .ended:
            if fileView.frame.intersects(trashImageView.frame) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.fileImageView.alpha = 0.0
                })
            } else {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.fileImageView.frame.origin = self.fileViewOrigin
                })
            }
            
        default:
            break
        }
    }
}

