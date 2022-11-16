public func checkResult(player1:[Int],player2:[Int])->Int{
    var TwoPair1 = checkTwoPair(cards: player1)
    var TwoPair2 = checkTwoPair(cards: player2)
    
    var OnePair1 = checkOnePair(cards: player1)
    var OnePair2 = checkOnePair(cards: player2)
    
    var ThreePair1 = checkThreeOfAKind(cards: player1)
    var ThreePair2 = checkThreeOfAKind(cards: player2)
    
    // Three Pair
    if ThreePair1 == 0 && ThreePair2 == 0{ // no
        // Two Pair
        if TwoPair1.isEmpty && TwoPair2.isEmpty{ // no
            // One Pair
            if OnePair1 == 0 && OnePair2 == 0{ // no
                return checkWon(player1: player1, player2: player2)
                
            } else if OnePair1 == 0 && OnePair2 != 0 || OnePair1 != 0 && OnePair2 == 0{ // yes1
                if OnePair1 == 0{
                    return 2
                } else {
                    return 1
                }
            } else if OnePair1 != 0 && OnePair2 != 0{ // yes2
                return checkOnePairWon(player1: player1, player2: player2)
            }
        } else if TwoPair1.isEmpty && !TwoPair2.isEmpty || !TwoPair1.isEmpty && TwoPair2.isEmpty{ // yes1
            if TwoPair1.isEmpty{
                return 2
            } else {
                return 1
            }
        } else if !TwoPair1.isEmpty && !TwoPair2.isEmpty{ // yes2
            return checkTwoPairWon(player1: player1, player2: player2)
        }
    } else if ThreePair1 == 0 && ThreePair2 != 0 || ThreePair1 != 0 && ThreePair2 == 0{ // yes1
        if ThreePair1 == 0{
            return 2
        } else {
            return 1
        }
    } else if ThreePair1 != 0 && ThreePair2 != 0{ // yes2
        if ThreePair1 > ThreePair2{
            return 1
        } else {
            return 2
        }
    }
    
    return 0
}

