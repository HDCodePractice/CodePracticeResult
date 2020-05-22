for i in 1 ... 12 {
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnOpenSwitch || isOnClosedSwitch {
        turnRight()
    }
    if isBlocked {
        turnRight()
    }
    moveForward()
}
