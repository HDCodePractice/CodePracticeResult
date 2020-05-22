for i in 1 ... 7 {
    moveForward()
    if isOnGem && isBlockedLeft {
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        toggleSwitch()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    }
    if isOnGem {
        collectGem()
    }
}
