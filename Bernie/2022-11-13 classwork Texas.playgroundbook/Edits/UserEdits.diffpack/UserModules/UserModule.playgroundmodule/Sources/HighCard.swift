// Code inside modules can be shared between pages and other source files.
// cards: one player's cards, maybe have one to five
// return : sorted cards, from max to min
public func isHighCard(cards:[Int])->[Int]{
    var playerCards = cards
    playerCards.sort()
    playerCards.reverse()
//     print(playerCards)
    return playerCards
}


// player1 & player2 : player's cards, from 2 to 14
// return: 0: tie, 1: player1 won, 2: player2 won
public func checkHighCard(player1:[Int],player2:[Int])-> Int{
    var player1Card = isHighCard(cards: player1)
    var player2Card = isHighCard(cards: player2)
    if player1.count == player2.count{
        for i in 0..<player1.count{
            if player1Card[i] > player2Card[i]{
                return 1
            }
            if player1Card[i] < player2Card[i]{
                return 2
            }
        }
        return 0
    }
    return -1
}
