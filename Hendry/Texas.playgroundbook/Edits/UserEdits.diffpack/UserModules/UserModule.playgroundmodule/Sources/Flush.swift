
public func checkFlush(cards:[[Int]])->Int{
    var suit = cards[0][0]
    var c : [Int] = []
    for i in 0 ... cards.count-1{
        if cards[i][0] != suit{
            return 0
        }
        c.append(cards[i][1])
    }
    c.sort()
    return c[cards.count-1]
}
