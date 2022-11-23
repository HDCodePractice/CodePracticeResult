
public func checkFullHouse(cards:[Int])->[Int]{
    if checkThreeOfAKind(cards: cards)>0{
        var card = cards
        var answer = [checkThreeOfAKind(cards: cards)]
        var remove = checkThreeOfAKind(cards: cards)
        card.remove(at: card.firstIndex(of: remove)!)
        if checkOnePair(cards: card)>0{
            answer.append(checkOnePair(cards:card))
            return answer
        }else{
            return [0,0]
        }
    }else{
        return [0,0]
    }
}
public func checkFullHouseWin(player1:[Int],player2:[Int])->Int{
    var card1 = checkFullHouse(cards: player1)
    var card2 = checkFullHouse(cards: player2)
    if card1[0]==0 || card1[1]==0{
        return 2
    }else if card2[0]==0 || card2[1]==0{
        return 1
    }else{
        if card1[0]>card2[0]{
            return 1
        }else{
            return 2
            
        }
    }
}
