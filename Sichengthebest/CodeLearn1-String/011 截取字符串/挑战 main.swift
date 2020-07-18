let s = """
一层楼更上
千里目欲穷
入海流黄河
依山尽白日
"""

var final: [String] = []
var finale = ""
let a = s.split(separator: "\n")
let b = a.count-1
for i in 0 ... b {
    final.append(String(a[b-i]))
}
for i in 0...final.count-1 {
    if i < final.count-1 {
        finale.append(String(final[i].suffix(2)))
        finale.append(String(final[i].prefix(3)) + "\n")
    } else {
        finale.append(String(final[i].suffix(2)))
        finale.append(String(final[i].prefix(3)))
    }
}
show(finale)
