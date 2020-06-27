func find(_ number:Int, _ ret : [Int]) -> [Int]{
    var result : [Int] = ret
    for i in 2 ... number{
        if i == number{
            result.append(i)
            return result
        }else if number % i == 0{
            result.append(i)
            return find(number/i,result)
        }
        
    }
    return result
}
show("20 \(find(20,[]))")
show("100 \(find(100,[]))")
