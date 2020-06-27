func getAroundWall() {
    if isBlockedRight && isBlocked {
        turnLeft()
    }  else if isBlockedRight{
        moveForward()
    } else {
        turnRight()
        moveForward()
    }
}     
while !isOnClosedSwitch {
    getAroundWall()
    if isOnGem {
    collectGem()
    }
}
toggleSwitch()
