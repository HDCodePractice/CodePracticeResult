import SwiftUI

struct ViewModel{
    let items = [City(name: "Montreal", timeDifference: "Today,+0HRS", time: "11:50AM")]
}

struct City: Identifiable{
    let id : UUID = UUID()
    var name:String
    var timeDifference:String
    var time:String
}
