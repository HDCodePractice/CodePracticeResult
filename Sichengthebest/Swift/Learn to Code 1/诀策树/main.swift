func solveRightSide() {
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    moveForward()
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
    turnLeft()
}
for i in 1 ... 5 {
    moveForward()
    if isOnGem {
        solveRightSide()
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
        solveLeftSide()
    }   
}
