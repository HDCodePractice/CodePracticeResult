// cards: one player's cards, maybe have one to five
// return : pair card and more cards, form max to min, if haven't one pair,retrun []
public func isNotSingle(cards:[Int])->(pairs:[Int],singles:[Int]){
    
    var cards = isHighCard(cards:cards)
    var pairs:[Int] = []
    var singles:[Int]=[]
    
    for i in 0..<cards.count-1 {
        if cards[i]==cards[i+1]{
            pairs.append(cards[i])
        }else if cards[i] != (pairs.last ?? 0) {
            singles.append(cards[i])
        }
    }
    if cards.last != (pairs.last ?? 0) {
        singles.append(cards.last! )
    }
    return (pairs,singles)
}

// player1 & player2 : player's cards, from 2 to 14
// return: 0: tie, 1: player1 won, 2: player2 won
public func checkNotSingles(player1:[Int],player2:[Int])-> Int{
    var pairs1 = isNotSingle(cards: player1).pairs
    var pairs2 = isNotSingle(cards: player2).pairs
    var singles1 = isNotSingle(cards: player1).singles
    var singles2 = isNotSingle(cards: player2).singles
        
        if pairs1.count == pairs2.count{
            if Set(pairs1).count == Set(pairs2).count{
                if checkHighCard(player1: pairs1, player2: pairs2) != 0{
                    return checkHighCard(player1: pairs1, player2: pairs2)
                }else{
                    return checkHighCard(player1: singles1, player2: singles2)
                }
            }else if Set(pairs1).count > Set(pairs2).count{
                return 2
            }else{
                return 1
            }
            
        }else if pairs1.count>pairs2.count{
            return 1
            
        }else{
            return 2
        }
        
    
    if checkHighCard(player1: pairs1, player2: pairs2) != 0{
        return checkHighCard(player1:pairs1, player2: pairs2)
    }
    return checkHighCard(player1: singles1, player2: singles2)
    
    
    
    return 0
}
