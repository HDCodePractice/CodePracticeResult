

public func judgeCards(_ score:[Int])->Int{
    var score = score
    let plN = score.count
    var bankerScore = score.last
    //    var flag :Int  
    var judFlag = 0
    score.removeLast()
    for i in score{
        if i == 21{
            judFlag = 0
        }else if i>21{
            judFlag = 1
        }else if i < bankerScore!{
            judFlag = 1
        }else if i > bankerScore!{
            judFlag = 0
        }else{
            judFlag = 2
        }
    }
    return judFlag
}

