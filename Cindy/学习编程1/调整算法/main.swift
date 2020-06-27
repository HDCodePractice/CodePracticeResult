func navigateAroundWall() {
    if isBlockedRight {
        if isBlocked {
            turnLeft()
            if isBlocked {
                turnLeft()
            }
        }
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
