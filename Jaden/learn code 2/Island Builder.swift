let allCoordinates = world.allPossibleCoordinates
// Create two empty arrays of type [Coordinate].
var island: [Coordinate] = []
var sea: [Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column>3 && coordinate.column<8 && coordinate.row>3 && coordinate.row<8 {
        // Append to island array.
        island.append(coordinate)
    } else {
        sea.append(coordinate)
        // Append to sea array.
        
    }
}
// For your island array, place blocks.
for i in island {
    world.place(Block(), at: i)
    
    
}


// For your sea array, place water.
for i in sea {
    world.removeAllBlocks(at: i)
    world.place(Water(), at: i)
}
