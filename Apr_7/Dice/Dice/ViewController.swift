//
//  ViewController.swift
//  Dice
//
//  Created by Agnihotri, Surabhi on 4/7/20.
//  Copyright © 2019 Agnihotri, Sura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    @IBOutlet var LargeImage: UIView!
    
    @IBOutlet weak var diceImage1: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDiceImages()
        
    }
    

    @IBAction func changeImageButton(_ sender: Any) {
        
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    func updateDiceImages() {
        
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
     
        diceImage1.image = UIImage(named: imageArray[randomDiceIndex1])
        diceImage2.image = UIImage(named: imageArray[randomDiceIndex2])
    }
    
}

