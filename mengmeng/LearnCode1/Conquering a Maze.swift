func navigateAroundWalls() {
    if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
    if isBlocked && isBlockedRight {
        turnLeft()
        moveForward()       
    }    
}    
while !isOnGem {
    navigateAroundWalls()
}
collectGem()
