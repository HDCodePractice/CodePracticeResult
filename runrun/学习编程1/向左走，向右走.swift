func go() {
    if !isBlocked {
        moveForward()
    }
    else if isBlocked && !isBlockedLeft {
        turnLeft()
        moveForward()
    }
    else if isBlocked && !isBlockedRight {
        turnRight()
        moveForward()
    }
    }
while !isBlocked || !isBlockedLeft || !isBlockedRight{
    go()
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnGem {
        collectGem()
    }
    }
