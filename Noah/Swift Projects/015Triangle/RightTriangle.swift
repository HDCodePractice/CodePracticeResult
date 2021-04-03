func nb (n: Int) {
    var s = ""
    for i in 1 ... n {
        let sn = n - i
        for k in 0 ... sn + sn {
            s.append(" ")
        }
        for k in 1 ... 2 * i - 1 {
            s.append(".")
        }
        if i < n {
            s.append("\n")
        }
    }
    show(s)
}
nb(n : 6)

