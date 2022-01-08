let s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var res = ""
let ss = s.split(separator: "\n")
for i in 0 ... 3 {
    res.append( "\(ss[3 - i])\n" )
}
show("\(res.prefix(res.count - 1))")
