world.place(Block(), atColumn: 2, row: 3)
world.place(Block(), atColumn: 3, row: 3)
world.place(Block(), atColumn: 3, row: 3)
for i in 1...3{
    world.place(Block(), atColumn: 4, row: 3)
}
for i in 1...4{
    world.place(Block(), atColumn: 5, row: 3)
}
for i in 1...5{
    world.place(Block(), atColumn: 6, row: 3)
}
world.place(Block(), atColumn: 11, row: 10)
for j in 0...7{
    world.place(Gem(), atColumn: j, row: 0)
    world.place(Gem(), atColumn: j, row: 6)
}
for i in 0...7{
    world.place(Switch(), atColumn: i, row:1)
    world.place(Switch(), atColumn: i, row: 5)
}
for k in 0...7{
    world.place(Gem(), atColumn: k, row: 4)
    world.place(Gem(), atColumn: k, row: 2)
}
for i in 1...6{
    world.place(Stair(), facing: .west, atColumn: i, row: 3)
}
world.place(Gem(), atColumn: 6, row: 3)
world.place(Portal(color: #colorLiteral(red: 0.9023433924, green: 0.2320581675, blue: 0.4786583185, alpha: 1.0)), atStartColumn: 6, startRow: 3, atEndColumn: 11, endRow: 10)
let character = Character()
world.place(character, facing: .east, atColumn: 0, row: 3)
character.move(distance: 6)
while character.isBlocked{
    character.turnLeft()
