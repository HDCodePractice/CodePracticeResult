// Add the two remaining corner coordinates.
var blockLocations = [
    Coordinate(column: 0, row: 0),
    Coordinate(column: 3, row: 3),
    Coordinate(column: 3, row: 0),
    Coordinate(column: 0, row: 3)
]
// Place five blocks at each coordinate.
for i in 1 ... 5 {
for i in blockLocations {
    world.place(Block(), at: i)
}
}
