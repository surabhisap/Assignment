//
//  ViewController.swift
//  SnapKitProject
//
//  Created by Surabhi Agnihotri on 5/1/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
            
    private var tableView: UITableView!
    private let city = ["Pitsburgh", "Chicago", "Columbus", "Hartford", "NYC"]
    private let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SnapKit Demo"
        setUpTableView()
    }
}

private extension ViewController {
    
    func setUpTableView() {
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
             make.top.bottom.left.right.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Index clicked: \(indexPath.row)")
        print("City: \(city[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = "\(city[indexPath.row])"
        return cell
    }
}
