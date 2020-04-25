var s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
let a = s.split(separator: "\n")
let b = a.count-1
for i in 0 ... b {
    if i == b {
        final.append(String(a[b-i]))
    } else {
        final.append(String(a[b-i])+"\n")
    }
}
show(final)
