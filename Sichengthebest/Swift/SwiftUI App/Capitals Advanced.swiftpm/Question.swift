import Foundation
import SwiftUI

struct Question: Identifiable{
    let id : UUID = UUID()
    var title:String
    var flag:String
    var answers: [Answer]
    var rightAnswerIndex: Int
    
    let wrongAnswers: [Answer] = [
            Question.Answer(name:"Beaconsfield",right:false,click: false),
            Question.Answer(name:"Shanghai",right:false,click: false),
            Question.Answer(name:"Porto",right:false,click: false),
            Question.Answer(name:"Manchester",right:false,click: false),
            Question.Answer(name:"Aukland",right:false,click: false),
            Question.Answer(name:"Newport",right:false,click: false),
            Question.Answer(name:"Mumbai",right:false,click: false),
            Question.Answer(name:"New York",right:false,click: false),
            Question.Answer(name:"Istanbul",right:false,click: false),
            Question.Answer(name:"Melbourne",right:false,click: false),
            Question.Answer(name:"Sydney",right:false,click: false),
            Question.Answer(name:"Nuevo Madrid",right:false,click: false),
            Question.Answer(name:"Kawakra",right:false,click: false),
            Question.Answer(name:"Click me!",right:false,click: false)
        ]
    
    struct Answer: Identifiable {
        let id: UUID = UUID()
        var name:String
        var right:Bool
        var click:Bool
    }
}

