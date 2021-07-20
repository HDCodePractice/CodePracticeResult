while !isOnOpenSwitch {
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    
    if isBlocked && isBlockedRight {
        turnLeft()
    }
    else if isBlocked && isBlockedLeft {
        turnRight()
    }
    if isBlocked {
        turnLeft()
    }
    
    moveForward()
}
