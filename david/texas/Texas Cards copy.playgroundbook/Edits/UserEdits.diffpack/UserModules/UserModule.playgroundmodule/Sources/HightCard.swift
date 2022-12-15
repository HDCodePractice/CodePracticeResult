// cards: one player's cards, maybe have one to five
// return : sorted cards, from max to min
public func isHighCard(cards:[Int])->[Int]{
    var rcs:[Int] = []
    for i in 0..<cards.count{
        if cards[i]%13==0{
            rcs.append(13)
        }else if cards[i]%13==1{
                rcs.append(14)
        }else{
            rcs.append(cards[i]%13)
        }
    }
    rcs.sort(by:>)
//    rcs.reverse()
    
    return rcs
}

// player1 & player2 : player's cards, from 2 to 14
// return: 0: tie, 1: player1 won, 2: player2 won
public func checkHighCard(player1:[Int],player2:[Int])-> Int{
    if player1.count == player2.count{
        let p1 = isHighCard(cards: player1)
        let p2 = isHighCard(cards: player2)
        for index in 0..<p1.count{
            if p1[index] > p2[index]{
                return 1
            }else if p2[index]>p1[index]{
                return 2
            }
        }
        return 0
    }
    return -1
}
