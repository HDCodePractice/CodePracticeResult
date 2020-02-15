for i in 1 ... 13 {
    if !isBlocked {
        moveForward()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isBlocked {
        turnLeft()
    }
}
