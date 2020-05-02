import Foundation
var nmber: [Int] = []
var count = 0
show("Numbers:")
for i in 1 ... 4 {
    for j in 1 ... 4 {
        for k in 1 ... 4 {
            if i != j && j != k && i != k {
                nmber.append(i*100+j*10+k)
                count += 1
                show(String(count) + ": " + String(i) + String(j) + String(k))
            }   
        }
    }
}
