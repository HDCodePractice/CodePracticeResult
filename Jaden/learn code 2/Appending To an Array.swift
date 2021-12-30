let allCoordinates = world.allPossibleCoordinates
var blockSet: [Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column > 5 || coordinate.row < 4 {
        blockSet.append(coordinate)
    }
}
for i in blockSet {
    for j in 1 ... 6 {
        world.place(Block(), at: i )
    }

}
