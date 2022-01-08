var teamBlu: [Character] = []

// 注意数组中有多少个 Blu 的实例。
for i in 1...9 {
    teamBlu.append(Character(name: .blu))
}

// 在第 4 行中的每一列放置 Blu。
var columnPlacement = 0
for blu in teamBlu {
    world.place(blu, at: Coordinate(column: columnPlacement, row: 4))
    columnPlacement += 1
}

// 查找索引超出范围错误。
teamBlu[0].jump()
teamBlu[2].collectGem()
teamBlu[4].jump()
teamBlu[6].collectGem()
teamBlu[8].jump()
