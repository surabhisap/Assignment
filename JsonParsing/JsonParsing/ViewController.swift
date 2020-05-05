//
//  ViewController.swift
//  JsonParsing
//
//  Created by Surabhi Agnihotri on 5/5/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import SnapKit

private let jsonUrlString = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=a6d819499131071f158fd740860a5a88&extras=url_z,date_taken&format=json&nojsoncallback=1"

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    private let cellIdentifier = "Cell"
    private var photos: [Photo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flicker API Demo"
        fetchFlickerData()
        setUpTableView()
    }
    
    // Fetching data from flicke API
    func fetchFlickerData() {
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let flickr = try JSONDecoder().decode(Flickr.self, from: data)
                self.photos = flickr.photos?.photo
                
                // Reload tableview on main thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonError {
                print("error", jsonError)
            }
        }.resume()
    }
}

private extension ViewController {
    
    func setUpTableView() {
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FlickerTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

// Mark: - TableView delegates and datasource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = photos?[indexPath.row].title
        return cell
    }
}


