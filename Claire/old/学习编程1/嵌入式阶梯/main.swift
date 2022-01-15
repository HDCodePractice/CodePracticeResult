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
}
solveRow()
turnRight()
moveForward()
turnRight()
solveRow()
turnLeft()
moveForward()
turnLeft()
solveRow()
playgroundEpilogue()

