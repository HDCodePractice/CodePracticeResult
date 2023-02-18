func navigateAroundWall() {
    if isBlocked && isBlockedRight {
        turnLeft()
        
    }else if isBlockedRight {
        moveForward()
        
    }  else {
        turnRight()
        moveForward()
    }

    
}
    
while !isOnClosedSwitch {
    navigateAroundWall()
    if isOnGem {
        collectGem()
    }
}
toggleSwitch()
