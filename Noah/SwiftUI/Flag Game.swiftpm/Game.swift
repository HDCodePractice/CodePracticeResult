import Foundation
import CoreText

struct Game {
    var Difficulty: String = "Easy"
    let EasyFlags = ["🇨🇦","🇺🇸","🇨🇳","🇬🇧","🇷🇺","🇯🇵","🇦🇷","🇦🇺","🇧🇷","🇧🇪","🇬🇷","🇮🇳","🇿🇦","🇪🇸","🇵🇹","🇫🇷"]
    let EasyCountries = ["Canada","United States","China","United Kingdom","Russia","Japan","Argentina","Australia","Brazil","Belgium","Greece","India","South Africa","Spain","Portugal","France"]
    let MediumFlags = ["🇻🇳","🇷🇴","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇲🇾","🇬🇪","🇩🇪","🇱🇦","🇾🇹","🇲🇽","🇲🇦","🇳🇵","🇳🇱","🇰🇷","🇻🇮","🇻🇦","🇨🇭"]
    let MediumCountries = ["Vietnam","Romania","Scotland","Malaysia","Georgia","Germany","Laos","Mayotte","Mexico","Morocco","Nepal","Netherlands","South Korea","the US Virgin Islands","Vatican City","Switzerland"]
    let HardFlags = ["🇻🇨","🇬🇸","🇰🇿","🇫🇲","🇶🇦","🇮🇲","🇲🇼","🇲🇶","🇵🇱","🇵🇲","🇹🇲","🇬🇵","🇧🇭","🇹🇹","🇲🇨"]
    let HardCountries = ["St. Vincent & Grenadines","South Georgia & South Sandwich Islands","Kazakhstan","Micronesia","Qatar","the Isle of Man","Malawi","Martinique","Poland","Saint Pierre & Miquelon","Turkmenistan","Guadeloupe","Bahrain","Trinidad & Tobago","Monaco"]
    var Answers: [String] = []
    var Question: String = ""
    var GameStart: Bool = false
    var CorrectAnswer: String = ""
    var CorrectAnswerCount: Int = 0
    var Progress: [Int] = [0,0]
    
    mutating func newGame() {
        var randomCountries: [String] = []
        if Difficulty == "Easy" {
            randomCountries = Array(EasyCountries.shuffled().prefix(4))
        } else if Difficulty == "Medium" {
            randomCountries = Array(MediumCountries.shuffled().prefix(4))
        } else if Difficulty == "Hard" {
            randomCountries = Array(HardCountries.shuffled().prefix(4))
        }
        
        if let tempVar = randomCountries.first {
            Question = tempVar
            Answers = []
            if Difficulty == "Easy" {
                if let index = EasyCountries.firstIndex(of: tempVar) {
                    CorrectAnswer = EasyFlags[index]
                }
                for shuffledCountries in randomCountries.shuffled() {
                    if let index = EasyCountries.firstIndex(of: shuffledCountries) {
                        Answers.append(EasyFlags[index])
                    }
                }
                GameStart = true
            } else if Difficulty == "Medium" {
                if let index = MediumCountries.firstIndex(of: tempVar) {
                    CorrectAnswer = MediumFlags[index]
                }
                for shuffledCountries in randomCountries.shuffled() {
                    if let index = MediumCountries.firstIndex(of: shuffledCountries) {
                        Answers.append(MediumFlags[index])
                    }
                }
                
            } else if Difficulty == "Hard" {
                if let index = HardCountries.firstIndex(of: tempVar) {
                    CorrectAnswer = HardFlags[index]
                }
                for shuffledCountries in randomCountries.shuffled() {
                    if let index = HardCountries.firstIndex(of: shuffledCountries) {
                        Answers.append(HardFlags[index])
                    }
                }
            }
        }
        GameStart = true
    }
}
