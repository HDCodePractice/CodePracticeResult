func daffodilNumb() -> [Int] {
    var daffodils : [Int] = []
    for i in 100...999 {
        var hundreds = i/100
        var tens = (i-hundreds*100)/10
        var ones = i-hundreds*100-tens*10
        if i == (hundreds * hundreds * hundreds) + (tens * tens * tens) + (ones * ones * ones) {
            daffodils.append(i)
        }
    }
    return daffodils
}
show("\(daffodilNumb())")
