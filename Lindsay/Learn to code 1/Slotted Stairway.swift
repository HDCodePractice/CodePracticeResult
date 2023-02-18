func collectGemTurnAround() {
    moveFoward()
    moveFoward()
    collectGem()
    turnLeft()
    turnLeft()
    moveFoward()
    moveFoward()
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
turnRight()
solveRow()
