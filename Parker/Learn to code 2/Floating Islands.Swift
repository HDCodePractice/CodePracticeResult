let character = Character()
world.place(character, atColumn: 0, row: 6)
world.place(Block(), atColumn: 7, row: 4)
world.place(Portal(color: #colorLiteral(red: 0.23921568627450981, green: 0.6745098039215687, blue: 0.9686274509803922, alpha: 1.0)), atStartColumn: 2, startRow: 7, atEndColumn: 7, endRow: 4)
world.place(Portal(color: #colorLiteral(red: 0.4666666666666667, green: 0.7647058823529411, blue: 0.26666666666666666, alpha: 1.0)), atStartColumn: 5, startRow: 3, atEndColumn: 2, endRow: 0)
func turnAndJump() {
    character.turnLeft()
    character.jump()
}
func SolveTheIsland() {
    turnAndJump()
    character.collectGem()
    turnAndJump()
    character.toggleSwitch()
    character.turnLeft()
    turnAndJump()
    turnAndJump()
    character.toggleSwitch()
    turnAndJump()
}
SolveTheIsland()
SolveTheIsland()
character.turnLeft()
SolveTheIsland()
