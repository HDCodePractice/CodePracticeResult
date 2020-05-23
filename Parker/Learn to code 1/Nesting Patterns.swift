func turnAround() {
    turnLeft()
    turnLeft()
}

func solveStair() {
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    moveForward()
    collectGem()
    turnAround()
    moveForward()
}
solveStair()
turnRight()
solveStair()
