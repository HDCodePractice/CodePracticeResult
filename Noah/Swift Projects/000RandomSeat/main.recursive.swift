func calBit(bit: Int) -> Int{
    var a = 1
    if bit > 1 {
        for _ in 1 ... bit {
            a = a * 10
        }
    }
    return a
}

show(calBit(bit:4))
