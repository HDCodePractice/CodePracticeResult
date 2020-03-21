let allCoordinates = world.allPossibleCoordinates
var blockSet: [Coordinate] = []

for coordinate in allCoordinates {
    // Check for coordinates with a column > 5 OR a row < 4.
    if coordinate.column > 5 || coordinate.row < 4 {
        // Append coordinate to blockSet.
        blockSet.append(coordinate)
    }
}

// For each coordinate in blockSet, place six blocks.
for coordinate in blockSet {
    for i in 1 ... 6 {
        world.place(Block(), at: coordinate)
    
}
}
