public func showN2(n : Int){
    for i in 1 ... n {
        var s = ""
        let sn = n - i
        for j in 0 ... sn {
            s.append(" ")
        }
        for j in 1 ... 2 * i - 1 {
            s.append("*")
        }
        show(s)
    }
}


public func showN(n : Int) {
    var s = ""
    for i in 1 ... n {
        let sn = n - i
        for j in 0 ... sn {
            s.append(" ")
        }
        for j in 1 ... 2 * i - 1 {
            s.append(".")
        }
        s.append("\n")
    }
    show(s)
}

showN(n: 5)
showN2(n: 5)
