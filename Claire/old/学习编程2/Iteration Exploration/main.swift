for x in 0 ... 4 {
    for y in 1 ... 1 {
        world.place(Gem(), atColumn: x, row: y)
    }
}
for a in 0 ... 4 {
    for b in 1 ... 1 {
        world.place(Switch(), atColumn: a, row: b)
    }
}
