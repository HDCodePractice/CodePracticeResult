var a = 4
var n = 5
var s = a

for i in 1 ... n - 1 {
    a = a * 10 + 4
    s += a 
}

show("total: \(s)")
