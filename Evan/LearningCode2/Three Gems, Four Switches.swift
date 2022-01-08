var gemCounter = 0
var switchCounter = 0
while gemCounter < 3 || switchCounter < 4 {
    moveForward()
    if gemCounter < 3 && isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    }
    else if switchCounter < 4 && isOnClosedSwitch {
        toggleSwitch()
        switchCounter = switchCounter + 1
    }
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    else if isBlocked && isBlockedRight {
        turnLeft()
    }
}
