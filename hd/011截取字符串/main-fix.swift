let death = """
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
"""
var final = ""
var value = 0
for i in 1 ... 4 {
    var cut = 0
    if i > 1{
        cut = (5-i)*6-1
    }else{
        cut = (5-i)*6
    }
    let cutString = String(death.prefix(cut))
    final += String( cutString.suffix(5) ) 
    if i < 4 {
        final += "\n"
    }
}

show(final)
