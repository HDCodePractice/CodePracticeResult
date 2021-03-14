let character = Character()
func collectLineGems(startColum: Int, endColum: Int, row: Int) {
    for i in startColum ... endColum {
        world.place(character, atColumn: i, row: row)
        character.collectGem()
    }
}
collectLineGems(startColum: 0, endColum: 7, row: 4)
collectLineGems(startColum: 0, endColum: 7, row: 0)
