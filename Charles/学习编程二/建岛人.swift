let allCoordinates = world.allPossibleCoordinates
//Create two empty arrays of type [Coordinate].
var island: [Coordinate] = []
var sea: [Coordinate] = []

for coordinate in allCoordinates {
    if coordinate.column > 3 && coordinate.column < 7 && coordinate.row > 3 && coordinate.row < 7 {
        // Append to island array.
        island.append(coordinate)
    } else {
        // Append to sea array.
        sea.append(coordinate)
    }
}

// For your island array, place blocks.
for coordinate in island {
    world.place(Block(), at:coordinate)
}

// For your sea array, place water.
for coordinate in sea {
    world.removeAllBlocks(at: coordinate)
    world.place(Water(), at: coordinate)
}
