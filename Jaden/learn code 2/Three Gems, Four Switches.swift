var tog = 0
var gem = 0
while tog<4 {
    moveForward()
    if isBlocked && !isBlockedLeft {
        turnLeft()
        
    }else if isBlocked && !isBlockedRight {
        turnRight()
        
    }
    if isOnClosedSwitch{
        toggleSwitch()
        tog += 1
    }
    while gem<3 {
        if isOnGem{
            collectGem()
            gem+=1
            
    }
        moveForward()
        if isBlocked && !isBlockedLeft {
            turnLeft()
            
        }else if isBlocked && !isBlockedRight {
            turnRight()
            
        }
        if isOnClosedSwitch{
            toggleSwitch()
            tog += 1
        }
    }
    
    
}
