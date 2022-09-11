public func transcription(_ scores:[Int])->(average:Int,passNum:Int,failedNum:Int){
    var average = 0
    var passNum = 0
    var failedNum = 0
    var sums = 0
    for i in scores{
        sums += i
        if i >= 60{
            passNum += 1
        }else{
            failedNum += 1
        }
    }
    average = sums/scores.count
    return (average,passNum,failedNum)
}

