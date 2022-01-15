for i in 1 ... 4 {
    if isOnClosedSwitch {
        toggleSwitch()
        moveForward()
        moveForward()
        moveForward()
        turnRight()
    } else {
        moveForward()
        moveForward()
        moveForward()
        turnRight()
    }
}
