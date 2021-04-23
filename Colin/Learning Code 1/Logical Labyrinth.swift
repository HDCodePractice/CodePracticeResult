for i in 1 ... 7 {
    moveForward()
    if isOnGem && isOnClosedSwitch {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    } else if isOnOpenSwitch {
        moveForward()
    } 
    if isBlocked && isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    } else if !isBlockedLeft {
        turnLeft()
        toggleSwitch()
    } else if isOnGem {
        collectGem()
    }
}
