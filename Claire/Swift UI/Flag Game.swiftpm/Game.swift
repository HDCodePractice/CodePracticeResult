import Foundation

struct Game{
    let flags = ["🇨🇦","🇺🇸","🇨🇳","🇻🇨","🇬🇧","🇷🇺","🇯🇵","🇬🇸"]
    let countries = ["Canada","United States","China","St. Vincent & Grenadines","United Kingdom","Russia","Japan","South Georgia & South Sandwich Islands"]
    var answers : [String] = []
    var question : String = ""
    var gameStart : Bool = false
    var questionStart : Bool = false
    var correct : String = ""
    var answer : String = ""
    var score : Int = 0
    var exams : [String] = []
    var current : Int = 0
    var total : Int = 10
    
    mutating func newGame(){
        exams = Array(countries.shuffled().prefix(10))
        total = exams.count
        current = 0
        setQuestion()
        questionStart = true
    }
    
    mutating func setQuestion() {
        var source : [Int] = []
        for i in 0..<countries.count {
            source.append(i)
        }
        
        let currentIndex = countries.firstIndex(of: exams[current]) ?? 0
        print(currentIndex)
        
        source.remove(at: currentIndex)
        source = Array(source.shuffled().prefix(3))
        source.append(currentIndex)
        source.shuffle()
        correct = flags[currentIndex]
        answers = []
        for i in source {
            answers.append(flags[i])
        }
        // question
        question = countries[currentIndex]
        gameStart = true
        // showResult = false
    }
    
    mutating func nextQuestion() {
        if current >= total-1 {
            gameStart = false
        } else {
            questionStart = true
            current += 1
            setQuestion()
        }
    }
    
    mutating func toggleAnswer(tAnswer: String){
        // current < total || current = total
        // gamestart = false
        // current < total
        // showResult = true
        
        answer = tAnswer
        score += 1
        
        gameStart = true
        questionStart = false
    }
}

