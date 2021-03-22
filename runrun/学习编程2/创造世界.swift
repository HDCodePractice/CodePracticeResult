var rowTwo = world.row(2)
var character:[Coordinate] = []
for i in 1...12 {
    for coordinate in rowTwo {
        world.place(Block(), at: coordinate)
    }
    character.append(rowTwo.remove(at: 0))
}
for character in character {
    world.place(Character(), facing: .east, at: character)
}
var blockLocations = [
    Coordinate(column: 0, row: 0),
    Coordinate(column: 3, row: 3),
    Coordinate(column: 3, row: 0),
    Coordinate(column: 0, row: 3)
]
for coordinate in blockLocations {
    for i in 1 ... 5 {
        world.place(Block(), at: coordinate)
    }
}
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

