let character = Character()
world.place(character, atColumn: 0, row: 3)
world.place(Block(), atColumn: 0, row: 2)
world.place(Block(), atColumn: 1, row: 3)
world.place(Block(),atColumn: 3, row: 3)
world.place(Block(),atColumn: 6, row: 3)
world.place(Block(),atColumn: 6, row: 0)
world.place(Block(),atColumn: 1, row: 0)
bluePortal.isActive=false
for i in 1 ... 38 {
    if character.isBlocked {
        character.turnLeft()
    }else if !character.isBlocked {
        character.moveForward()
        character.collectGem()
    }
}
