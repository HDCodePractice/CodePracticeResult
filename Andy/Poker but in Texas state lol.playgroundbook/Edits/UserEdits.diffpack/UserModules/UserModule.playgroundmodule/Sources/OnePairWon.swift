
public func checkOnePair(cards:[Int])->Int{
    for i in 0..<cards.count{
        for j in i..<cards.count{
            if cards[i] == cards[j] && i != j{
                return cards[i]
            }
        }
    }
    return 0
}
public func checkOnePairWon(player1:[Int], player2:[Int])->Int{
    var player1Cards = player1
    var player2Cards = player2
    let player1Pair = checkOnePair(cards: player1Cards)
    let player2Pair = checkOnePair(cards: player2Cards)
    let pairWon = checkWon(player1: [player1Pair], player2: [player2Pair])
    if pairWon > 0{
        return  pairWon
    }
    
    player1Cards.remove(at: player1Cards.firstIndex(of: player1Pair)!)
    player1Cards.remove(at: player1Cards.firstIndex(of: player1Pair)!)
    player2Cards.remove(at: player2Cards.firstIndex(of: player2Pair)!)
    player2Cards.remove(at: player2Cards.firstIndex(of: player2Pair)!)
    return checkWon(player1: player1Cards, player2: player2Cards)
}
