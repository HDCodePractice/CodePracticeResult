
//5. first two round dealing cards
func dealCards(_ cards:[String],_ players:Int)->(cardsRemain:[String],playerCards:[[String]]){
    var cardsRemain = cards
    var asking=String()
    var playerCards = Array(repeating:[String](), count:players)
    var playerScores = Array(repeating:[Int](), count:players)
    var rounds = 2
    //    var aaa=0
    
    cardsRemain.shuffle()
    
    while rounds<=5{
        while rounds<=2{
            for _ in 0...rounds-1{
                for i in 0...(players-1){
                    playerCards[i].append(cardsRemain[0])
                    //                    aaa=aaa+cardScores(cardsRemain[0])
                    //                    print(aaa)
                    //                    playerScores[i].append(cardScores(cardsRemain[0]))
                    //                    playerScores[i].append(aaa)
                    cardsRemain.remove(at:0)
                    //                
                }
                print(playerCards)
                print(playerScores)
                //                print(aaa)
                
                
                rounds += 1
            }
        }
        //        print(playerCards)
        
        
        //        for j in 0...players-1{
        //            for _ in 0...2{
        //                var asking = getInput(inputPrompt: "Do you want another card?", 
        //                                      errorPrompt: "It's wrong inputting,please try again!",
        //                                      defaultInput: "yes")
        //                if asking{
        //                    
        //                    //                print(playerCards[j])
        //                    //                print(cardsRemain)
        //                    playerCards[j].append(cardsRemain[0])
        //                    
        //                    cardsRemain.remove(at:0)
        //                    if cardsRemain.count<28{
        //                        cardsRemain=cards
        //                    }
        //                    
        //                    
        //                }
        //                print(playerCards)
        //            }
        //            
        //            
        //            //            rounds += 1
        //            //            break
        //            
        //            
        //            
        //        }
        rounds+=1
        //        cardsRemain.shuffle()
    }
    
    
    return (cardsRemain,playerCards)
    
}
// =========================== Testing ===========================
//var sets = 1
//var players = 3
//var playerScore = 0

//var a = genCards(sets)
////a.shuffle()
//var b = dealCards(a, players)
////print(b.playerCards)

// ===============================================================

//6.after first two round dealing cards
//func 
