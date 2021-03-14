let character = Character()
let expert = Expert()
func collectLineGems(startRow: Int, endRow: Int, colum: Int) {
    for i in startRow ... endRow {
        world.place(character, atColumn: colum, row: i)
        character.collectGem()
    }
}
collectLineGems(startRow: 0, endRow: 6, colum: 4)
collectLineGems(startRow: 0, endRow: 6, colum: 2)
collectLineGems(startRow: 0, endRow: 6, colum: 0)
world.place(expert, atColumn: 3, row: 0)
expert.toggleSwitch()
