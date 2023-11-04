// 1. 两个都有一对儿
// 1.1 对子有大小
// 1.2 对子一样大
// 1.2.1 单牌有大小
// 1.2.2 单牌都一样
// 2. 只有一个有一对儿
// 3. 两个都没对儿


// cards: one player's cards, maybe have one to five
// return : pair card and more cards, form max to min, if doesn't have one pair,retrun []
public func isOnePair(cards:[Int])->[Int]{
    // 找到一对，放在前面，剩下的用isHightCard排序放在后面就好
    
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
    // if isOnePaire.isEmpty 没对儿 -> HC
    // if 有一个isOnePaire.count >0 谁有谁赢
    // if 两个都.count>0 把 isOnePaire的结果，用 CheckHighCard()
    
    if player1.count == player2.count{
        let p1 = isOnePair(cards: player1)
        let p2 = isOnePair(cards: player2)
//        print("p1 \(p1)")
//        print("p2 \(p2)")
        //只有一人有对
        if p1.isEmpty && !p2.isEmpty{
            return 2
        }
        if !p1.isEmpty && p2.isEmpty{
            return 1
        }
        
        //都没对
        if p1.isEmpty && p2.isEmpty{
            let result = checkHighCard(player1: player1, player2: player2)
            return result
        } 
        
        //都有对
        if !p1.isEmpty && !p2.isEmpty{
            let result = checkHighCard(player1: player1, player2: player2)
            return result
        }  
    }
    return -1
}

//public func checkOnePair(player1:[Int],player2:[Int])-> Int{
//    if player1.count == player2.count{
//        let p1 = isOnePair(cards: player1)
//        let p2 = isOnePair(cards: player2)
//        // 都有一对
//        if p1.count == p2.count && p1.count != 0{
//            for index in 0..<p1.count{
//                if p1[index] > p2[index]{
//                    return 1
//                }else if p2[index]>p1[index]{
//                    return 2
//                }
//            }
//            return 0
//        }
//        // player1 有一对， player2 没有
//        if p1.count > p2.count && p2.count == 0{
//            return 1
//        }
//        // player2 有一对， player1 没有
//        if p1.count < p2.count && p1.count == 0{
//            return 2
//        }
//        // 都没有一对
//        if p1.count == p2.count && p1.count == 0{
//            return checkHighCard(player1: player1, player2: player2)
//        }
//    }
//    return -1
//}
