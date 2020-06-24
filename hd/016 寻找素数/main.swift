func isPrime(n: Int)-> Bool {
    for i in 2 ... n - 1 {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func findPrime(n: Int,m: Int) -> [Int] {
    var primes : [Int] = []
    for i in n ... m {
        if i > 2 && isPrime(n: i){
            primes.append(i)
        }else if i == 2 {
            primes.append(i)
        }
    }
    return primes
}

for i in findPrime(n: 1, m: 100){
    show(i)
}
