var DaRow2 = world.row(2)
var empty: [Coordinate] = []
for i in 1...12 {
    for coordinate in DaRow2 {
        world.place(Block(), at: coordinate)
    }
    empty.append(DaRow2.remove(at: 0))
}
for coordinate in empty {
    world.place(Stair(), facing: west, at: coordinate)
    world.place(Character(), at: coordinate)
    world.place(Expert(), at: coordinate)
}
