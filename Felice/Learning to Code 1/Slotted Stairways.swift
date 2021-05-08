func collectGemTurnAround() {
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
func solveRow() {
    collectGemTurnAround()
    collectGemTurnAround()
    turnRight()
    moveForward()
    turnRight()
}
solveRow()
solveRow()
turnRight()
moveForward()
moveForward()
turnLeft()
solveRow()
