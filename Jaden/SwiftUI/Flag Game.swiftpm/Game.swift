import Foundation

struct Game{
    var Difficulty: String = "Easy"
    let EasyFlags = ["🇨🇦","🇺🇸","🇨🇳","🇬🇧","🇷🇺","🇯🇵","🇦🇷","🇦🇺","🇧🇷","🇧🇪","🇬🇷","🇮🇳","🇿🇦","🇪🇸","🇵🇹","🇫🇷"]
    var EasyCountries = ["Canada","United States","China","United Kingdom","Russia","Japan","Argentina","Australia","Brazil","Belgium","Greece","India","South Africa","Spain","Portugal","France"]
    var answers : [String] = []
    var question : String = ""
    var gameStart : Bool = false
    var correct : String = ""
    var answer : String = ""
    var score : Int = 0
    var exams : [String] = []
    var current : Int = 0
    var total : Int = 10
    var Results: Bool = false
    
    mutating func execute(Countries: [String], Flags: [String]) {
        if current < total {
            var xe = Countries
            if let index = Countries.firstIndex(of: exams[current]) {
                xe.remove(at: index)
            }
            
            var rCountries = Array(xe.shuffled().prefix(3))
            rCountries.append(exams[current])
            if let q = rCountries.last {
                question = q
                if let index = Countries.firstIndex(of: q) {
                    correct = Flags[index]
                }
                answers = []
                for c in rCountries.shuffled(){
                    if let index = Countries.firstIndex(of: c){
                        answers.append(Flags[index])
                    }
                }
                gameStart = true
            }
        } else {
            Results = true
        }
    }
    
    mutating func newGame() {
        if current == 0 {
            if Difficulty == "Start" {
                exams = Array(EasyCountries.shuffled().prefix(10))
            }
            total = exams.count
        }
        if Difficulty == "Start" {
            execute(Countries: EasyCountries, Flags: EasyFlags)
        }
    }
    
    mutating func toggleAnswer(tAnswer: String){
        answer = tAnswer
        gameStart = false
    }
}
