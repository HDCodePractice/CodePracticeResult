func daffodils() -> [Int] {
    var a : [Int] = []
    for i in 100 ... 999 {
        let b = Int (i / 100)
        let c = Int (i / 10 - b * 10)
        let d = Int (i - b * 100 - c * 10)
        if b * b * b + c * c * c + d * d * d == i {
            a.append(i)
        }
    }
    return a
}

show("\(daffodils())")
