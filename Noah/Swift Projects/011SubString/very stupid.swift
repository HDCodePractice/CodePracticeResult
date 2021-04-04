let s = """
一层楼更上
千里目欲穷
入海流黄河
依山尽白日
"""

show("\(s.prefix(23).suffix(2))\(s.prefix(21).suffix(3))\n\(s.prefix(17).suffix(2))\(s.prefix(15).suffix(3))\n\(s.prefix(11).suffix(2))\(s.prefix(9).suffix(3))\n\(s.prefix(5).suffix(2))\(s.prefix(3))")
