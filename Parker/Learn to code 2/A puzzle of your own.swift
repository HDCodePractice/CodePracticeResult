for x in 2 ... 2 {
    for y in 0 ... 1 {
        world.place(Block(), atColumn: x, row: y)
    }
}
for x in 4 ... 4 {
    for y in 0 ... 1 {
        world.place(Block(), atColumn: x, row: y)
    }
}
let block1 = Block()
world.place(block1, atColumn: 3, row: 6)
world.place(Gem(), atColumn: 2, row: 6)
world.place(Gem(), atColumn: 1, row: 6)
world.place(Gem(), atColumn: 0, row: 6)
world.place(Gem(), atColumn: 0, row: 0)
world.place(Switch(), atColumn: 0, row: 1)
world.place(Gem(), atColumn: 2, row
