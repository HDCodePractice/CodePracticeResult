var row2 = world.row(2)
var newArray: [Coordinate] = []
for i in 1 ... 12 {
    for coordinate in row2 {
        world.place(Block(), at: coordinate)
    }
    newArray.append(row2.removeFirst())
}
for coordinate in newArray {
    world.place(Character(), at: coordinate)
}
