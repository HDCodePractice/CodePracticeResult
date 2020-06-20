while !isBlocked {
    moveForward()
    moveForward()
    moveForward()
    turnRight()
    if isOnClosedSwitch{
        toggleSwitch()
    }
}
