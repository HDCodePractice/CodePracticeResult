// cards: one player's cards, maybe have one to five
// return : pair card and more cards, form max to min, if doesn't have one pair,retrun []
public func isOnePair(cards:[Int])->[Int]{
    var rcs = cards
    if Set(rcs).count != rcs.count{
        for i in 0..<rcs.count{
            for j in 0..<i{
                if rcs[j] == rcs[i]{
                    let duplicateNum = rcs[j]
                    var noDuplicateCards = rcs.filter { $0 != duplicateNum }
                    noDuplicateCards.sort()
                    noDuplicateCards.reverse()
                    noDuplicateCards.insert(duplicateNum, at: 0)
                    return noDuplicateCards
                }
            }
        }
    }
    return []
}

// player1 & player2 : player's cards, from 2 to 14
// return: 0: tie, 1: player1 won, 2: player2 won
public func checkOnePair(player1:[Int],player2:[Int])-> Int{
    if player1.count == player2.count{
        let p1 = isOnePair(cards: player1)
        let p2 = isOnePair(cards: player2)
        // 都有一对
        if p1.count == p2.count && p1.count != 0{
            for index in 0..<p1.count{
                if p1[index] > p2[index]{
                    return 1
                }else if p2[index]>p1[index]{
                    return 2
                }
            }
            return 0
        }
        // player1 有一对， player2 没有
        if p1.count > p2.count && p2.count == 0{
            return 1
        }
        // player2 有一对， player1 没有
        if p1.count < p2.count && p1.count == 0{
            return 2
        }
        // 都没有一对
        if p1.count == p2.count && p1.count == 0{
            return checkHighCard(player1: player1, player2: player2)
        }
    }
    return -1
}
