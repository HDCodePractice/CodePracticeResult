
// Check [Int] have a Pair, If have a pair retrun number, If haven't return 0
public func checkOnePair(cards:[Int])->Int{
    for i in 0..<cards.count{
        for j in i..<cards.count{
            if cards[i] == cards[j] && i != j{
                return cards[i]
            }
        }
    }
    return 0
}

public func checkOnePairWon(player1:[Int], player2:[Int])->Int{
    var player1Cards = player1
    var player2Cards = player2
    let player1Pair = checkOnePair(cards: player1Cards)
    let player2Pair = checkOnePair(cards: player2Cards)
    let pairWon = checkWon(player1: [player1Pair], player2: [player2Pair])
    if pairWon > 0{
        return  pairWon
    }
    
    player1Cards.remove(at: player1Cards.firstIndex(of: player1Pair)!)
    player1Cards.remove(at: player1Cards.firstIndex(of: player1Pair)!)
    player2Cards.remove(at: player2Cards.firstIndex(of: player2Pair)!)
    player2Cards.remove(at: player2Cards.firstIndex(of: player2Pair)!)
    return checkWon(player1: player1Cards, player2: player2Cards)
}

func checkOnePairWon(cards:[[String]])->Int{
    let splitIndex = cards.count/2
    var player1Cards : [Int] = []
    var player2Cards : [Int] = []
    let cardnum : [String] = ["","","2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    
    for i in 0..<cards.count {
        let number = cardnum.firstIndex(of: cards[i][1]) ?? 0
        if i < splitIndex{
            player1Cards.append(number)
        }else{
            player2Cards.append(number)
        }
    }
    return checkOnePairWon(player1: player1Cards, player2: player2Cards)
}
