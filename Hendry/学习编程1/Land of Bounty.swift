while isBlockedLeft||isBlockedRight {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isBlocked&&isBlockedLeft {
        turnRight()
        moveForward()
        turnRight()
        moveForward()
        while isOnGem {
            collectGem()
            moveForward()
        }
    }
    if isBlocked {
        turnLeft()
        moveForward()
        turnLeft()
    }
}
