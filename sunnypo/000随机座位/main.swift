var numbers : [Int] = []
var a = 1
for x in 1 ... 4 {
    for y in 1 ... 4 {
        for z in 1 ... 4 {
            if x != y && y != z && x != z {
                numbers.append(x * 100 + y * 10 + z)
            }
        }
    }
}
for i in numbers{
    var answer = "\(a) | \(i)"
    show(answer)
    a += 1
}
