//
//  DetailTableViewController.swift
//  WeatherApp
//
//  Created by Surabhi Agnihotri on 5/8/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var weatherData: [Weather: String]?
    
    var fieldArray = Weather.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Weather Details"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fieldArray.count 
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let title = fieldArray[indexPath.row]
        let detail = weatherData?[title]
        cell.textLabel?.text = title.rawValue + " = " + (detail ?? "")

        return cell
    }

}
