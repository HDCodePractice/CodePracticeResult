func finding(_ number:Int,_ record:String)->Int{
    var a = ""
    a = record + String(abs(number)).suffix(1)
    if abs(number/10) > 0{
        return finding(number/10, a)
    }
    if number < 0{
        a = "-" + a
    }
    return Int(a) ?? 0
}
show("result:\(finding(-1234567,""))")
