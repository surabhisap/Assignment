//
//  ViewController.swift
//  TableView
//
//  Created by Surabhi Agnihotri on 4/6/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit

class Covid19TracerViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "COVID 19 Cases in United States"
    }
    
    
}

extension Covid19TracerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        cell?.city.text = "City Name"
        cell?.numberOfInfectedCases.text = "Number Of cases"
        cell?.totalRecovered.text = "Total Recovered"
        cell?.cityNameLabel.text = "Pittsburgh"
        cell?.numberOfCasesLabel.text = "12000"
        cell?.recoveredLabel.text = "50"
        
        cell?.selectionStyle = .none
        
        return cell ?? UITableViewCell()
    }

    
}
