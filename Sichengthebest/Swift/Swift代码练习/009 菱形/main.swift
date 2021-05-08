func printDiamond(n: Int) {
    var string = ""
    for i in 1...n {
        for j in 0...n-i {
            string.append(" ")
        }
        for j in 1...2*i-1 {
            string.append(".")
        }
        string.append("\n")
    }
    for i in 1...n-1 {
        for j in 0...i {
            string.append(" ")
        }
        for j in 1...(n-i)*2-1 {
            string.append(".")
        }
        if i != n {
            string.append("\n")
        }
    }
    show(string)
}
printDiamond(n: 98)
