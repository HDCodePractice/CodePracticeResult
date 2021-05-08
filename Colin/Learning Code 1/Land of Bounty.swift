while !isBlocked {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    } 
    if isOnGem {
        collectGem()
    }
    if isBlocked && isBlockedLeft {
        turnRight()
        moveForward()
        turnRight()
    } else if isBlocked && !isBlockedRight{
        turnLeft()
        moveForward()
        turnLeft()
    }
}
