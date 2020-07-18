let s = """
一层楼更上
千里目欲穷
入海流黄河
依山尽白日
"""
var final = ""
for i in 0 ... 3 {
    final.append("\(s.prefix(23 - ((i * 6))).suffix(2))\(s.prefix(23 - i * 6 - 2).suffix(3))\n")
}
show("\(final.prefix(final.count-1))")

