let s = """
一层楼更上
千里目欲穷
入海流黄河
依山尽白日
"""
var result = ""
for i in s.split(separator: "\n"){
    result = "\(String(i.suffix(2)))\(String(i.prefix(3)))\n\(result)"
}
result = String(result.prefix(result.count-1))
show(result)
