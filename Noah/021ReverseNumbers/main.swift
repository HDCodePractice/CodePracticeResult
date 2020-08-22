func pom( _ n: Int, _ m: Int) -> Int {
    var a = 1
    if m != 0 {
        for i in 1 ... m {
            a *= n
        }
    } else {
        return 1
    }
    return a
}


func reverse(_ x: Int) -> Int {
    var s = ""
    var n = abs(x)
    var b = Array(String(abs(x)))
    var c = b.count
    for i in 1 ... c {
        var one = n / pom(10, c - i)
        n = n - one * pom(10, c - i) 
        show(one)
        s = "\(one)\(s)"
    }
    if x >= 0 {
        return Int(s)!
    } else {
        return Int("-\(s)")!
    }
}

show(reverse(123))
show(reverse(-123))
show(reverse(98900))

