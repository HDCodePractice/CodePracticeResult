while !isOnGem {
    moveForward()
    if isOnClosedSwitch && isBlocked {
        toggleSwitch()
        turnLeft()
    }else if isOnClosedSwitch {
        turnRight()
        toggleSwitch()
    }
} 
collectGem()
