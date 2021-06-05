while !isBlocked {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    } else if isBlockedLeft && !isBlockedRight && isBlocked{
        turnRight()
    } 
    if isOnGem {
        collectGem()
    }
}
