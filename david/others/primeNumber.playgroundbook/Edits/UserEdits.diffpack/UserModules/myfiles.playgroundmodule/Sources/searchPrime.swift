public func searchPrime(_ arrIn:[Int])->[Int]{
    var arrOut = [Int]()
    for i in arrIn{
        if isPrime(i){
            arrOut.append(i)
        }
    }
    return arrOut
    
}
