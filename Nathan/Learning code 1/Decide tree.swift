func turnMove() {
    turnRight()
    moveForward()
    moveForward()
    moveForward()
}
func pattern() {
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
}
for i in 1 ... 6 {
    moveForward()
    if isOnGem {
        collectGem()
        turnMove()
        turnLeft()
        pattern()
        turnMove()
        turnRight()
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
        pattern()
        turnLeft()
    }
}
