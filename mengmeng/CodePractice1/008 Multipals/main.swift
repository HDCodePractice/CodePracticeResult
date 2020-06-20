var a = ""
for i in 1 ... 9 {
    for j in 1 ... i {
        a.append(" \(i)*\(j)=\(i*j)")
    }
    a.append("\n")
}
show(a)
