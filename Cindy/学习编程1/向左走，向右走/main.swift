for i in 1...29{
    moveForward()
    if isOnGem {
        collectGem()
        turnRight()
        moveForward()
        collectGem()
    } else if isBlocked && isBlockedRight{
        turnLeft()
        moveForward()
        toggleSwitch()
    } else if isOnClosedSwitch{
        toggleSwitch()
    }
    if isBlocked && isBlockedLeft{
        turnRight()
    }
    if isBlocked{
        turnLeft()
    }
}
