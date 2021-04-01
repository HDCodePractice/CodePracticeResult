let allCoordinates = world.allPossibleCoordinates
// 创建两个空的 [Coordinate] 类型数组。
var island:[Coordinate]=[]
var water:[Coordinate]=[]
for coordinate in allCoordinates {
    if !(coordinate.column + coordinate.row > 17 && coordinate.column + coordinate.row > 5) && !(coordinate.column + coordinate.row < 16 && coordinate.column + coordinate.row < 5) && !(coordinate.column - coordinate.row > 6) && !(coordinate.row - coordinate.column > 6) {
        // 附加到岛数组。
        island.append(coordinate)
    } else {
        // 附加到海数组。
        water.append(coordinate)
    }
}
// 针对岛数组，放置砖块。
for coordinate in island {
    world.place(Block(), at: coordinate)
}
// 针对海数组，放置水。
for coordinate in water {
    world.removeAllBlocks(at: coordinate)
    world.place(Water(), at: coordinate)
}
