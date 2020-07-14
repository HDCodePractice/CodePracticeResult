let storage = 128
let use = 39
let a = """
你的手机有\(storage) GB存储，
现在已经使用了\(use) GB，
还有\(storage - use) GB剩余空间，
你可以再记录\((storage - use) * 1000 / 150)分钟视频。
"""
show(a)
