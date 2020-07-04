func reverse(_ x: Int) -> Int {
    var r = ""
    var s = String(abs(x))
    for i in 0 ... s.count - 1 {
        r.append( Array(s)[s.count - i - 1] )
    }
    if s.count < String(x).count {
        return (Int(r) ?? 0 ) * -1 
    }else{
        return Int(r) ?? 0
    }
    
}

show(reverse(123))
show(reverse(-123))
show(reverse(98900))
