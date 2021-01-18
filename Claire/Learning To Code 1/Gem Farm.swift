func pattern() {
    turnRight()
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
}
for i in 1 ... 3 {
    pattern()
}
