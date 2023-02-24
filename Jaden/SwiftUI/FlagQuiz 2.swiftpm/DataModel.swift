import SwiftUI

struct Question: Identifiable{
    let id : UUID = UUID()
    var title:String
    var answers: [Answer]
    var rightAnswerIndex: Int
    
    struct Answer: Identifiable {
        let id: UUID = UUID()
        var name:String
        var right:Bool
        var click:Bool
    }
}

struct Country: Identifiable {
    let id : UUID = UUID()
    var capitalName:String
    var countryName:String
    var flag:String
}
