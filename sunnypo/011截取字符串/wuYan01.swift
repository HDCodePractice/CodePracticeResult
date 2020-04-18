var s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
let sa = Array(s)
for i in 1...(Array(s).count + 1 ) / 6 {
    final += String(s.suffix((i * 5) + (i - 1)).prefix(5))
    if i < (Array(s).count + 1 ) / 6 {
        final += "\n"
    }
}
show(final)
