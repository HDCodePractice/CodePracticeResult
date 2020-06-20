while !isOnClosedSwitch {
    if !isBlockedRight {
        turnRight()
    }  
    moveForward()
    if isOnGem {
        collectGem()
        turnLeft()
        turnLeft()
    }
}
toggleSwitch()
