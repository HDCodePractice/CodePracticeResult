let expert = Expert()
let character = Character()
world.place(expert, facing: .north,atColumn: 5, row: 1)
for i in 1 ... 5 {
    world.place(expert,atColumn: 5, row: i)
    expert.collectGem()
}
world.place(expert, atColumn: 4, row: 5)
expert.collectGem()
world.place(character, atColumn: 1, row: 8)
character.collectGem()
for i in 1 ... 4 {
    character.moveForward()
    character.collectGem()
}
