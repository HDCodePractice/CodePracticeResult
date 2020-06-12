func turnLeftMove() {
    turnLeft()
    moveForward()
}
func move3() {
    moveForward()
    moveForward()
    moveForward()
}
func solveLeftSide() {
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeftMove()
    turnLeft()
}
for i in 1 ... 5 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
        moveForward()
        collectGem()
        turnLeft()
        turnLeftMove()
        turnLeft()
    }
    else if isOnGem {
        collectGem()
        turnRight()
        move3()
        turnLeftMove()
        collectGem()
        turnLeft()
        turnLeftMove()
        turnRight()
        move3()
        turnRight()
    }
}
