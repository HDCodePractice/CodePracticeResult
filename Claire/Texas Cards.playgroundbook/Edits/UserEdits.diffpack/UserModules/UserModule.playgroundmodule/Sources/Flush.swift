public func checkFlush(cards:[[Int]])->Int{
    var num : [Int] = []
    for z in 0..<cards.count{
        num.append(cards[z][1])
    }
    
    for j in 1..<cards.count{
        if cards[j][0] != cards[0][0]{
            return 0
        }
    }
    num.sort()
    return num.last!
}
