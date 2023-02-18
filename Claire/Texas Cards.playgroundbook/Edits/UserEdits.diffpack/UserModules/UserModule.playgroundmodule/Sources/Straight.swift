public func checkStraight(cards:[[Int]])->Int{
    var num : [Int] = []
    for z in 0..<cards.count{
        num.append(cards[z][1])
    }
    
    num.sort()
    for i in 1...num.count{
        if num[i] != num[i-1] + 1{
            return 0
        }
    }
    return num.last!
}

