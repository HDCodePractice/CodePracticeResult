
public func isStraight(cards:[Int])->Bool{
    var cards = isHighCard(cards: cards)
    
    if isNotSingle(cards: cards).pairs.count == 0{
        
        if cards[0]==14 && cards[1]==5 {
            cards[0] = 1
            cards = cards.sorted(by:>)
        }
        
        for i in 0...cards.count-2{
            if cards[i] != cards[i+1] + 1{
                return false
            }
        }
        return true
    }
    return false
}
