import Foundation

struct Game{
    let flags = ["🇨🇦","🇺🇸","🇨🇳","🇻🇨","🇬🇧","🇷🇺","🇯🇵","🇬🇸"]
    let countries = ["Canada","United States","China","St. Vincent & Grenadines","United Kingdom","Russia","Japan","South Georgia & South Sandwich Islands"]
    var answers : [String] = []
    var question : String = ""
    var gameStart : Bool = false
    var correct : String = ""
    var answer : String = ""
    var score : Int = 0
    var exams : [String] = []
    var current : Int = 0
    var total : Int = 10
    var source : [Int] = []
    
    mutating func newGame(){
        exams = Array(countries.shuffled().prefix(10))
        current = 0
        total = exams.count
        
        for i in 0..<total {
            source.append(i)
        }
        print(source)
        
        
        
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
    
    mutating func toggleAnswer(tAnswer: String){
        answer = tAnswer
        score += 1
        gameStart = false
    }
}
