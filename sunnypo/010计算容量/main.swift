let spaceGB = 128
let usedSpaceGB = 39
let unusedSpaceGB = spaceGB - usedSpaceGB
let minVedioMB = unusedSpaceGB * 1000 / 150
show("你的手机存储为\(spaceGB)GB\n已占用\(usedSpaceGB)GB\n剩余\(unusedSpaceGB)GB \n相当于可以再记录\(minVedioMB)分钟的视频")
