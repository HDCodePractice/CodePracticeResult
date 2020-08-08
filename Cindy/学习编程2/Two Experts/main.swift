let expert = Expert()
let character = Character()
world.place(expert, facing: north, atColumn: 0, row:0)
character.collectGem()
for i in 1 ... 6 {
    world.place(expert,atColumn: i, row: 4)
    expert.collectGem()
}
