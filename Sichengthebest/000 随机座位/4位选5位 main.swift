var nmber: [Int] = []
var count = 0
show("Numbers:")
for ii in 1 ... 5 {
    for i in 1 ... 5 {
        for j in 1 ... 5 {
            for k in 1 ... 5 {
                if ii != i && i != j && j != k &&  j != ii && i != k && ii != k {
                    nmber.append(ii*1000+i*100+j*10+k)
                    count += 1
                    show(String(count) + ": " + String(ii) + String(i) + String(j) + String(k))
                }   
            }
        }
    }
}
