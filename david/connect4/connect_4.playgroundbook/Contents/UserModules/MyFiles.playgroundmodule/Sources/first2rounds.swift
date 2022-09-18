

public func first2Rounds(_ players:Int,_ sets:Int)->(playerCardsIndex:[[Int]],cards:[Int]){
    var rounds = 1
    var playerCardsIndex = Array(repeating:[Int](), count:players)
    //    var playerCards = Array(repeating:[String](), count:players)
    //    var realCards = genCards()
    var cards = genCardIndexes(sets)
    cards.shuffle()
    
    for _ in 0...1{
        for i in 0...(players-1){
            playerCardsIndex[i].append(cards[0])
            //            playerCards[i].append(realCards[cards[0]])
            cards.remove(at:0)
        }
        rounds += 1
    }
    return (playerCardsIndex,cards)
    
}
