let a = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""

var b = ""
var c = 0
for d in 0 ... 3 {
    b += Array(a)[22 - (c + 4) ... 22 - c]
    if c != 18 {
        b += "\n"
    }
    c += 6
}

show(b)
