import Foundation

struct Game{
    var Difficulty: String = "Easy"
    let EasyFlags = ["🇨🇦","🇺🇸","🇨🇳","🇬🇧","🇷🇺","🇯🇵","🇦🇷","🇦🇺","🇧🇷","🇧🇪","🇬🇷","🇮🇳","🇿🇦","🇪🇸","🇵🇹","🇫🇷"]
    var EasyCountries = ["Canada","United States","China","United Kingdom","Russia","Japan","Argentina","Australia","Brazil","Belgium","Greece","India","South Africa","Spain","Portugal","France"]
    let MediumFlags = ["🇻🇳","🇷🇴","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇲🇾","🇬🇪","🇩🇪","🇱🇦","🇾🇹","🇲🇽","🇲🇦","🇳🇵","🇳🇱","🇰🇷","🇻🇮","🇻🇦","🇨🇭"]
    let MediumCountries = ["Vietnam","Romania","Scotland","Malaysia","Georgia","Germany","Laos","Mayotte","Mexico","Morocco","Nepal","Netherlands","South Korea","the US Virgin Islands","Vatican City","Switzerland"]
    let HardFlags = ["🇻🇨","🇬🇸","🇰🇿","🇫🇲","🇶🇦","🇮🇲","🇲🇼","🇲🇶","🇵🇱","🇵🇲","🇹🇲","🇬🇵","🇧🇭","🇹🇹","🇲🇨"]
    let HardCountries = ["St. Vincent & Grenadines","South Georgia & South Sandwich Islands","Kazakhstan","Micronesia","Qatar","the Isle of Man","Malawi","Martinique","Poland","Saint Pierre & Miquelon","Turkmenistan","Guadeloupe","Bahrain","Trinidad & Tobago","Monaco"]
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
            if Difficulty == "Easy" {
                exams = Array(EasyCountries.shuffled().prefix(10))
            } else if Difficulty == "Medium" {
                exams = Array(MediumCountries.shuffled().prefix(10))
            } else if Difficulty == "Hard" {
                exams = Array(HardCountries.shuffled().prefix(10))
            }
            total = exams.count
        }
        if Difficulty == "Easy" {
            execute(Countries: EasyCountries, Flags: EasyFlags)
        } else if Difficulty == "Medium" {
            execute(Countries: MediumCountries, Flags: MediumFlags)
        } else if Difficulty == "Hard" {
            execute(Countries: HardCountries, Flags: HardFlags)
        }
    }
    
    mutating func toggleAnswer(tAnswer: String){
        answer = tAnswer
        gameStart = false
    }
}
