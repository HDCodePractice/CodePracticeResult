public func genCards() -> [String]{
    let suits : [String] = ["♦️","♣️","♥️","♠️"]
    let numbers : [String] = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    var cards : [String] = []
    
    for i in numbers{
        for j in suits{
            cards.append("\(j)\(i)")
        }
    }
    return cards
}

public func genCardMarks() -> [Int]{
    let suits : [String] = ["♦️","♣️","♥️","♠️"]
    let numbers : [Int] = [2,3,4,5,6,7,8,9,10,10,10,10,11]
    var cards : [Int] = []
    
    for i in numbers{
        for _ in suits{
            cards.append(i)
        }
    }
    return cards
}

public func genCardIndexes()->[Int]{
    var cards = [Int]()
    for i in 0..<52{
        cards.append(i)
    }
    return cards
}


public extension Int{
    func getSmallMark()->Int {
        if self==11{
            return 1
        }
        return self
    }
}
