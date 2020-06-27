func find() -> [Int]{
    var result : [Int] = []
    for i in 100 ... 999{
        if (i/100)*(i/100)*(i/100)+((i%100/10)*(i%100/10)*(i%100/10))+(i%10)*(i%10)*(i%10) == i{
            result.append(i)
        }
    }
    return result
}
show("\(find())")
