public func checkThreeOfAKind(cards:[Int])->Int{
    for i in 0..<cards.count{
        for j in i..<cards.count{
            for a in j..<cards.count{
                if cards[i] == cards[j] && cards[j] == cards[a] && i != j{
                    return cards[i]
                }
            }
        }
    }
    return 0
}
