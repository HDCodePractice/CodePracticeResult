func solveLeftSide() {
    toggleSwitch()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnLeft()
    moveForward()
}
func SloveRightSide() {
    collectGem()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    turnRight()
}
for i in 1 ... 5 {
    moveForward()
    if isOnGem {
        SloveRightSide()
    }else if isOnClosedSwitch {
        solveLeftSide()
    }
}
