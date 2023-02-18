func turning() {
    turnRight()
    moveForward()
    moveForward()
    moveForward()
}
func patterns() {
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
        turning()
        turnLeft()
        patterns()
        turning()
        turnRight()
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
        patterns()
        turnLeft()
    }
}
