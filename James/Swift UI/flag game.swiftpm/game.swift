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
    mutating func newGame(){
        exams = Array(countries.shuffled().prefix(10))
        total = exams.count
        
        // source = [0,1,2,3,4,5,6,7,8,9..... countries.count]
        var source : [Int] = []
        for i in 0..<countries.count {
            source.append(i)
        }
        // exams[current] -> source 的位置  firstIndex(of: "Maxime")  -> currentIndex(假设 3)
        let currentIndex = countries.firstIndex(of: exams[current]) ?? 0
        source.remove(currentIndex)  [0,1,2,4,5,6,7,8]
        source.remove(at: currentIndex)
     
        
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
