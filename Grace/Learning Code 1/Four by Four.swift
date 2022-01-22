
while !isBlocked || !isBlockedLeft {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        turnRight()
    } else if isOnOpenSwitch {
        turnRight()
    }
}
