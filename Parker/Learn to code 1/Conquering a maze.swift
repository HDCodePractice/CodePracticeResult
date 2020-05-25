func navAroundWall() {
    if isBlocked && isBlockedRight {
        turnLeft()
    } else if isBlockedRight {
        moveForward()
    } else {
        turnRight()
        moveForward()
    }
}
while !isOnGem {
    navAroundWall()
}
collectGem()
