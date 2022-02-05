import Foundation
 struct Game{
    let flags = ["🇨🇦","🇺🇸","🇨🇳","🇻🇨","🇬🇧","🇷🇺","🇯🇵","🇬🇸"]
    let countries = ["Canada","United States","China","St. Vincent & Grenadines","United Kingdom","Russia","Japan","South Georgia & South Sandwich Islands"]
    var answers : [String] = []
    var question : String = ""
    var gameStart : Bool = false
    var correct : String = ""
    
    mutating func newGame(){
        let rCountries = Array(countries.shuffled().prefix(4))
        if let q = rCountries.first {
            question = q
            if let index = countries.firstIndex(of: q) {
                correct = flags[index]
            }
            answers = []
            for c in rCountries.shuffled(){
                if let index = countries.firstIndex(of: c){
                    answers.append(flags[index])
                }
            }
            gameStart = true
        }
    }
}
