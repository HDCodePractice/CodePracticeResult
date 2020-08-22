func finding(_ number:Int)->Int{
    var a = ""
    if number < 4294967296{
        if number < 0{
            a += "-"
        }
        for i in 1 ... String(abs(number)).count{
            a += String(abs(number)).suffix(i).prefix(1)
        }
        return Int(a) ?? 0
    }
    return 0
}
show(finding(-1234567))
