var row2 = world.row(2)
var emptyCords: [Coordinate] = []
for i in 1...12 {
    for coordinate in row2  {
        world.place(Block(), at: coordinate)
    }
    emptyCords.append(row2.remove(at: 0))
}
for coordinate in emptyCords {
    world.place(Character(name: .blu), at: coordinate)
}
