while !isOnClosedSwitch {
    if !isBlockedRight {
        turnRight()
        moveForward()
    }
    else if isBlockedRight {
        moveForward()
    }
}
toggleSwitch()
