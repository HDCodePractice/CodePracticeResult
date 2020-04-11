var s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
var value = 0
for i in 0...2 {
    final += Array(s)[22-(value+4)...22-(value)]
    final += "\n"
    value += 6
}
final += Array(s)[22-(value+4)...22-(value)]

show(final)
