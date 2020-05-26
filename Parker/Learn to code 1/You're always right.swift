while !isBlocked {
    while !isBlocked{
        moveForward()
        if isOnClosedSwitch {
            toggleSwitch()
        }
    }
    turnRight()
    if isOnGem {
        collectGem()
    }
}
