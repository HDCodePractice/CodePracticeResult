
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
public func checkTwoPairWon(player1:[Int],player2:[Int])->Int{
    var pairs1 = checkTwoPair(cards: player1)
    var pairs2 = checkTwoPair(cards: player2)
    if pairs1.count == 0{
        return 2
    }else if pairs2.count == 0{
        return 1
    }else{
        if pairs1.max()! > pairs2.max()!{
            return 1
        }else if pairs1.max()! < pairs2.max()!{
            return 2
        }else{
            if pairs1.min()! > pairs2.min()!{
                return 1
            }else if pairs1.min()! < pairs2.min()!{
                return 2
            }else{
                var player1cards = player1
                var player2cards = player2
                for i in 1...2{
                    player1cards.remove(at: player1cards.firstIndex(of: pairs1.max()!)!)
                    player1cards.remove(at: player1cards.firstIndex(of: pairs1.min()!)!)
                    player2cards.remove(at: player2cards.firstIndex(of: pairs2.max()!)!)
                    player2cards.remove(at: player2cards.firstIndex(of: pairs2.min()!)!)
                }
                return checkWon(player1: player1cards, player2: player2cards)
            }
        }
    }
}
