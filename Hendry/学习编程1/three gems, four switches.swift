var gemCounter = 0
var switchCounter = 0
while gemCounter<3{
    if isOnGem {
        collectGem()
        gemCounter=gemCounter+1
    }
    if isBlocked && isBlockedRight {
        turnLeft()
    }
    if isBlocked {
        turnRight()
    }
    moveForward()
}
while switchCounter<4 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter=switchCounter+1
    }
    if isBlocked {
        turnRight()
    }
}
