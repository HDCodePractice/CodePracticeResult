func daf() -> [Int] {
    var d : [Int] = []
    for i in 100 ... 999 {
        let a = Int (i / 100)
        let b = Int (i / 10 - a * 10)
        let c = Int (i - a * 100 - b * 10)
        if a * a * a + b * b * b + c * c * c == i {
            d.append(i)
        }
    }
    return d
}

let dafo = daf()
show("\(dafo)")
