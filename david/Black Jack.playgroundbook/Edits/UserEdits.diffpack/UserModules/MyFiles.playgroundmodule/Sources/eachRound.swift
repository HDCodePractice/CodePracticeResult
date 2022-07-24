

public func eachRound(
    _ playerCardsIndex:[[Int]],
    _ cards:[Int],playerId:Int, 
    _ playerChoice:Bool
)->(
    playerCards:[[Int]],
    cards:[Int]
){
    var playerCardsIndex = playerCardsIndex
    //    var playerCards = Array(repeating:[String](), count:players)
    //    var realCards = genCards()
    var cards = cards
    
    
    if playerChoice{
        playerCardsIndex[playerId].append(cards[0])
        //                    playerCards[j].append(realCards[cards[0]])
        cards.remove(at:0)
    }else{
        
        
    }
    return (playerCardsIndex,cards)
}
