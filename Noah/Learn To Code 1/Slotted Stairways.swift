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
    collectGemTurnAround()
    collectGemTurnAround()
    turnLeft()
    moveForward()
    turnRight()
    collectGemTurnAround()
    collectGemTurnAround()
}
solveRow()
