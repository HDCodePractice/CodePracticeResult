// cards: one player's cards, maybe have one to five
// return : big pair card, small pair card and single card, form max to min, if doesn't have two pair,retrun []
public func isTwoPairs(cards:[Int])->[Int]{
    var rcs = cards
    var DuplicateNum = [Int]()
    if Set(rcs).count+2 == rcs.count{
        for i in 0..<rcs.count{
            for j in 0..<i{
                if rcs[j] == rcs[i]{
                    DuplicateNum.append(rcs[i])
                }            
            }
        }
        if DuplicateNum.count == 2{
            DuplicateNum.sort()
            DuplicateNum.reverse()
            for element in rcs{
                if !DuplicateNum.contains(element){
                    DuplicateNum.append(element)
                    return DuplicateNum
                }
            }
        }
    }
    return []
}


// player1 & player2 : player's cards, from 2 to 14
// return: 0: tie, 1: player1 won, 2: player2 won
public func checkTwoPairs(player1:[Int],player2:[Int])-> Int{
    if player1.count == player2.count{
        let p1 = isTwoPairs(cards: player1)
        let p2 = isTwoPairs(cards: player2)
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
    }
    return -1
}
