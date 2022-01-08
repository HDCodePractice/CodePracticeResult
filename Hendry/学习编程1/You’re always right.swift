while !isBlocked {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnGem {
        collectGem()
    }
    if isBlocked {
        turnRight()
    }
}
