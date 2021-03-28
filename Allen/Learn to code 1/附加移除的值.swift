// 创建第 2 行所有坐标的数组。
var row2 = world.coordinates(inRows: [2])
// 创建空的坐标数组。
var row3: [Coordinate] = []

for i in 1...19 {
    for coordinate in row2 {
        world.place(Block(), at: coordinate)
    }
    // 移除坐标并将它附加到空数组中。
    row3.append(row2.remove(at: 0))
}

// 为添加到空数组中的每个坐标放置一个角色。
for coordinate in row3 {
    world.place(Character(), at: coordinate)
}
