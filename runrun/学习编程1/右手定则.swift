func navigateAroundWall() {
    if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
    if isOnGem{
        collectGem()
        turnLeft()
        turnLeft()
    }
}
while !isOnClosedSwitch {
    navigateAroundWall()
}
toggleSwitch()
