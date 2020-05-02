let a = [1, 2, 3, 4]
let aCount = a.count - 1
var count = 0
for i in 0 ... aCount {
    for j in 0 ... aCount {
        for k in 0 ... aCount {
            if i != k && j != k && i != j {
                count += 1
                show("\(count) \(a[i])\(a[j])\(a[k])")
            }
            
        }
        
    }
    
}
