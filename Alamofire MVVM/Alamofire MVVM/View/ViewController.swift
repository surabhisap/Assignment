//
//  ViewController.swift
//  Alamofire MVVM
//
//  Created by Surabhi Agnihotri on 5/19/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var photoViewModels: [PhotoViewConfigurable]?
    let cellId = "cellId"
    let tableView = UITableView()
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    private func fetchData() {
        service.fetchPhotos { (photos, err) in
            if let err = err {
                print("Failed to fetch photos:", err)
                return
            }
            self.photoViewModels = photos?.map({ PhotoViewModel(photo: $0)}) ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoViewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PhotoCell
        let photoViewModel = photoViewModels?[indexPath.row]
        cell.photoViewModel = photoViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let photoViewModels = photoViewModels else { return }
        let detailViewController = DetailViewController()
        let detailViewModel = DetailViewModel(photoModel: photoViewModels[indexPath.row])
        detailViewController.viewModel = detailViewModel
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotoCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = UIColor.green
        tableView.backgroundColor = UIColor.gray
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
    }
    
    private func setupNavBar() {
        navigationItem.title = "Photos"
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}



