let allCoordinates = world.allPossibleCoordinates
var isLandCoordinates:[Coordinate] = []
var waterCoordinates:[Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column > 0 && coordinate.column < 11 && coordinate.row > 0 && coordinate.row < 11 {
        isLandCoordinates.append(coordinate)
    } else {
        waterCoordinates.append(coordinate)
    }
}
for coordinate in isLandCoordinates {
    world.place(Block(), at: coordinate)
}
for coordinate in waterCoordinates {
    world.removeAllBlocks(at: coordinate)
    world.place(Water(), at: coordinate)
}
