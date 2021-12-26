
while !isOnOpenSwitch{
    if isBlocked && !isBlockedLeft{
        turnLeft()
        
    }
    if isBlocked && !isBlockedRight{
        turnRight()
        
    }

    if isOnGem{
        collectGem()
        gem += 1
        
    }
    if isOnClosedSwitch{
        toggleSwitch()
        
    }
    if isBlocked{
        turnLeft()
        turnLeft()
        
    }
    moveForward()
}
