//
//  File.swift
//  CapitalsAdvansed
//
//  Created by 老房东 on 2022-05-07.
//

import Foundation

class ViewModel: ObservableObject{
    let easyCountries : [Country] = [
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
        let normalCountries : [Country]=[
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
        let hardCountries : [Country]=[
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
        let extremeCountries : [Country]=[
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
        let wrongAnswers: [Question.Answer] = [
            Question.Answer(name:"Beaconsfield",right:false,click: false),
            Question.Answer(name:"Shanghai",right:false,click: false),
            Question.Answer(name:"Porto",right:false,click: false),
            Question.Answer(name:"Manchester",right:false,click: false),
            Question.Answer(name:"Aukland",right:false,click: false),
            Question.Answer(name:"Newport",right:false,click: false),
            Question.Answer(name:"Mumbai",right:false,click: false),
            Question.Answer(name:"New York",right:false,click: false),
            Question.Answer(name:"Istanbul",right:false,click: false),
            Question.Answer(name:"Melbourne",right:false,click: false),
            Question.Answer(name:"Sydney",right:false,click: false),
            Question.Answer(name:"Nuevo Madrid",right:false,click: false),
            Question.Answer(name:"Kawakra",right:false,click: false),
            Question.Answer(name:"Click me, I'm the right one",right:false,click: false)
        ]
    
}
