let character = Character()
for i in 0 ... 4 {
    for y in 0 ... 6 {
        world.place(character, atColumn: i, row: y)
        character.collectGem()
        character.toggleSwitch()
    }
}
