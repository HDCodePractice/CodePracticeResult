var string = ""
for i in 1...9 {
    for j in 1...i {
        string.append("\(i)*\(j)=\(i*j) ")
    }
    if i < 9 {
        string.append("\n")
    }
}
show(string)
