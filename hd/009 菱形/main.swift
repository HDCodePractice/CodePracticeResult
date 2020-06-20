func appendLind(n:Int , s: String) -> String{
    var str = ""
    for i in 0 ... n {
        str += s
    }
    return str
}

func printing(number : Int)-> String {
    var d = ""
    for i in 1 ... number{
        d += appendLind(n: number - i, s: " ")
        d += appendLind(n: i*2-2, s: ".")
        d += "\n"
    }
    for i in 1 ... number - 1{
        d += appendLind(n: i, s: " ")
        d += appendLind(n: (number-i)*2-2, s: ".")
        d += "\n"
    }
    return String(d.prefix(d.count - 1))
}

show(printing(number : 2))
