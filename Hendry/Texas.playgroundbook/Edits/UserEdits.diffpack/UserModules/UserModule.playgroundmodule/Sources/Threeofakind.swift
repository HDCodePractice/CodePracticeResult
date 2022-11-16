public func checkThreeOfAKind(cards:[Int])->Int{
    var cardssort = cards
    cardssort.sort()
    var a = 1
    for i in 1...cardssort.count-1{
        if cardssort[i] == cardssort[i-1]{
            a+=1
        }else{
            a=1
        }
        if a == 3{
            return cardssort[i]
        }
    }
    return 0
}

