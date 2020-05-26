for i in 1 ... 13 {
    moveForward()
    if isBlocked {
        turnLeft()
        toggleSwitch()
    }
    else if !isBlocked {
        
    }
}
