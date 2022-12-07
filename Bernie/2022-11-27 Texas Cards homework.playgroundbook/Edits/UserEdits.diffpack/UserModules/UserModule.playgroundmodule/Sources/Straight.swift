// cards: one player's cards, maybe have one to five
// return : straight cards, from max to min, if is not straight cards,retrun []
public func isStraight(cards:[Int])->[Int]{
    var rcs = cards.sorted()
    rcs.reverse()
    for i in 0..<rcs.count-1{
        if !(rcs[i]-rcs[+1] == 1){
            return []
        }
    }
    return rcs
  }


// player1 & player2 : player's cards, from 2 to 14
// return: 0: tie, 1: player1 won, 2: player2 won
public func checkStraight(player1:[Int],player2:[Int])-> Int{
    if player1.count == player2.count{
        
    }
      return -1
  }
