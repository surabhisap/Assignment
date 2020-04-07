//
//  TableViewCell.swift
//  TableView
//
//  Created by Surabhi Agnihotri on 4/6/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var numberOfInfectedCases: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var numberOfCasesLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
}
