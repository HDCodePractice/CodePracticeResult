

public func genCardIndexes(_ sets:Int)->[Int]{
    var cards = [Int]()
    for _ in 1...sets{
        for i in 0..<52{
            cards.append(i)
        }
    }
    
    return cards
}
