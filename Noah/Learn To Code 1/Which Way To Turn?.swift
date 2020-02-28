while !isOnGem {
    if isOnClosedSwitch {
        toggleSwitch()
        if !isBlocked {
            turnRight()
        } else {
            turnLeft()
        }
    }
    moveForward()
}
collectGem()
