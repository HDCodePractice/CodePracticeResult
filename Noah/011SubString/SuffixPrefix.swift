var Poem = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
for i in 1 ... 4 {
    let finale = (5 - i) * 6 - 1
    final += String(Poem.prefix(finale).suffix(5))
    if i < 4 {
        final += "\n"
    }
}
show(final)
