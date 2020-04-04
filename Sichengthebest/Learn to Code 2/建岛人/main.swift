let allCoordinates = world.allPossibleCoordinates
var waterSpaces: [Coordinate] = []
var landHo: [Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column > 8 || coordinate.column < 2 || coordinate.row < 2 || coordinate.row > 8 {
        waterSpaces.append(coordinate)
    } else {
        landHo.append(coordinate)
    }
}
for coordinate in landHo {
    for i in 1 ... randomInt(from: 1, to: 12) {
        world.place(Block(), at: coordinate)
    }
}
for coordinate in waterSpaces {
    world.removeAllBlocks(at: coordinate)
    world.place(Water(), at: coordinate)
}
for i in 1 ... 25 {
    world.place(Character(name: .byte), atColumn: randomInt(from: 2, to: 8), row: randomInt(from: 2, to: 8))
}
