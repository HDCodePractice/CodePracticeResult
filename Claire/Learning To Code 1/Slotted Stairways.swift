func collectGemTurnAround() {
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnLeft()
}
func solveRow() {
    collectGemTurnAround()
    moveForward()
    turnLeft()
    collectGemTurnAround()
    moveForward()
    turnLeft()
    collectGemTurnAround()
}
solveRow()
turnRight()
solveRow()
