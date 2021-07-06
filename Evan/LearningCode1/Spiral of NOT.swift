for i in 1 ... 13 {
    if isBlocked {
        turnLeft()
        moveForward()
    }else if !isBlocked {
        moveForward()
    }
}
toggleSwitch()
