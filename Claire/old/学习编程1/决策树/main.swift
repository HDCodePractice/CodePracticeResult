func getTM() {
    turnRight()
    moveForward()
    moveForward()
    moveForward()
}
func solveLeft() {
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
}
for i in 1 ... 5 {
    moveForward()
    if isOnGem {
        collectGem()
        getTM()
        solveLeft()
        getTM()
        turnRight()
    }else if isOnClosedSwitch {
        toggleSwitch()
        solveLeft()
        turnLeft()
    }
}
