public func checkFullHouse(cards:[[Int]])->[Int]{
    var num : [Int] = []
    var returnSet : [Int] = []
    var num1 = 0
    var num2 = 0
    var set1 = 0
    var set2 = 0
    for z in 0..<cards.count{
        num.append(cards[z][1])
    }
    
    for i in 0..<cards.count{
        for j in i..<cards.count{
            if num[i] == num[j] && i != j{
                set1 += 1
                num1 = num[i]
            }
        }
    }
    if set1 != 3{
        return []
    } else {
        for i in 0..<cards.count{
            for j in i..<cards.count{
                if num[i] == num[j] && i != j && num[i] != num1{
                    set2 += 1
                    num2 = num[i]
                }
            }
        }
        if set2 != 2{
            return []
        }
    }
    
    return [num1, num2]
}
