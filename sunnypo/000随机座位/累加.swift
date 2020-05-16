var a : Int = askForNumber("please enter your first number")
var b : Int = askForNumber("please enter your second number")
if a > b {
    var x = a
    a = b
    b = x
}
func sum1(_ m : Int, _ n : Int) -> Int {
    if m != n + 1 {
        return m + sum1(m + 1, n)
    }
    return 0
}
show("sum1:\(sum1(a, b))")
//----------------------------------
var result = 0
func sum2(_ m : Int, _ n : Int)-> Int{
    for i in m ... n {
        result += i
    }
    return result
}
show("sum2:\(sum2(a, b))")
//----------------------------------
func sum3(_ m : Int, _ n : Int)->Int{
    while m != n+1 {
        return m + sum3(m+1, n)
    }
    return 0
}
show("sum3:\(sum3(a, b))")
