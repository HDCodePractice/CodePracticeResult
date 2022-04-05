import Foundation

struct Game{
    let flags = ["🇨🇦","🇺🇸","🇨🇳","🇻🇨","🇬🇧","🇷🇺","🇯🇵","🇬🇸"]
    let countries = ["Canada","United States","China","St. Vincent & Grenadines","United Kingdom","Russia","Japan","South Georgia & South Sandwich Islands"]

    var gameStart : Bool = false
    // flags
    var answers : [String] = []
    // countrie name
    var question : String = ""
    // flag
    var correct : String = ""
    // 到了第几题
    var current : Int = 0
    var answer : String = ""
    var score : Int = 0
    var exams : [String] = []
    var total : Int = 10
    
    mutating func newGame(){
        exams = Array(countries.shuffled().prefix(10))
        total = exams.count
        current = 0
        setQuestion()
    }
    
    mutating func setQuestion(){
        var source : [Int] = []
        for i in 0..<countries.count {
            source.append(i)
        }
       
        let currentIndex = countries.firstIndex(of: exams[current]) ?? 0
        source.remove(at: currentIndex)
        source = Array(source.shuffled().prefix(3))
        source.append(currentIndex)
        source.shuffle()
        correct = flags[currentIndex]
        answers = []
        current += 1
        for i in source{
            answers.append(flags[i])
        }
        question = countries[currentIndex]
        gameStart = true
    }
    
    mutating func nextQuestion(){
        current += 1
        setQuestion()
    }
    
    mutating func toggleAnswer(tAnswer: String){
        answer = tAnswer
        score += 1
        gameStart = false
    }
}
