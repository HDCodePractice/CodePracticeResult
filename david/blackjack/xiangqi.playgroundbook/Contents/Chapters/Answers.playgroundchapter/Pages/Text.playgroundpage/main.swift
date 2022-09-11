//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(identifier, hide, setupLiveView())
//#-hidden-code
import Foundation
//#-end-hidden-code
//#-editable-code Tap to enter code

// 1. mutiple playground

func showString(_ string: String){
    // 如果是cmd
    //    print(string)
    // 如果是swift playgrounds
    show(string)
}

//2. input function
func getInput(inputPrompt:String,
//              startNumber:Int,
//              endNumber:Int,
              errorPrompt:String,
              defaultInput: String
)->Bool{
    showString(inputPrompt)
    
    var ui = askForChoice(strings: ["yes","no"])
    if ui == "yes"{
        return true
    }
    if ui == "no"{
        return false
    }else{
        show(errorPrompt)
    }
    return false
    
//    while ui == "yes"{
//        showString(errorPrompt)
//        ui = askForNumber()
//    }
    
    //    var seq=[String]()
    //    for i in 1...capital{
    //        seq.append(String(i)) 
    //    }
    //    let ui = Int(getInput(
    //            inputPrompt:inputPrompt,
    //            inputElement:seq,
    //            errorPrompt: errorPrompt,
    //            defaultInput: "\(defaultInput)"
    //        )) ?? defaultInput
    
    
}



//3. creating decks of cards.

//let sets = 1  //Tell the player how many decks of cards they have
////creat an array including the decks of cards.
func genCards(_ sets:Int) -> [String]{
    let suits : [String] = ["♦️","♣️","♥️","♠️"]
//    let suits : [String] = ["♦️"]
    let numbers : [String] = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
//    let numbers : [String] = ["2","10"]
    var cards : [String] = []
    for _ in 1...sets{
        //var cards = genCards()
        cards += cards
        //cards.append(contentsOf: genCards())
        for i in suits{
            for j in numbers{
                cards.append("\(i)\(j)")
            }
        }
        
    }
    return cards
}

// =========================== Testing ===========================
//let a = genCards(sets)
//print(a)
//func cardsDeal(){
//    var a = genCards()
//    a.shuffle()
//    
//}
//=================================================================================

//4.  scoring
func cardScores(_ card: String)->Int{

    let cardScores =  ["2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"0":10,"J":10,"Q":10,"K":10,"A":11]
    var score = (cardScores["\(card.last!)"]) ?? 1
    return score
    
}


// =========================== Testing ===========================
//var b = genCards(1)
//b.shuffle()
//print(b)
//let a = cardScores(b)
//print(a)

// ===============================================================

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
                    playerScores[i].append(cardScores(cardsRemain[0]))
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
    
        
        for j in 0...players-1{
            for _ in 0...2{
                var asking = getInput(inputPrompt: "Do you want another card?", 
                                      errorPrompt: "It's wrong inputting,please try again!",
                                      defaultInput: "yes")
                if asking{
                    
                    //                print(playerCards[j])
                    //                print(cardsRemain)
                    playerCards[j].append(cardsRemain[0])
                    
                    cardsRemain.remove(at:0)
                    if cardsRemain.count<28{
                        cardsRemain=cards
                    }
                    
                    
                }
                print(playerCards)
            }
            
            
//            rounds += 1
//            break

                
            
        }
        rounds+=1
//        cardsRemain.shuffle()
    }
    
    
    return (cardsRemain,playerCards)
    
}
// =========================== Testing ===========================
var sets = 1
var players = 3
var playerScore = 0

var a = genCards(sets)
a.shuffle()
var b = dealCards(a, players)
//print(b.playerCards)

// ===============================================================

//6.after first two round dealing cards
//func 


//#-end-editable-code
