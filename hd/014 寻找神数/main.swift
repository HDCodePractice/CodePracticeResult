var count = 0
for i in 1 ... 100 {
    for j in 1 ... 100 {
        for k in 1 ... 100 {
            if i + j + k == i * j * k {
                count += 1
                show("第\(count)组:\(i) \(j) \(k)，结果为\(i * j * k)")
            }
        }
    }
}
