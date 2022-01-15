let char = Character()
world.place(char, facing: east, atColumn: 1, row: 2)
world.place(Portal(color: #colorLiteral(red: 0.3997545242, green: 0.6133489013, blue: 0.2060141265, alpha: 1.0)), atStartColumn: 1, startRow: 3, atEndColumn: 2, endRow: 7)
world.place(Portal(color: #colorLiteral(red: 0.9023433924, green: 0.2320581675, blue: 0.4786583185, alpha: 1.0)), atStartColumn: 3, startRow: 3, atEndColumn: 5, endRow: 3)
func solveSquare() {
    for i in 1 ... 4 {
        char.jump()
        if i == 4 {
            break
        }
        char.turnRight()
        if char.isOnGem {
            char.collectGem()
        } else if char.isOnClosedSwitch {
            char.toggleSwitch()
        }
    }
}
solveSquare()
char.moveForward()
char.turnRight()
char.turnRight()
solveSquare()
char.move(distance: 2)
char.turnLeft()
solveSquare()
