var number = askForNumber("how tall would you like to make your triangle?")

func appendLind(n:Int , s: String) -> String{
    var str = ""
    for i in 1 ... n {
        str += s
    }
    return str
}

func printing(number : Int) {
    var d = ""
    for i in 1 ... number{
        if number != i {
            d += appendLind(n: number - i, s: " ")
        }
        d += appendLind(n: i*2-1, s: ".")
        d += "\n"
    }
    for i in 1 ... number - 1{
        if number != i {
            d += appendLind(n: i, s: " ")
        }
        d += appendLind(n: (number-i)*2-1, s: ".")
        d += "\n"
    }
    show(String(d.prefix(d.count - 1)))
}
printing(number : number)
