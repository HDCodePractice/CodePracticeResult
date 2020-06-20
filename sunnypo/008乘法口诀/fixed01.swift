for x in 1...9{
    var d = 0
    var a = ""
    for y in 1...x{
        d += x
        a += "\(x)*\(y)=\(d)  "
    }
    show(a)
}
