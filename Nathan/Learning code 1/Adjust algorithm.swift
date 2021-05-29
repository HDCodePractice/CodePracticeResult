while !isOnClosedSwitch {
    if isBlockedRight && !isBlocked {
        moveForward()
    } else if isBlockedRight && isBlocked {
        turnLeft()
    } else {
        turnRight()
        moveForward()
    }
    if isOnGem {
        collectGem()
        turnLeft()
    }
}
toggleSwitch()
