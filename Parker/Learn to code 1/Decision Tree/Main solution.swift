func turnMove3() {
    turnRight()
    moveForward()
    moveForward()
    moveForward()
}
func solveLeftSide() {
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnLeft()
}
for i in 1 ... 5 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        solveLeftSide()
    }
    else if isOnGem {
        collectGem()
        turnMove3()
        turnLeft()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        turnMove3()
        turnRight()
    }
}
