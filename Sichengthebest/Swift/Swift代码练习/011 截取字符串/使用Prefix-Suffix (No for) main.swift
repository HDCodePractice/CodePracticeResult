let death = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
var value = 0
var a = String(death.prefix(11))
var thirdLine = String(a.suffix(5))
var lastLine = String(a.prefix(5))
var b = String(death.suffix(11))
let secondLine = String(b.prefix(5))
let firstLine = String(b.suffix(5))
final.append(firstLine)
final.append("\n")
final.append(secondLine)
final.append("\n")
final.append(thirdLine)
final.append("\n")
final.append(lastLine)
show(final)
