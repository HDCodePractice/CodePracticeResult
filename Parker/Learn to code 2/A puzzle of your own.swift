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
world.place(Gem(), atColumn: 2, row: 0)
world.place(Switch(), atColumn: 2, row: 1)
world.place(Switch(), atColumn: 4, row: 1)
world.place(Gem(), atColumn: 4, row: 0)
world.place(Stair(), facing: north, atColumn: 4, row: 2)
world.place(Stair(), facing: north, atColumn: 2, row: 2)
world.place(Stair(), facing: north, atColumn: 0, row: 2)
world.place(Stair(), facing: west, atColumn: 3, row: 6)
world.place(Stair(), facing: west, atColumn: 4, row: 6)
let charater = Character()
world.place(charater, facing: south, atColumn: 7, row: 6)
world.place(Stair(), facing: south, atColumn: 6, row: 4)
world.place(Stair(), facing: south, atColumn: 6, row: 3)
