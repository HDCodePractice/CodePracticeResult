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
    var player1Pair = checkTwoPair(cards: player1)
    var player2Pair = checkTwoPair(cards: player2)
    
    print(player1,player2)
    
    // max
    let pairMaxResult = checkWon(player1: player1Pair, player2: player2Pair)
    
    if pairMaxResult != 0{
        return pairMaxResult
    }
    
    // second max
    let max = player1Pair.max()!
    player1Pair.remove(at: player1Pair.firstIndex(of: max)! )
    player2Pair.remove(at: player2Pair.firstIndex(of: max)! )
    
    let pairSecondResult = checkWon(player1: player1Pair, player2: player2Pair)
    if pairSecondResult != 0{
        return pairSecondResult
    }
    
    // last single number
    var player1Cards = player1
    var player2Cards = player2
    for i in checkTwoPair(cards: player1){
        player1Cards.remove(at: player1Cards.firstIndex(of: i)!)
        player1Cards.remove(at: player1Cards.firstIndex(of: i)!)
        player2Cards.remove(at: player2Cards.firstIndex(of: i)!)
        player2Cards.remove(at: player2Cards.firstIndex(of: i)!)
    }
    
    return  checkWon(player1: player1Cards, player2: player2Cards)
}
public func checkTwoPairWon(player1:[[String]],player2:[[String]])->Int{
    var player1Cards : [Int] = []
    var player2Cards : [Int] = []
    let cardnum : [String] = ["","","2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    
    for i in 0..<player1.count{
        let number1 = cardnum.firstIndex(of: player1[i][1]) ?? 0
        let number2 = cardnum.firstIndex(of: player2[i][1]) ?? 0
        player1Cards.append(number1)
        player2Cards.append(number2)
    }
    
    return checkTwoPairWon(player1: player1Cards, player2: player2Cards)
}
