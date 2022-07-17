let cardStrings = genCards()

public func showCardsString(cardIndexes: [Int])->String{
    var cs = ""
    for i in cardIndexes{
        cs += showCard(index: i) + " "
    }
    return cs
}

public func showCards(cardIndexes: [Int])->[String]{
    var cs = [String]()
    for i in cardIndexes{
        cs.append(showCard(index: i))
    }
    return cs
}

public func showCard(index: Int)->String{
    return cardStrings[index]
}
