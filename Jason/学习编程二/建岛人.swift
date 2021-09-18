let allCoordinates = world.allPossibleCoordinates
// 创建两个空的 [Coordinate] 类型数组。
var blockset : [Coordinate] = []
var waterset : [Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column < 4 && coordinate.row > 1 && coordinate.row < 7 && coordinate.column > 1{
        // 附加到岛数组。
        blockset.append(coordinate)
    } else {
        // 附加到海数组。
        waterset.append(coordinate)
    }
}

// 针对岛数组，放置砖块。
for coordinate in blockset {
    world.place(Block(), at: coordinate)
}

// 针对海数组，放置水。
for coordinate in waterset {
    world.removeAllBlocks(at: coordinate)
    world.place(Water(), at: coordinate)
}
