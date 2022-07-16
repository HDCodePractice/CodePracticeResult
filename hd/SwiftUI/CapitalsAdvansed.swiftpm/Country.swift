//
//  Country.swift
//  CapitalsAdvansed
//
//  Created by 老房东 on 2022-05-07.
//

import Foundation

struct Country: Identifiable {
    let id : UUID = UUID()
    var capitalName:String
    var countryName:String
    var flag:String
}
