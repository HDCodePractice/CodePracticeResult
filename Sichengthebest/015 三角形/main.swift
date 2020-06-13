func printTriangle(n: Int) {
    var string = ""
    for i in 1...n {
        let spaceNumber = n-i
        for j in 0...spaceNumber {
            string.append(" ")
        }
        for j in 1...2*i-1 {
            string.append(".")
        }
        if i != n {
            string.append("\n")
        }
    }
    show(string)
}
printTriangle(n: 6)
