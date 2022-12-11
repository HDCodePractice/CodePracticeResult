
public func checkThreeOfAKind(cards:[Int])->Int{
    for i in 0..<cards.count{
        for j in i..<cards.count{
            for l in j..<cards.count{
                if cards[i]==cards[j] && cards[j]==cards[l] && i != j && j != l{
                    return cards[i]
                }
            }
        }
    }
    return 0
}
public func checkThreeOfAKindWon(player1: [Int], player2: [Int])->Int{
    if checkThreeOfAKind(cards: player1)>checkThreeOfAKind(cards: player2){
        return 1
    }else if checkThreeOfAKind(cards: player1)<checkThreeOfAKind(cards: player2){
        return 2
    }else{
        var player1Cards = player1
        var player2Cards = player2
        let player1Pair = checkThreeOfAKind(cards: player1Cards)
        let player2Pair = checkThreeOfAKind(cards: player2Cards)
        player1Cards.remove(at: player1Cards.firstIndex(of: player1Pair)!)
        player1Cards.remove(at: player1Cards.firstIndex(of: player1Pair)!)
        player2Cards.remove(at: player2Cards.firstIndex(of: player2Pair)!)
        player2Cards.remove(at: player2Cards.firstIndex(of: player2Pair)!)
        player1Cards.remove(at: player1Cards.firstIndex(of: player1Pair)!)
        player2Cards.remove(at: player2Cards.firstIndex(of: player2Pair)!)
        if checkTwoPair(cards: player1).count != 0||checkTwoPair(cards: player2).count != 0{
            return checkOnePairWon(player1: player1Cards, player2: player2Cards)
        }else{
            return checkWon(player1: player1Cards, player2: player2Cards)
        }
    }
}
