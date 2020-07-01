func cal(_ numb:Int,_ time:Int) -> Int{
    var num = 0
    var numbers : [Int] = []
    for i in 1...time{ //位数
        var square = 1
        for j in 1...i{  //加法
            square = 10 * square
        }
        num += square
        numbers.append(num/10)
    }
    var final = 0
    for i in numbers{
        final += i
    }
    return final*numb
}
show(cal(4,5))
