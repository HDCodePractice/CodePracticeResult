while !isOnClosedSwitch {
    moveForward()
    if isBlocked {
        turnRight()
    }
}
toggleSwitch()
