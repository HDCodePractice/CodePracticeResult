let block = Block()
let character = Character()
world.place(block, atColumn: 3, row: 3)
world.place(character, facing: north, atColumn: 5, row: 0)
character.toggleSwitch()
