
public func checkStraight(cards:[Int])->Int{
    var c = cards.sorted()
    for i in 1 ... c.count-1{
        if c[i] != c[i-1]+1{
            return 0
        }
    }
    return c[4]
}
