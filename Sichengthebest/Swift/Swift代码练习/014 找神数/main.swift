var count = 0
for i in 1...100 {
    for j in 1...100 {
        for k in 1...100 {
            if i+j+k == i*j*k {
                show("\(i),\(j), and \(k) are the magical numbers!")
            }
        }
    }
}
