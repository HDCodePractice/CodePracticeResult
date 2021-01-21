func go() {
    moveForward()
    moveForward()
    moveForward()
}
func solveRightSide() {
    collectGem()
    turnRight()
    go()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    go()
    turnRight()
}
func solveLeftSide() {
    toggleSwitch()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnLeft()
}
for i in 1 ... 5{
    moveForward()
    if isOnGem {
        solveRightSide()
    }else if isOnClosedSwitch {
        solveLeftSide()
    }
}
