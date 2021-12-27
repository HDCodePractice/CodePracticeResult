// Create an array of all coordinates in row 2.
var row2 = world.coordinates(inRows: [2])
// Create an empty array of coordinates.
var disc: [Coordinate] = []


for i in 1...12 {
    for i in row2 {
        world.place(Block(), at: i)
    }
    disc.append(row2.remove(at: 0))
    // Remove a coordinate and append it to your empty array.
    
}

// Place a character for each coordinate added to your empty array.
for i in disc {
    world.place(Character(), at: i)
}
