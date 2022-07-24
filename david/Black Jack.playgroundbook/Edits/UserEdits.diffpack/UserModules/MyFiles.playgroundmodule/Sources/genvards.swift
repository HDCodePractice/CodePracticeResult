
public func genCards()->[String]{
    let suits : [String] = ["♦️","♣️","♥️","♠️"]
    let numbers:[String] = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    var cards:[String] = []
    
    for i in numbers{
        for j in suits{
            cards.append("\(j)\(i)")
        }
    }
    
    return cards 
}


//test


//print(aaa)
////4.  scoring
//func cardScores(_ card: String)->Int{
//
//    let cardScores =  ["2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"0":10,"J":10,"Q":10,"K":10,"A":11]
//    var score = (cardScores["\(card.last!)"]) ?? 1
//    return score
//    
//}
