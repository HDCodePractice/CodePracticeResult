var s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
var semi = ""
let sa = Array(s)
for i in 1...4 {
    semi = String(s.suffix(i * 6))
    if i == 1 {
        semi = String(s.suffix(i * 5))
    }
    final += String(semi.prefix(6))
    if i == 3 {
        final += "\n"
    }
    
}
final = String(final.prefix(23))
show(final)
