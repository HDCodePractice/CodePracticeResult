
var s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
var value = 0
let sa = Array(s)
for i in 0...3 {
    final += Array(s)[22-(value+4)...22-(value)]
    final += "\n"
    value += 6
}
show(final)
