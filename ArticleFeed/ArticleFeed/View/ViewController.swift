//
//  ViewController.swift
//  ArticleFeed
//
//  Created by Surabhi Agnihotri on 5/15/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let viewModel: ArticleConfigurable = ArticleViewModel()
    private var docs: [Docs]?
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        viewModel.fetchData { (docs, nil) in
            self.docs = docs
            self.tableView.reloadData()
        }
    }
}

private extension ViewController {
    
    func setUpTableView() {
        tableView.register(CustomizedCell.self, forCellReuseIdentifier: "reuseIdentifier")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? CustomizedCell else { return UITableViewCell() }
        
        if let doc = docs?[indexPath.row] {
            cell.titleLabel.text = doc.journal
            cell.detailLabel.text = doc.title_display
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doc = docs?[indexPath.row]
        
        let detailVC = ArticleDetailViewController()
        detailVC.doc = doc
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
