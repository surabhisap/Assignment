//
//  ViewController.swift
//  AskMe8Ball
//
//  Created by Agnihotri, Surabhi on 4/6/20.
//  Copyright © 2020 Agnihotri, Surabhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomBallNumber: Int = 0
    
    
    @IBOutlet weak var askMeLabel: UILabel!
    
    @IBOutlet weak var ballImage: UIImageView!
    
    @IBOutlet weak var askButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newImage()
        
    }


    @IBAction func askButtonPressed(_ sender: Any) {
        
        newImage()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        newImage()
    }
    
    func newImage() {
        
        randomBallNumber = Int.random(in: 0 ... 4)
        ballImage.image = UIImage(named: ballArray[randomBallNumber])
        
    }
}

