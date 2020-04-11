let s = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var ns = ""
for i in s.split(separator: "\n"){
    ns = "\(i)\n\(ns)"
}
ns = String(ns.prefix(ns.count-1))
show(ns)
