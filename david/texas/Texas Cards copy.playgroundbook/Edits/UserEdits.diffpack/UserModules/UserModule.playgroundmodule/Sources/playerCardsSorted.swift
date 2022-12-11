
public func cardsSorted(cards:[Int])->[Int]{
    var cards = cards.sorted(by:>)
    let n = cards.count
    var tempCards = isHighCard(cards: cards)
//    var pairs = isNotSingle(cards: cards).pairs
//    var singles = isNotSingle(cards: cards).singles
    
    for i in 0..<n{
        for j in 0..<(n-1-i){
            //            var a = (cards[j]%13==1 ? 14:(cards[j]%13==0 ? 13:cards[j]%13 ))
            //            var b = (cards[j+1]%13==1 ? 14:(cards[j+1]%13==0 ? 13:cards[j+1]%13 ))
            
            var a = cards[j]%13
            var b = cards[j+1]%13
            
            if tempCards[1]%13 != 5 || cards.count != 5{
                a = getBigNum(card: a)
                b = getBigNum(card: b)
            } 
            if a < b{
                cards.swapAt(j, j+1)
            }
        }
    }
    return cards
}

public func getBigNum(card:Int)->Int{
    if card==1{
        return 14
    }
    if card==0{
        return 13
    }
    return card
}


//extension Int{
//    func getBigNum()->Int{
//        if self==1{
//            return 14
//        }
//        if self==0{
//            return 13
//        }
//        return self
//    }
//}
