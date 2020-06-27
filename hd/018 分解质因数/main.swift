func Decomposes ( n : Int)-> [Int] {
    var m = n
    var ret : [Int] = []
    var i = 2
    while i <= m {
        if m % i == 0 {
            ret.append(i)
            m = m / i
            i = 1
        }
        i += 1
    }
    return ret
}

for i in 2 ... 100 {
    show("\(i) : \(Decomposes(n: i))")
}
