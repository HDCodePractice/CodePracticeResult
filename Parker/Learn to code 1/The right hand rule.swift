while !isOnClosedSwitch {
     if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
    if isOnGem {
        collectGem()
        turnLeft()
        turnLeft()
    }
}
toggleSwitch()
