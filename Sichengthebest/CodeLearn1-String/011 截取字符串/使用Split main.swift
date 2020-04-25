var s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
let a = s.split(separator: "\n")
for i in 0 ... a.count-1 {
    if i == a.count-1 {
        final.append(String(a[a.count-1-i]))
    } else {
        final.append(String(a[a.count-1-i])+"\n")
    }
}
show(final)
