while !isOnGem {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        if isBlocked {
            turnLeft()
            
        } else {
            turnRight()
            
        }
    }
    
}
collectGem()
