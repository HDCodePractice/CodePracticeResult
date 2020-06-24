func findPrime(n: Int,m: Int) -> [Int] {
    var ret : [Int] = []
    for i in n ... m {
        if i == 2 {
            show("2")
        }
        for j in 2 ... i + n {
            if i % j == 0 {
                break
            }
            if j == i - 1 {
                show("\(i)")
            }
        }
    }
    return []
}
findPrime(n: 2, m: 100)
