for i in 1 ... 6 {
    while !isOnClosedSwitch || isOnOpenSwitch {
        moveForward()
    }
    while isBlocked && isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    }
    while isOnClosedSwitch {
        toggleSwitch()
        turnRight()
    }
}
for i in 1 ... 5 {
    moveForward()
}
collectGem()
