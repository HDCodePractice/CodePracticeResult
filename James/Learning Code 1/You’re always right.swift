while !isOnGem {
    while isOnOpenSwitch {
        moveForward()
    }
    while isBlocked {
        turnRight()
    }
    toggleSwitch()
    moveForward()
}
collectGem()
