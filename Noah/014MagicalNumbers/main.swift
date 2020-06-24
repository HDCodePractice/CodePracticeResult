show("AllPossibleCombinations")
var ct = 3
for a in 1 ... 100 {
    for b in 1 ... 100 {
        for c in 1 ... 100 {
            if a + b + c == a * b * c {
                show("\(ct) numbers? ez pz. Could be \(a) & \(b) & \(c)       boom ")
            }
        }
    }
}
