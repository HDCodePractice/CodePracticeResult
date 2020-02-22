for i in 1 ... 8 {
    moveForward()
    if isOnClosedSwitch && isOnGem{
        collectGem()
        toggleSwitch()
        turnRight()
        moveForward()
        moveForward()
    }
    if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    }
    if isOnGem && isBlockedLeft && isBlocked {
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        moveForward()
        turnRight()
    }
    if isOnGem {
        collectGem()
    }
}
    


