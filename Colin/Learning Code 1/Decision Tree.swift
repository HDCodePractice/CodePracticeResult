func move() {
    for i in 1...3 {
        moveForward()
    }
}
func leftGem() {
    toggleSwitch()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnLeft()
}
func turnRightGem() {
    collectGem()
    turnRight()
    move()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    move()
    turnRight()
}
for i in 1 ... 5{
    moveForward()
    if isOnGem {
        turnRightGem()
    } else if isOnClosedSwitch {
        leftGem()
    }
}
