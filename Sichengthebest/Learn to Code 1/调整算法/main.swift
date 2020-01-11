func navigateAroundWall() {
    if isBlockedRight && !isBlocked {
        moveForward()
        
    } else if isBlockedRight && isBlocked {
        turnLeft()
        
    } else {
        turnRight()
        moveForward()
        
    }
}

while !isOnClosedSwitch {
    navigateAroundWall()
    if isOnGem {
        collectGem()
        turnLeft()
    }
}
toggleSwitch()
