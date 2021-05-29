world.place(Gem(), atColumn: 1, row: 0)
world.place(Gem(), atColumn: 3, row: 1)
world.place(Gem(), atColumn: 2, row: 3)
world.place(Switch(), atColumn: 6, row: 1)
let character = Character()
world.place(character, atColumn: 1, row: 0)
character.collectGem()
character.turnLeft()
for i in 1 ... 2  {
character.moveForward()
character.moveForward()
character.turnLeft()
character.moveForward()
character.collectGem()
}
character.turnLeft()
character.turnLeft()
for i in 1 ... 4 {
    character.moveForward()
}
character.turnRight()
character.moveForward()
character.moveForward()
character.toggleSwitch()
