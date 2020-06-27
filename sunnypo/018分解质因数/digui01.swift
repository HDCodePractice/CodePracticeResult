func find(_ number:Int,_ x:[Int]) -> [Int]{
    var result : [Int] = x
    for i in 2 ... number{
        if number % i == 0{
            result.append(i)
            if number != i{
                return find(number/i, result)
            }
        }
    }
    return result
}
show("\(find(456,[]))")
