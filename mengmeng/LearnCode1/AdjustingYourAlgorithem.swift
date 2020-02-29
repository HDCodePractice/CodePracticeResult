func navigateAroundWall() {
    if isBlockedRight && !isBlocked {
        moveForward()
    } else if isBlockedRight && isBlocked {
        turnLeft()
    } else {
        turnRight()
        moveForward()
    }
    if isOnGem {
        collectGem()
    }
}
while !isOnClosedSwitch {
    navigateAroundWall()
}
toggleSwitch()
