while !isBlocked || !isBlockedRight {
    if isOnGem {
        collectGem()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isBlocked && isBlockedLeft {
        turnRight()
        moveForward()
        turnRight()
    }
    if isBlocked && !isBlockedLeft {
        turnLeft()
        moveForward()
        turnLeft()
    }
    moveForward()
}
