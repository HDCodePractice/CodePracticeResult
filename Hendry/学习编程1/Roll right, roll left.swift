while !isBlocked {
    moveForward()
    if isOnGem {
        collectGem()
        turnRight()
        moveForward()
        collectGem()
        
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
    if isBlockedLeft && isBlocked{
        turnRight()
    } else if isBlockedRight && isBlocked{
        turnLeft()
    }else if isBlocked {
        turnLeft()
    }
}
