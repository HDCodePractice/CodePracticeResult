let character = Character()
world.place(character, atColumn: 2, row: 1)
func go() {
    for i in 1 ... 5 {
        character.collectGem()
        character.toggleSwitch()
        character.turnRight()
        character.jump()
    }
}
go()
world.place(character, atColumn: 6, row: 4)
go()
character.toggleSwitch()
world.place(character, atColumn: 1, row: 6)
go()
character.turnRight()
character.jump()
character.toggleSwitch()
