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
