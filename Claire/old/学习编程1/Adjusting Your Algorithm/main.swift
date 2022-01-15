func navigateAroundWall() {
    if isBlockedRight && isBlocked {
        turnLeft()
    }  else if isBlockedRight {
        moveForward()
    }else {
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
