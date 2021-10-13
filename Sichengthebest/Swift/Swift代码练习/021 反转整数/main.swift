func reverse(_ x: Int) -> Int {
    var y = Array(String(abs(x)))
    var final = ""
    for i in 0...y.count-1 {
        final = "\(y[i])\(final)"
    }
    if x < 0 {
        return Int("-\(final)") ?? 0
    }
    return Int(final) ?? 0
}

show(reverse(123))
show(reverse(-123))
show(reverse(98900))
