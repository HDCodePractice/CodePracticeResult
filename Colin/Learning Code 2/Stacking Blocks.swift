var blockLocations = [
    Coordinate(column: 0, row: 0),
    Coordinate(column: 3, row: 3),
    Coordinate(column: 0, row: 3),
    Coordinate(column: 3, row: 0)
]
for i in 1...5{
    for coordinate in blockLocations {
        world.place(Block(), at: coordinate)
    }
}
