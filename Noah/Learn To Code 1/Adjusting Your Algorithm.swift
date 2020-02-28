func navigateAroundWall() {
    if isBlockedRight && isBlockedLeft && isBlocked {
        turnRight()
        turnRight()
    }
    if isBlockedRight && isBlocked {
        turnLeft()
    } 
    if isBlockedRight {
        moveForward()
    } else {
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
