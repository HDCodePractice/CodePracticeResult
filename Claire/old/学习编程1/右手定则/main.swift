while !isOnClosedSwitch {
    moveForward()
    if !isBlockedRight {
        turnRight()
    }  
    if isOnGem {
        collectGem()
        turnLeft()
        turnLeft()
    }
} 
toggleSwitch()
