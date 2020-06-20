while !isOnGem {
    while !isBlocked{
        moveForward()
        if isOnClosedSwitch {
            toggleSwitch()
        }
    }
    turnRight()
}
collectGem()
