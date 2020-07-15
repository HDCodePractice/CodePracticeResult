func gen24(_ row: [Int]) -> [Int] {
    var ret = row
    var nums = [2,4]
    var zero : [Int] = []
    for i in 0...ret.count-1 {
        if ret[i] == 0 {
            zero.append(i)
        }
    }
    if zero.count > 0 {
        ret[zero.randomElement() ?? 2] = nums.randomElement()!
    }
    return ret
}

func initRow(_ length : Int) -> [Int] {
    var ret : [Int] = []
    for i in 1...length {
        ret.append(0)
    }
    return ret
}

let length = 4
var row : [Int] = initRow(length)
show("\(row)")
for i in 1 ... length + 1 {
    row = gen24(row)
    show("\(row)")
}
