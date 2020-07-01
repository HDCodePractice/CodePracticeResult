func AddInt(a : Int, n : Int) -> Int {
    var z = a
    var s = a
    if n != 1 {
        for i in 0 ... n - 2 {
            z = z * 10 + a
            s += z 
        }
    } 
    return s
}

show("total: \(AddInt(a: 5, n: 5))")
