// Create an array of all coordinates in row 2.

var DaRow2 = world.row(2)

// Create an empty array of coordinates.

var empty: [Coordinate] = []
for i in 1...12 {
    for coordinate in DaRow2 {
        world.place(Block(), at: coordinate)
    }
    // Remove a coordinate and append it to your empty array.
    empty.append(DaRow2.remove(at: 0))
    
}

// Place a character for each coordinate added to your empty array.
for coordinate in empty {
    world.place(Stair(), facing: west, at: coordinate)
    world.place(Character(), at: coordinate)
    world.place(Expert(), at: coordinate)
}
