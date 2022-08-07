

public func gain(flag:Int,bet:Int)->Int{
    var gain = 0
    if flag==0{
        gain = bet*2
    }else if flag==1{
        gain = 0
    }else{
        gain = bet
    }
    return gain
}
