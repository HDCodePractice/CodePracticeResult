func findPrime(n: Int,m: Int) -> [Int] {
    var primes : [Int] = []
    if n > m {
        return []
    }
    
    for i in n ... m {
        if i > 2 {
            for j in 2 ... i - 1 {
                if i % j == 0{
                    break
                }else if j == i - 1{
                    primes.append(i)
                }
            }
        }else if i == 2 {
            primes.append(i)
        }
    }
    
    return primes
}


for i in findPrime(n: 1, m: 100){
    show(i)
}
