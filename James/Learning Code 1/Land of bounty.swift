for i in 1 ... 25 {
    if isBlocked && isBlockedLeft {
        turnRight()
        moveForward()
        turnRight()
    } else if isOnGem {
        collectGem()
        moveForward()
    } else if !isOnClosedSwitch && !isBlocked {
        moveForward()
    } else if isOnClosedSwitch {
        toggleSwitch()
        moveForward()
    } else if isBlocked {
        turnLeft()
        moveForward()
        turnLeft()
    }
    }
