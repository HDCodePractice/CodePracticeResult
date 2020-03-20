let allCoordinates = world.allPossibleCoordinates
var waterSpaces: [Coordinate] = []
var island: [Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column > 9 || coordinate.column == 0 || coordinate.row < 1 || coordinate.row > 9 {
        waterSpaces.append(coordinate)
        for coordinate in waterSpaces {
            world.removeAllBlocks(at: coordinate)
            world.place(Water(), at: coordinate)
        }
    } else {
        island.append(coordinate)
        for i in 1 ... randomInt(from: 1, to: 5) {
            world.place(Block(), at: coordinate)
        }
    }
}
