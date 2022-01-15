world.place(Platform(), atColumn: 1, row: 5)
world.place(PlatformLock(), atColumn: 2, row: 5)
let character = Character()
world.place(character, atColumn: 6, row: 0)
for i in 1 ... 3 {
    world.place(Gem(), atColumn: 6, row: i)
}
character.turnLeft()
character.turnLeft()
for i in 1 ... 2 {
    character.jump()
    character.collectGem()
}
world.removeItems(atColumn: 2, row: 5)
