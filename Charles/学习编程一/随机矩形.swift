for i in 1 ... 4 {
    while !isBlocked {
        moveForward()
    }
    while isBlocked&&isBlockedLeft {
        turnRight()
    }
}
toggleSwitch()
