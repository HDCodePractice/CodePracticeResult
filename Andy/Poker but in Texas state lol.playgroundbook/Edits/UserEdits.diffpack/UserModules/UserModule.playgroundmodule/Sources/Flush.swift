public func checkFlush(cards:[[Int]])->Int{
    var pairs : [Int] = []
    var numbers : [Int] = []
    for i in 0..<cards.count{
        pairs.append(cards[i][0])
        numbers.append(cards[i][1])
    }
    pairs.append(pairs.min()!)
    if pairs == pairs.sorted(){
        return numbers.max()!
    }
    return 0
}
public func checkFlushWon(player1:[[Int]],player2:[[Int]])->Int{
    if player1 != player2{
        var player1cards : [Int] = []
        var player2cards : [Int] = []
        for i in 0..<player1.count{
            player1cards.append(player1[i][1])
            player2cards.append(player2[i][1])
        }
        if checkFlush(cards: player1)==checkFlush(cards: player2){
            while player1cards.max()!==player2cards.max()! || player1cards.count==0 || player2cards.count==0{
                player1cards.remove(at:player1cards.firstIndex(of: player1cards.max()!)!)
                player2cards.remove(at:player2cards.firstIndex(of: player2cards.max()!)!)
            }
            if player1cards.count==0 || player2cards.count == 0{
                if player1[0][0] > player2[0][0]{
                    return 1
                }else{
                    return 2
                }
            }else{
                if player1cards.max()! > player2cards.max()!{
                    return 1
                }else{
                    return 2
                }
            }
        }else{
            if checkFlush(cards: player1)<checkFlush(cards: player2){
                return 1
            }else{
                return 2
            }
        }
    }else{
        return 0
    }
}
