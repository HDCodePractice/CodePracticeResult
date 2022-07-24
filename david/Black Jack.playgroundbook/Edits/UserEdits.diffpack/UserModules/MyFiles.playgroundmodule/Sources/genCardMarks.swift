

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
