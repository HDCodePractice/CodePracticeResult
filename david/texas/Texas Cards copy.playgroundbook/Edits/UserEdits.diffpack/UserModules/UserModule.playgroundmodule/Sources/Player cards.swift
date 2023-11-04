
public func playerCheckCards(cards:[Int])->[Int]{
    var checkCards = isHighCard(cards: cards)
    if checkCards.first! > 54 || checkCards.last! < 2{
        print("it is not an available card !")
    }else{
        
        for i in 0..<checkCards.count{
            if checkCards[i]%13 == 1 && checkCards[0]%13 != 5{
                checkCards[i] = 14
                
            }else if checkCards[i]%13 == 0  {
                checkCards[i] = 13
            }else{
                checkCards[i] = checkCards[i]%13
            }
        }
    }
    checkCards = isHighCard(cards: checkCards)
    
    return checkCards
}
