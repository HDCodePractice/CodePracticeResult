import SwiftUI

class ViewModel: ObservableObject {
    let easyCountries : [Country] = [
        Country(capitalName: "Paris", countryName: "France",flag: "france"),
        Country(capitalName: "London", countryName: "the UK",flag: "uk"),
        Country(capitalName: "Beijing", countryName: "China",flag: "china"),
        Country(capitalName: "Ottawa", countryName: "Canada",flag: "canada"),
        Country(capitalName: "Washington DC", countryName: "the USA",flag: "usa")
    ]
    let normalCountries : [Country]=[
        Country(capitalName: "Brazil", countryName: "France",flag: "france"),
        Country(capitalName: "Argentina", countryName: "Paris",flag: "france"),
        Country(capitalName: "Spain", countryName: "China",flag: "france"),
        Country(capitalName: "Portugal", countryName: "China",flag: "france"),
        Country(capitalName: "India", countryName: "China",flag: "france"),
        Country(capitalName: "Spain", countryName: "China",flag: "france")
    ]
    let hardCountries : [Country]=[
        Country(capitalName: "Paris", countryName: "France",flag: "france"),
        Country(capitalName: "London", countryName: "Paris",flag: "france"),
        Country(capitalName: "Beijing", countryName: "China",flag: "france")
    ]
    let extremeCountries : [Country]=[
        Country(capitalName: "Paris", countryName: "France",flag: "france"),
        Country(capitalName: "London", countryName: "Paris",flag: "france"),
        Country(capitalName: "Beijing", countryName: "China",flag: "france")
    ]
    let wrongAnswers: [Question.Answer] = [
        Question.Answer(name:"lalalala",right:false,click: false),
        Question.Answer(name:"lalala",right:false,click: false),
        Question.Answer(name:"lala",right:false,click: false),
        Question.Answer(name:"la",right:false,click: false),
        Question.Answer(name:"Beaconsfield",right:false,click: false)
    ]
    
    @Published var questionNumber: Int = 1
    @Published var atQuestion: Int = -1
    @Published var ended: Bool = false
    @Published var quit: Bool = true
    @Published var image: String = ""
    @Published var questionEnded: Bool = false
    @Published var defaultCountries: [Country] = [
        Country(capitalName: "Paris", countryName: "France",flag: "france"),
        Country(capitalName: "London", countryName: "the UK",flag: "uk"),
        Country(capitalName: "Beijing", countryName: "China",flag: "china"),
        Country(capitalName: "Ottawa", countryName: "Canada",flag: "canada"),
        Country(capitalName: "Washington DC", countryName: "the USA",flag: "usa")
    ]
    @Published var currentQuestion: Question = Question(title:"",answers: [], rightAnswerIndex: 0)
    @Published var numberRight: Int = 0
    init() {
        getQuestion()
    }
    
    func getRight() {
        numberRight += 1
    }
    
    func reset(newCountries:[Country]) {
        quit = false
        ended = false
        defaultCountries = newCountries
        getQuestion()
        numberRight = 0
        atQuestion = -1
    }
    
    func tap(answers: [Question.Answer],item:Question.Answer) {
        questionEnded = true
        for i in 0..<answers.count {
            // find click answers[item]
            if answers[i].id == item.id{
                currentQuestion.answers[i].click = true
                    //  click item is wrong
                if answers[i].right == false {
                    // find right item
                    for j in 0..<answers.count{
                        // help right item to clicked
                        if answers[j].right == true{
                            currentQuestion.answers[j].click = true
                        }
                    }
                }
            }
        }
        questionEnded = true
    }
    
    func getQuestion() {
        questionEnded = false
        questionNumber = defaultCountries.count
        if atQuestion < questionNumber-1{
            atQuestion += 1
            image = defaultCountries[atQuestion].flag
            let countries = defaultCountries
            let wrong = wrongAnswers.shuffled()
            currentQuestion = Question(
                title:"What is the capital of \(countries[atQuestion].countryName)?",
                answers:[Question.Answer(name:countries[atQuestion].capitalName,right:true,click:false),wrong[0],wrong[1],wrong[2]], rightAnswerIndex: 0)
        } else {
            ended = true
        }
    }
}
