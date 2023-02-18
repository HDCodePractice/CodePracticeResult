public func initCardsDigits()->[Int]{
    var cards:[Int] = []
    for i in 2...53{
        cards.append(i)
    }
    cards.shuffle()
    return cards
}

public func initCards()->[String]{
    let numbers : [String] = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    let cardsSuits = ["♣️","♦️","♥️","♠️"]
    var cards:[String]=[]
    
    for s in cardsSuits{
        
        for n in numbers{
            cards.append("\(s)\(n)")
        } 
        
    }
    return cards
    
}
public func cardsNum()->[Int]{
    var cardNums:[Int]=[]
    for i in 0...3{
        for j in 2...14{
            cardNums.append(j)
        }
    }
    return cardNums
}


