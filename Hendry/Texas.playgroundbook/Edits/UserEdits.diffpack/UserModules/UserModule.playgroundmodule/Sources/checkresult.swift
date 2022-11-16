

public func checkResult(player1:[[Int]],player2:[[Int]])->Int{
    if checkFlush(cards: player1) > checkFlush(cards: player2){
        return 1
    }else if checkFlush(cards: player1) < checkFlush(cards: player2){
        return 2
    }
    return 0
}
public func checkResult(player1:[Int],player2:[Int])->Int{
    if checkStraight(cards: player1) > checkStraight(cards: player2){
        return 1
    }else if checkStraight(cards: player1) < checkStraight(cards: player2){
        return 2
    } else if checkThreeOfAKind(cards: player1) < checkThreeOfAKind(cards: player2){
        return 1
    }else if checkThreeOfAKind(cards: player1) < checkThreeOfAKind(cards: player2){
        return 2
    }else if checkTwoPair(cards: player1).count < 0 && checkTwoPair(cards: player2).count > 0{
        return 2
    } else if checkTwoPair(cards: player1).count > 0 && checkTwoPair(cards: player2).count < 0{
        return 1
    }else if checkTwoPairWon(player1: player1, player2: player2) == 1{
        return 1
    }else if checkTwoPairWon(player1: player1, player2: player2) == 2{
        return 2
    }else if checkOnePair(cards: player1) != 0 && checkOnePair(cards: player2) == 0{
        return 1
    } else if checkOnePair(cards: player1) == 0 && checkOnePair(cards: player2) != 0{
        return 2
    }else if checkOnePairWon(player1: player1, player2: player2) == 1{
        return 1
    }else if checkOnePairWon(player1: player1, player2: player2) == 2{
        return 2
    }else if checkWon(player1: player1, player2: player2) == 1{
        return 1
    }else if checkWon(player1: player1, player2: player2) == 2{
        return 2
    }
    return 0
}
