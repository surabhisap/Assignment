//
//  DetailTableViewController.swift
//  WeatherApp
//
//  Created by Surabhi Agnihotri on 5/8/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit

protocol WeatherDetailDelegate: AnyObject {
    func getColor(color: UIColor)
}

class DetailTableViewController: UITableViewController {

    var viewModel: WeatherDetailsViewConfigurable?
    
    weak var delegate: WeatherDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Weather Details"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.fieldArray.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if let title = viewModel?.fieldArray[indexPath.row] {
            let detail = viewModel?.weatherData[title]
            cell.textLabel?.text = title.rawValue + " = " + (detail ?? "")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.getColor(color: .yellow)
        navigationController?.popViewController(animated: true)
    }

}
