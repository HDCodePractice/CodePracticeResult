
public func checkResult(player1:[[Int]],player2:[[Int]])->Int{
    var player1cards : [Int] = []
    var player2cards : [Int] = []
    for i in 0..<player1.count{
        player1cards.append(player1[i][1])
        player2cards.append(player2[i][1])
    }
    if checkFlush(cards:player1) != 0 || checkFlush(cards:player2) != 0{
        return checkFlushWon(player1:player1,player2:player2)
    }else{
        if checkStraight(cards: player1cards) != 0 || checkStraight(cards: player2cards) != 0{
            if checkStraight(cards: player1cards)>checkStraight(cards: player2cards){
                return 1
            }else if checkStraight(cards: player1cards)<checkStraight(cards: player2cards){
                return 2
            }else{
                return 0
            }
        }else{
            if checkThreeOfAKind(cards: player1cards) != 0 || checkThreeOfAKind(cards: player2cards) != 0{
                return checkThreeOfAKindWon(player1: player1cards, player2: player2cards)
            }else{
                if checkTwoPair(cards: player1cards).count != 0||checkTwoPair(cards: player2cards).count != 0{
                    return checkTwoPairWon(player1: player1cards, player2: player2cards)
                }else{
                    if checkOnePair(cards: player1cards) != 0 || checkOnePair(cards: player2cards) != 0{
                        return checkOnePairWon(player1: player1cards, player2: player2cards)
                    }else{
                        if checkWon(player1: player1cards, player2: player2cards) != 0{
                            return checkWon(player1: player1cards, player2: player2cards)
                        }else{
                            return 0
                        }
                    }
                }
            }
        }
    }
    return 0
}
