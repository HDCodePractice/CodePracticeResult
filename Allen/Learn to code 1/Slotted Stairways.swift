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
    turnRight()
    moveForward()
    turnLeft()
}
for i in 1 ... 3 {
    collectGemTurnAround()
    collectGemTurnAround()
    solveRow()
}
