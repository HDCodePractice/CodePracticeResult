//
//  File.swift
//  Capitals Advanced
//
//  Created by Sicheng Jiang on 2022-05-11.
//
import Foundation

enum Level {
    case easy
    case normal
    case hard
    case extreme
    
    var countries: [Country]{
        switch self {
        case .easy:
            return [
                Country(capitalName: "Paris", countryName: "France",flag: "france"),
                Country(capitalName: "London", countryName: "the UK",flag: "uk"),
                Country(capitalName: "Beijing", countryName: "China",flag: "china"),
                Country(capitalName: "Ottawa", countryName: "Canada",flag: "canada"),
                Country(capitalName: "Washington DC", countryName: "the USA",flag: "usa"),
                Country(capitalName: "Madrid", countryName: "Spain",flag: "spain"),
                Country(capitalName: "Mexico City", countryName: "Mexico",flag: "mexico"),
                Country(capitalName: "Berlin", countryName: "Germany",flag: "germany"),
                Country(capitalName: "Moscow", countryName: "Russia",flag: "russia"),
                Country(capitalName: "Tokyo", countryName: "Japan",flag: "japan"),
                Country(capitalName: "Seoul", countryName: "South Korea",flag: "southkorea"),
                Country(capitalName: "Canberra", countryName: "Australia",flag: "australia"),
                Country(capitalName: "Rome", countryName: "Italy",flag: "italy"),
                Country(capitalName: "Lisbon", countryName: "Portugal",flag: "portugal")
            ]
        case .normal:
            return [
                Country(capitalName: "Brasilia", countryName: "Brazil",flag: "brazil"),
                Country(capitalName: "New Delhi", countryName: "India",flag: "india"),
                Country(capitalName: "Bueno Aires", countryName: "Argentina",flag: "argentina"),
                Country(capitalName: "Wellington", countryName: "New Zealand",flag: "newzealand"),
                Country(capitalName: "Oslo", countryName: "Norway",flag: "norway"),
                Country(capitalName: "Stockholm", countryName: "Sweden",flag: "sweden"),
                Country(capitalName: "Athens", countryName: "Greece",flag: "greece"),
                Country(capitalName: "Ankara", countryName: "Turkey",flag: "turkey"),
                Country(capitalName: "Panama", countryName: "Panama",flag: "panama"),
                Country(capitalName: "Lima", countryName: "Peru",flag: "peru"),
                Country(capitalName: "Cairo", countryName: "Egypt",flag: "egypt"),
                Country(capitalName: "Helsinki", countryName: "Finland",flag: "finland"),
                Country(capitalName: "Copenhagen", countryName: "Denmark",flag: "denmark"),
                Country(capitalName: "Bern", countryName: "Switzerland",flag: "switzerland")
            ]
        case .hard:
            return [
                Country(capitalName: "Bangkok", countryName: "Thailand",flag: "thailand"),
                Country(capitalName: "Prague", countryName: "Czech Republic",flag: "czechia"),
                Country(capitalName: "Caracas", countryName: "Venezuela",flag: "venezuela"),
                Country(capitalName: "Santiago", countryName: "Chile",flag: "chile"),
                Country(capitalName: "Dakar", countryName: "Senegal",flag: "senegal"),
                Country(capitalName: "Algers", countryName: "Algeria",flag: "algeria"),
                Country(capitalName: "Kinshasa", countryName: "DR Congo",flag: "drc"),
                Country(capitalName: "Guatemala", countryName: "Guatemala",flag: "guatemala"),
                Country(capitalName: "La Paz", countryName: "Bolivia",flag: "bolivia"),
                Country(capitalName: "Bogóta", countryName: "Colombia",flag: "colombia"),
                Country(capitalName: "Manila", countryName: "The Philippines",flag: "philippines"),
                Country(capitalName: "Belgrade", countryName: "Serbia",flag: "serbia"),
                Country(capitalName: "Riyadh", countryName: "Saudi Arabia",flag: "saudi"),
                Country(capitalName: "Kabul", countryName: "Afghanistan",flag: "afghanistan")
            ]
        case .extreme:
            return [
                Country(capitalName: "Skopje", countryName: "North Macedonia",flag: "macedonia"),
                Country(capitalName: "Maputo", countryName: "Mozambique",flag: "mozambique"),
                Country(capitalName: "Bamako", countryName: "Mali",flag: "mali"),
                Country(capitalName: "Harare", countryName: "Zimbabwe",flag: "zimbabwe"),
                Country(capitalName: "Malé", countryName: "Maldives",flag: "maldives"),
                Country(capitalName: "Lusaka", countryName: "Zambia",flag: "zambia"),
                Country(capitalName: "Port Moresby", countryName: "Papua New Guinea",flag: "papua"),
                Country(capitalName: "Conakry", countryName: "Guinea",flag: "guinea"),
                Country(capitalName: "Ouagadougou", countryName: "Burkina Faso",flag: "burkinafaso"),
                Country(capitalName: "Belmopan", countryName: "Belize",flag: "belize"),
                Country(capitalName: "Lilongwe", countryName: "Malawi",flag: "malawi"),
                Country(capitalName: "Tirana", countryName: "Albania",flag: "albania"),
                Country(capitalName: "Thimphu", countryName: "Bhutan",flag: "bhutan"),
                Country(capitalName: "Kathmandu", countryName: "Nepal",flag: "nepal")
            ]
        }
    }
}
