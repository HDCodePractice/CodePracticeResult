let expert = Expert()
let character = Character()
world.place(expert, facing: north, atColumn: 3, row: 0)
expert.toggleSwitch()
for i in 0 ... 4 {
    world.place(character, facing: north, atColumn: 0, row: i)
    character.collectGem()
}
for i in 0 ... 4 {
    world.place(character, facing: north, atColumn: i, row: 4)
    character.collectGem()
}
world.place(character, facing: north, atColumn: 4, row: 6)
character.collectGem()

