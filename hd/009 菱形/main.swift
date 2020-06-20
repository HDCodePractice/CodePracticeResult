func appendLind(start: Int,n:Int , s: String) -> String{
    var str = ""
    for i in start ... n {
        str += s
    }
    return str
}

func printing(number : Int) {
    var d = ""
    for i in 1 ... number{
        d += appendLind(start:0,n: number - i, s: " ")
        d += appendLind(start:1,n: i*2-1, s: ".")
        d += "\n"
    }
    for i in 1 ... number - 1{
        d += appendLind(start:0,n: i, s: " ")
        d += appendLind(start:1,n: (number-i)*2-1, s: ".")
        d += "\n"
    }
    show(String(d.prefix(d.count - 1)))
}
printing(number : 98)
