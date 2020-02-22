while !isBlockedRight || !isOnGem {
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isBlocked {
        turnRight()
    }
    moveForward()
}
