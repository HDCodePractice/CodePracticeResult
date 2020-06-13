func printTriangle(n: Int) {
    for i in 1...n {
        var string = ""
        let spaceNumber = n-i
        for j in 0...spaceNumber {
            string.append(" ")
        }
        for j in 1...2*i-1 {
            string.append(".")
        }
        show(string)
    }
}

printTriangle(n: 6)
