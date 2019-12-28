var count = 0
for i in 1...4{
    for j in 1...4 {
        for k in 1...4 {
            if i != j && i != k && j != k {
                count += 1
                show("\(count):\(i)\(j)\(k)😀")
            }
        }
    }
}
