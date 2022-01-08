func navigateAroundWall() {
    if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
    if isBlocked && isBlockedRight {
        turnLeft()
    }
    else if isBlockedRight {
        moveForward()
    }
    if !isBlocked && !isBlockedRight {
        turnRight()
        moveForward()
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
