//
//  ViewController.swift
//  WeatherApp
//
//  Created by Surabhi Agnihotri on 5/8/20.
//  Copyright © 2020 Surabhi Agnihotri. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let viewModel = WeatherViewModel()
    let titleLabel = UILabel()
    let cityTextField = UITextField()
    let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Get weather"
        createTopLabel()
        createCityTextField()
        createButton()
    }
    
}

private extension ViewController {
    
    func createTopLabel() {
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = "Please enter the city to check weather"
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.left.equalTo(50)
            //make.width.equalTo(view.snp.width).dividedBy(2)
        }
    }
    
    func createCityTextField() {
        view.addSubview(cityTextField)
        cityTextField.borderStyle = .roundedRect
        cityTextField.placeholder = "Enter city here"
        cityTextField.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.left.equalTo(titleLabel.snp.right).offset(20)
            make.trailing.equalTo(-50)
            make.width.equalTo(titleLabel.snp.width)
        }
    }
    
    func createButton() {
        view.addSubview(submitButton)
        submitButton.backgroundColor = .red
        submitButton.setTitle("Check Weather", for: .normal)
        submitButton.layer.cornerRadius = 10
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(cityTextField.snp.bottom).offset(30)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
        
        submitButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
    }
    
    @objc func submitAction() {
        guard let city = cityTextField.text, city.count > 0 else {
            showSimpleAlert()
            return
        }
        
        let trimmedCity =  viewModel.trimWhiteSpaces(from: city)
        let destinationViewController = DetailTableViewController()
        destinationViewController.delegate = self
        
        viewModel.fetchData(city: trimmedCity) { (data) in
            let weatherData = self.viewModel.weatheModel(main: data)
            destinationViewController.viewModel = WeatherDetailsViewModel(weatherData: weatherData)
            self.navigationController?.pushViewController(destinationViewController, animated: true)
        }
    }
    
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Please enter city", message: nil, preferredStyle: .alert)

           alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
               //Cancel Action
           }))
           self.present(alert, animated: true, completion: nil)
       }
}

extension ViewController: WeatherDetailDelegate {
    
    func getColor(color: UIColor) {
        submitButton.backgroundColor = color
    }
}
