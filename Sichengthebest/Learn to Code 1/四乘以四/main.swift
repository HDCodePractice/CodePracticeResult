for i in 1 ... 4 {
    while !isBlocked {
        moveForward()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
    turnRight()
}
