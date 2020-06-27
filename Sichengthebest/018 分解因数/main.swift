func decomposing (n : Int)-> [Int] {
    var m = n
    var primes : [Int] = []
    var prime = 2
    while prime <= m {
        if m % prime == 0 {
            primes.append(prime)
            m = m / prime
            prime = 1
        }
        i += 1
    }
    return primes
}

for i in 2 ... 157 {
    show("\(i) : \(decomposing(n: i))")
}
