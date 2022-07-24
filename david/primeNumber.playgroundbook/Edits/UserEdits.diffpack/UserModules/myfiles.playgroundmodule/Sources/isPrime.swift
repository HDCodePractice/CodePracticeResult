
public func isPrime(_ x:Int)->Bool{
    let arrLists = [2,3,5,7,11,13,17,19,23,29]
    let topEdge = Int(Double(x).squareRoot())
    if x == 1{
        return false
    }
    
    if  arrLists.contains(x) {
        return true
    }
    
    for i in 2...topEdge{
        if x%i==0{
            return false
        }
    }
    return true
}
