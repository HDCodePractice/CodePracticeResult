for i in 1 ... 6 {
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
        moveForward()
    }
    if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    } else if !isBlockedLeft {
        turnLeft()
        toggleSwitch()
    } else if isOnGem {
        collectGem()
    }
}
