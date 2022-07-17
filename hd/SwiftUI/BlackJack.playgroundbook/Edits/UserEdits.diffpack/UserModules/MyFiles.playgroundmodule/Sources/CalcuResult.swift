
public func CalcuResult(cards: [Int])->Int{
    let marks = genCardMarks()
    let playerMarks = cards.map{ marks[$0] }
    var maxMark = playerMarks.reduce(0,  { x, y in
        x + y
    })
    var index = 0
    while maxMark>21 && index<cards.count {
        if playerMarks[index]==11{
            maxMark -= 10
        }
        index += 1
    }
    return maxMark
}

public func CalcuResults(players:[[Int]])->[Int]{
    var playerResults = [Int]()
    for cards in players{
        playerResults.append(CalcuResult(cards: cards))
    }
    return playerResults
}
