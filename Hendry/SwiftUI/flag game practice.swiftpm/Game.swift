
import Foundation

struct Game{
    let flags = ["🇨🇦","🇺🇸","🇨🇳","🇻🇨","🇬🇧","🇷🇺","🇯🇵","🇬🇸"]
    let countries = ["Canada","United States","China","St. Vincent & Grenadines","United Kingdom","Russia","Japan","South Georgia & South Sandwich Islands"]

    // game start & game end
    var gameStart : Bool = false
    var questionStart : Bool = false
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
        gameStart = true
        questionStart = true
    }
    
    mutating func setQuestion(){
        // source = [0,1,2,3,4,5,6,7,8,9..... countries.count]
        var source : [Int] = []
        for i in 0..<countries.count {
            source.append(i)
        }
        // exams[current] -> source 的位置  firstIndex(of: "Maxime")  -> currentIndex(假设 3)
        let currentIndex = countries.firstIndex(of: exams[current]) ?? 0
        // source.remove(currentIndex)  [0,1,2,4,5,6,7,8]
        source.remove(at: currentIndex)
        // source.shuffled().prefix(3)  -> [6,2,1]
        source = Array(source.shuffled().prefix(3))
        // source.append(currentIndex)  -> [6,2,1,3]
        source.append(currentIndex)
        // source.shuffle() -> [1,3,6,2]
        source.shuffle()
        correct = flags[currentIndex]
        // answers = flags里相对应的 flag
        answers = []
        for i in source{
            answers.append(flags[i])
        }
        // question
        question = countries[currentIndex]
    }
    
    mutating func nextQuestion(){
        if current == total - 1 {
            gameStart = false
            questionStart = false
        }else{
            current += 1
            setQuestion()
            questionStart = true
        }
    }
    
    mutating func toggleAnswer(tAnswer: String){
        answer = tAnswer
        score += 1
        
        questionStart = false
        gameStart = true
    }
}
