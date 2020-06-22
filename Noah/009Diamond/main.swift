func nb (n: Int) {
    var s = ""
    for i in 1 ... n {
        for k in 0 ... n - i {
            s.append(" ")
        }
        for k in 1 ... 2 * i - 1 {
            s.append(".")
        }
        if i < n {
            s.append("\n")
        }
    }
    for i in 1 ... n - 1 {
        s.append("\n")
        for k in 1 ... i + 1 {
            s.append(" ") 
        }
        for k in 1 ... 2*(n-i)-1 {
            s.append(".")
        }
    }
    show(s)
}
nb(n : 38)

