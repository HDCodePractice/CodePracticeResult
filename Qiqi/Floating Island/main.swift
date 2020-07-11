let character = Character()
world.place(character, atColumn: 0, row: 6)
world.place(Block(), atColumn: 7, row: 4)
world.place(Portal(color: #colorLiteral(red: 0.23921568627450981, green: 0.6745098039215687, blue: 0.9686274509803922, alpha: 1.0)), atStartColumn: 2, startRow: 7, atEndColumn: 7, endRow: 4)
world.place(Portal(color: #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)), atStartColumn: 5, startRow: 3, atEndColumn: 2, endRow: 0)
func turnLeftJump() {
    character.turnLeft()
    character.jump()
}
func islandRule() {
    turnLeftJump()
    character.collectGem()
    turnLeftJump()
    character.toggleSwitch()
    character.turnLeft()
    turnLeftJump()
    turnLeftJump()
    character.toggleSwitch()
    turnLeftJump()
}
islandRule()
islandRule()
character.turnLeft()
islandRule()
