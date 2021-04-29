while isBlocked || isBlockedLeft || isBlockedRight {
    if !isBlocked {
        moveForward()
    } else if isBlocked && !isBlockedLeft {
        turnLeft()
        moveForward()
    } else if isBlocked && !isBlockedRight {
        turnRight()
        moveForward()
    }
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    } else if isOnOpenSwitch {
        turnRight()
    }
}

