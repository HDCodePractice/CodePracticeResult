while !isBlocked || !isBlockedLeft || !isBlockedRight {
    if isOnClosedSwitch {
        toggleSwitch()
        if !isBlockedRight && !isBlocked {
            turnRight()
            }
        } else if !isBlocked {
        moveForward()
        if isOnGem {
            collectGem()
            }
        } else if isBlocked && isBlockedLeft {
        turnRight()
        } else {
        turnLeft()
        }
    }
