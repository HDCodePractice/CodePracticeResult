for i in 1...4 {
    moveForward()
    moveForward()
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        turnRight()
    } else {
        turnRight()
    }
}
