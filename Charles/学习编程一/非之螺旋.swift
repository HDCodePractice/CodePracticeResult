for i in 1 ... 13 {
    if !isBlocked {
        moveForward()
    }else if isBlocked {
        turnLeft()
        moveForward()
    }
}
toggleSwitch()
