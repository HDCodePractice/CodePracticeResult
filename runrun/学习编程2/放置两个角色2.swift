let character = Character()
world.place(character, facing: north, atColumn: 3, row: 0)
character.toggleSwitch()
func collectLineGem(startRow: Int, endRow: Int, colum: Int) {
    for i in startRow ... endRow {
        world.place(character, atColumn: colum, row: i)
        character.collectGem()
    }
}
collectLineGem(startRow: 0, endRow: 4, colum: 0)
collectLineGem(startRow: 2, endRow: 4, colum: 2)
collectLineGem(startRow:4, endRow: 6, colum: 4)
