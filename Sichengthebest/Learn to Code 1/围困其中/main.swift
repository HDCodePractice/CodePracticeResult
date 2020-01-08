for i in 1 ... 8 {
    moveForward()
    if isBlocked {
        turnLeft()
    }
    if isOnClosedSwitch{
        toggleSwitch()
    } else if isOnGem {
        collectGem()
    }   
}
