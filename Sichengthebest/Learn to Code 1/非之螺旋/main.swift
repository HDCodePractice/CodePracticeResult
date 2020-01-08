for i in 1 ... 14 {
    if isOnClosedSwitch {
        toggleSwitch()
    } else if !isBlocked {
        moveForward()
    } else if isBlocked {
        turnLeft()
        moveForward()   
    }   
}
