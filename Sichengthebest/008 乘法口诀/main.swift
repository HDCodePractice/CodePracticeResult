var string = ""
for i in 1...5 {
    for j in 1...i {
        string.append("\(i)*\(j)=\(i*j) ")
    }
    if i > 5 {
        string.append("\n")
    }
}
show(string)
