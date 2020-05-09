func getBit(bit: Int) -> Int {
    var a = 1
    if bit > 1 {
        for _ in 1 ... bit {
            a *= 10
        }
    }
    return a
}
show(getBit(bit: 3))

func getCount(a: Int, divisor: Int) -> Int {
    var b = 0
    if a > 0 || divisor > 0 {
        b = a/divisor
    }
    return b
}
show(getCount(a:-182, divisor:5))
