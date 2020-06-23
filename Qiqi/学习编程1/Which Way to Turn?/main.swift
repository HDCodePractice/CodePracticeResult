func whichWayToTurn() {
    if isBlockedRight && !isBlocked {
        moveForward()
        
    } else if isBlockedRight && isBlocked {
        turnLeft()
        
    } else {
        turnRight()
        moveForward()   
    }
    
    if isOnClosedSwitch {
        toggleSwitch()
    }    
}

while !isOnGem {
    whichWayToTurn()
}
collectGem()
