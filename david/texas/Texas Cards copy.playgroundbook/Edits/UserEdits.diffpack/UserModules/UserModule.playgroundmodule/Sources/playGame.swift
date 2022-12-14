
public func playGame(player1:[Int],player2:[Int])->Int{
    
    
    if isFlush(cards: player1) && isFlush(cards: player2) && isStraight(cards: player1) && isStraight(cards: player2){
        return checkHighCard(player1: player1, player2: player2)
        
    }else if isFlush(cards: player1) && (isStraight(cards: player1)){
        return 1
    }else if isFlush(cards: player2) && (isStraight(cards: player2)){
        return 2
    }else if isNotSingle(cards: player1).pairs.count>2 && isNotSingle(cards: player2).pairs.count>2{
        return checkNotSingles(player1: player1, player2: player2)
    }else if isNotSingle(cards: player1).pairs.count>2{
        return 1
    }else if isNotSingle(cards: player2).pairs.count>2{
        return 2
    }else if isFlush(cards:player1) && isFlush(cards: player2){
        return checkHighCard(player1: player1, player2: player2)
    }else if isFlush(cards: player1){
        return 1
    }else if isFlush(cards: player2){
        return 2
    }else if isStraight(cards: player1) && isStraight(cards: player2){
        return checkHighCard(player1: player1, player2: player2)
    }else if isStraight(cards: player1){
        return 1
    }else if isStraight(cards: player2){
        return 2
    }else{
        return checkNotSingles(player1: player1, player2: player2)
    }
    return 0
}
