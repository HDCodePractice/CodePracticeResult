
public var cards: [Int] = []

public func shuffleCards (_ n: Int=3){
    cards=[]
    for i in 1...n{
        cards.append(contentsOf:genCardIndexes())
    }
    cards.shuffle()
}
