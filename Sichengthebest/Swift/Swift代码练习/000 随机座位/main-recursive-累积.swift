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

func sumN(m: Int, n: Int) -> Int {
    var l = 0
    for i in m ... n {
        l += i
    }
    return l
}
show(sumN(m: 1, n: 100))

func sumNN(m: Int, n: Int) -> Int {
    var l = 0
    var coefficient = 0
    while coefficient < n {
        coefficient += 1
        l += coefficient
    }
    return l
}
show(sumNN(m: 1, n: 100))

func sumNNN(m: Int, n: Int) -> Int {
    if m < n {
        return m + sumNNN(m: m + 1, n: n)
    } else {
        return n
    }
}
show(sumNNN(m: 1, n: 100))
