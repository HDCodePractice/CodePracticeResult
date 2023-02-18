while  !isOnGem {
    moveForward ()
    if isOnClosedSwitch && isBlocked {
        turnLeft ()
    } else  if isOnClosedSwitch {
        turnRight ()
    }
    toggleSwitch()
} 
collectGem ()
