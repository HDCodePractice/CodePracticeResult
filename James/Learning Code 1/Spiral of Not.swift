for i in 1 ... 13 {
    moveForward()
    if !isBlocked {
        moveForward()
    } else {
        turnLeft()
        toggleSwitch()
    }  
}
