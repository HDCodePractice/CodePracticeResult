public func checkStraight(cards:[Int])->Int{
    var straightCheck = cards.sorted()
    for i in 0..<straightCheck.count-1{
        if straightCheck[i] != (straightCheck[i+1]-1){
            return 0
        }
    }
    return straightCheck.max()!
}
