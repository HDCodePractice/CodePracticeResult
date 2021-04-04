let theFreakingPoem = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var values = [11,5,5,5,5,11]
var myNameIsPoem = ["","","",""]
for x in 0...4 {
    for y in 1...values[x]/values[x] {
        if x == 0 {
            myNameIsPoem.insert(String(theFreakingPoem.prefix(values[x])), at: x)
            myNameIsPoem.insert(String(theFreakingPoem.suffix(values[x])), at: 5)
            myNameIsPoem.insert(String(theFreakingPoem.suffix(values[x])), at: 6)
        } else if x == 3 {
            myNameIsPoem.insert(String(myNameIsPoem[0].suffix(values[x])), at: x)
        } else if x == 4 {
            myNameIsPoem.insert(String(myNameIsPoem[0].prefix(values[x])), at: x)
        } else if x == 1 {
            myNameIsPoem.insert(String(myNameIsPoem[5].suffix(values[x])), at: x)
        } else if x == 2 {
            myNameIsPoem.insert(String(myNameIsPoem[6].prefix(values[x])), at: x)
        }
    }
}
show("\(myNameIsPoem[1])\n\(myNameIsPoem[2])\n\(myNameIsPoem[3])\n\(myNameIsPoem[4])")
