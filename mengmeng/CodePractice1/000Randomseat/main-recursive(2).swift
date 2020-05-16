func sumN(_ m: Int ,_ n:Int) -> Int {
    var a = 0
    for i in m ... n {
        a += i
    }
    return a
}
func sumNa(_ m:Int ,_ n:Int) -> Int {
    var a = 1
    while a != 495550 {
        a += 1
    }
    return a
}
func sumNb(_ m:Int ,_ n:Int) -> Int {
    if m < n {
        return m + sumNb(m + 1 , n)
    } else {
        return n
    }
}

func showSumNs(_ m:Int,_ n:Int) {
    show("This is for's result: \(sumN(m,n))")
    show("This is while's result:\(sumNa(m,n))")
    show("This is recursive's result:\(sumNb(m,n))")
}
showSumNs(100, 1000)

