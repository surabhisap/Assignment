//
//  Country.swift
//  
//
//  Created by Surabhi Agnihotri on 5/19/20.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode:String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
    
}
