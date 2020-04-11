var Poem = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""

var final = ""
var value = 0

let Lines = String(Poem.suffix(5))
let Linezz = String(Poem.suffix(11))
let Liness = String(Linezz.prefix(5))
let Line = String(Poem.prefix(11))
let Linez = String(Line.suffix(5))
let Linex = String(Poem.prefix(5))

show(Lines + "\n" + Liness + "\n" + Linez + "\n" + Linex)
