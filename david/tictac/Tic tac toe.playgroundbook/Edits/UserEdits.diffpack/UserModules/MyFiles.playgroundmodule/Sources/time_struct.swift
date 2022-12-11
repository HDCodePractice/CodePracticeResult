
struct Food{
    var name: String
    var duration:Int
    var count: Int = 0
    
    func getTimeString()->String{
        let time = duration
        let minutes = time / 60
        let secondsInt = time % 60
        let seconds = secondsInt<10 ? "0\(secondsInt)" : "\(secondsInt)"
        return "\(minutes):\(seconds)"
    }
}

var foods:[Food]=[
    Food(name: "Chicken", duration: 60),
    Food(name: "Pork", duration: 60),
    Food(name: "Snake", duration: 60),
    Food(name: "Shark", duration: 60),
    Food(name: "Megalodon", duration: 120),
    Food(name: "Fish", duration: 40, count:100),
    
]
//show("\(foods)")

//for food in foods{
//    show("\(food.name):\(food.duration) \(food.count)  \(food.getTimeString())")
//}
