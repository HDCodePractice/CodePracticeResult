func toggleOrCollect() {
    if isOnGem {
        collectGem()
        
    }
    else if isOnClosedSwitch {
        toggleSwitch()
        
    }
    moveForward()
    
}
func moving() {
    if isBlocked&&isBlockedLeft {
        turnRight()
        moveForward()
        turnRight()
        
    }
    else if isBlocked {
        turnLeft()
        moveForward()
        turnLeft()
        
    }
    
}
for i in 1 ... 3 {
    while !isBlocked {
        toggleOrCollect()
        
    }
    moving()
    
}
