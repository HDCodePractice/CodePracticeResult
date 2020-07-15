func gen24() -> Int {
    var nums = [2,4]
    return nums.randomElement()!
}

func initRow(_ length : Int) -> [Int] {
    var ret : [Int] = []
    for i in 1...length {
        ret.append(0)
    }
    return ret
}


var row : [Int] = initRow(4)
show("\(row)")
for i in 0...row.count-1 {
    row[i] += gen24()
}
show("\(row)")
