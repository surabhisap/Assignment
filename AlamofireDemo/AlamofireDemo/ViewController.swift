//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Surabhi Agnihotri on 5/19/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UITableViewController {
    
     var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCustomizedCell")
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CountryCustomizedCell", for: indexPath)
        
        let country = countries[indexPath.row]
        
        cell.textLabel?.text = country.name
        
        return cell
    }
}
