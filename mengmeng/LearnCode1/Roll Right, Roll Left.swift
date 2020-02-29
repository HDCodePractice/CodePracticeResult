while !isOnOpenSwitch{
    if isOnGem {
        collectGem()
        if isBlocked {
            turnRight()           
        }       
    }
    if isBlocked && isBlockedLeft {
        turnRight()        
    }       
    if isBlockedRight && isBlocked {
        turnLeft()
    }    
    if isOnClosedSwitch {
        toggleSwitch()
        if isBlocked {
            turnLeft()
        }
    }
    moveForward()
}                                                                                                            
