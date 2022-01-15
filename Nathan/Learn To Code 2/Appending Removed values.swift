var TheTwoRows = world.row(2)
var empty: [Coordinate] = []
for i in 1...12 {
    for coordinate in TheTwoRows {
        world.place(Block(), at: coordinate)
    }
    empty.append(TheTwoRows.remove(at: 0))
}
for coordinate in empty {
    world.place(Stair(), facing: west, at: coordinate)
    world.place(Character(), at: coordinate)
    world.place(Expert(), at: coordinate)
}
