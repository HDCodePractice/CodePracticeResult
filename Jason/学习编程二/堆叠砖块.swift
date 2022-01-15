// 添加其余两个角的坐标。
var blockLocations = [
    Coordinate(column: 0, row: 0),
    Coordinate(column: 3, row: 3),
    Coordinate(column: 0, row: 3),
    Coordinate(column: 3, row: 0)
]
// 在每个坐标处放置五块砖。
for coordinate in blockLocations {
    for i in 1 ... 5 {
        world.place(Block(), at: coordinate)
    }
    
}
