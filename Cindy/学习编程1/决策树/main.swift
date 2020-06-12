func solveRightSide() {
    collectGem()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    solveLeftSide()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    turnRight()
}
func solveLeftSide() {
        turnLeft()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
    }
for i in 1...5 {
    moveForward()
    if isOnGem{
        solveRightSide()
    } else if isOnClosedSwitch{
        toggleSwitch()
        solveLeftSide()
        turnLeft()
    }
}
