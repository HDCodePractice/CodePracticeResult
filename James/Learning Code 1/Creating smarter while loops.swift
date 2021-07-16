for i in 1 ... 9 {
    while !isOnClosedSwitch {
        moveForward()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
}
