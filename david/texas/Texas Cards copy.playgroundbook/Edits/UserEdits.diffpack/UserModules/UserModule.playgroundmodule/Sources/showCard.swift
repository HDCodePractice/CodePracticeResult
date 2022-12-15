public func showPlayerCards(playerCards:[Int])->[String]{
    let cards = initCards()
    var playerShowCards:[String]=[]
    for i in playerCards{
        playerShowCards.append(cards[i-2])
    }
    return playerShowCards
}
