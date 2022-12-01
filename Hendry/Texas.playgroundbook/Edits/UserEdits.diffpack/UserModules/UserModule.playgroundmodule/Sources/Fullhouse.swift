public func checkFullHouse(cards: [Int])->[Int]{
    let card : [Int] = cards.sorted()
    if card[0] == card[1] && card[1] == card[2]{
        return [card[0],card[3]]
    }else {
        return [card[3],card[0]]
    }
    return [0]
}
