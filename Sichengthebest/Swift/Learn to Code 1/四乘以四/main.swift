while !isBlocked {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        turnRight()
    } else if isOnOpenSwitch {
        turnRight()
    }
}
