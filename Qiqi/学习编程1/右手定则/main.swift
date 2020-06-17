while !isBlocked {
    moveForward()
    while isBlocked {
        turnRight()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnGem {
        collectGem()
    }
}
