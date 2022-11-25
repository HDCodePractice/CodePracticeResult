
// Check [Int] have two pair, if have two pair return [pair1,pair2],if have't return []
public func checkTwoPair(cards:[Int])->[Int]{
    let first = checkOnePair(cards: cards)
    if first != 0{
        var nextCards = cards
        nextCards.remove(at: cards.firstIndex(of: first)! )
        nextCards.remove(at: cards.firstIndex(of: first)! )
        let second = checkOnePair(cards: nextCards)
        if second != 0{
            return [first,second]
        }
    }
    return []
}



