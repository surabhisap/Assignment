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
    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    let cityTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
    let submitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Get weather"
        createTopLabel()
        createCityTextField()
        createButton()
    }
    
}

private extension ViewController {
    
    func fetchData(city: String, completion: @escaping (Main) -> ()) {
        Service.shared.fetchWeatherData(city: city) { (data, err) in
            guard let weatherData = data else { return }
            completion(weatherData)
        }
    }
    
    func createTopLabel() {
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = "Please enter the city to check weather"
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
    }
    
    func createCityTextField() {
        view.addSubview(cityTextField)
        cityTextField.borderStyle = .roundedRect
        cityTextField.placeholder = "Enter city here"
        cityTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
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
        guard let city = cityTextField.text else { return }
        let destinationViewController = DetailTableViewController()
        
        fetchData(city: city) { (data) in
            destinationViewController.weatherData = self.viewModel.weatheModel(main: data)
            self.navigationController?.pushViewController(destinationViewController, animated: true)
        }
    }
}

