//
//  DetailViewController.swift
//  ArticleFeed
//
//  Created by Surabhi Agnihotri on 5/18/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import SnapKit

class ArticleDetailViewController: UITableViewController {
    
    var doc: Docs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomizedCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
}

extension ArticleDetailViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? CustomizedCell else { return UITableViewCell() }
        
        cell.titleLabel.text = doc?.title_display
        cell.detailLabel.text = doc?.article_type
        return cell
    }
    
}


