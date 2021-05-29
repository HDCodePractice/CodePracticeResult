func addition(a: Int, n: Int) {
    var b = 0
    for i in 1...n {
        var s = ""
        for j in 1...i {
            s.append("\(a)")
        }
        b += Int(s) ?? 0
        show(s)
    }
    show(b)
}
addition(a: 5, n: 3)
