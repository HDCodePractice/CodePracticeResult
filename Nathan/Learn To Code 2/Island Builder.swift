let allCoordinates = world.allPossibleCoordinates
var island: [Coordinate] = []
var sea: [Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column <=   3 || coordinate.row >=  8 || coordinate.column >=  8 || coordinate.row <=  3 {
        sea.append(coordinate)
    } else {
        island.append(coordinate)
    }
}
for c in sea {
    world.removeAllBlocks(at:c )
    world.place(Water(), at: c)
}
for c in island {
    world.place(Block(), at: c)
}
