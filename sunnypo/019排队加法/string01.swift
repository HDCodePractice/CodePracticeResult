func cal(_ time:Int,_ numb:Int)->Int{
    var num = ""
    var number : [Int] = []
    for i in 1...time{
        num += "1"
        number.append(Int(num) ?? 1)
    }
    var final = 0
    for i in number{
        final += i
    }
    return final*numb
}
show(cal(4,4))
