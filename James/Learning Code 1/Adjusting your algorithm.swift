func navigateAroundWall() {
    if isBlockedRight && !isBlocked {
        moveForward()
    } else if isBlocked && isBlockedRight{
        turnLeft()
    }  else {
        turnRight()
        moveForward()
    }
}
while !isOnClosedSwitch {
    navigateAroundWall()
    if isOnGem {
        collectGem()
        turnLeft()
        turnLeft()
    }
}
toggleSwitch()
