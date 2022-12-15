
public func dealCards(players:Int,sets:Int)->[[Int]]{
    var rounds = 1
    var playerCardsIndex = Array(repeating:[Int](), count:players)
    //    var playerCards = Array(repeating:[String](), count:players)
    //    var realCards = genCards()
    var cards = genCardIndexes(sets)
    cards.shuffle()
    
    while rounds<5{
        for _ in 0...1{
            for i in 0...(players-1){
                playerCardsIndex[i].append(cards[0])
                //            playerCards[i].append(realCards[cards[0]])
                cards.remove(at:0)
            }
            rounds += 1
        }
        //        print(playerCards)
        //        for j in 0...players-1{
        //            for _ in 0...2{
        //                var playerChoice = 
        //                    getInput(inputPrompt: "Do you want another card?", 
        //                             errorPrompt: "It's wrong inputting,please try again!",
        //                             defaultInput: "yes")
        //                
        //                if playerChoice{
        //                    playerCardsIndex[j].append(cards[0])
        //                    //                    playerCards[j].append(realCards[cards[0]])
        //                    cards.remove(at:0)
        //                }else{
        //                    break 
        //                }
        //            }
        //        }
        break
    }
    if cards.count<28{
        cards=genCardIndexes(sets)
        cards.shuffle()
        
    }
    return playerCardsIndex
}

//let ccc=dealCards(players: 2, sets: 3)
//print(ccc)
