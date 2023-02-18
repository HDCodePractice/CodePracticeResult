import Foundation
import CoreText

struct Game {
    var Difficulty: String = "Easy"
    let EasyFlags = ["🇨🇦","🇺🇸","🇨🇳","🇬🇧","🇷🇺","🇯🇵","🇦🇷","🇦🇺","🇧🇷","🇧🇪","🇬🇷","🇮🇳","🇿🇦","🇪🇸","🇫🇷"]
    let EasyCountries = ["Canada","United States","China","United Kingdom","Russia","Japan","Argentina","Australia","Brazil","Belgium","Greece","India","South Africa","Spain","France"]
    var Answers: [String] = []
    var Question: String = ""
    var GameStart: Bool = false
    var CorrectAnswer: String = ""

    mutating func newGame() {
        var randomCountries: [String] = []
        if Difficulty == "Easy" {
            randomCountries = Array(EasyCountries.shuffled().prefix(4))
        }

        if let tempVar = randomCountries.first {
            Question = tempVar
            Answers = []
                if let index = EasyCountries.firstIndex(of: tempVar) {
                    CorrectAnswer = EasyFlags[index]
                }
                for shuffledCountries in randomCountries.shuffled() {
                    if let index = EasyCountries.firstIndex(of: shuffledCountries) {
                        Answers.append(EasyFlags[index])
                    }
                }
                GameStart = true            }
        }
    }
