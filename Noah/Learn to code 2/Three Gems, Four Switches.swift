var gemCounter = 0

while gemCounter != 3 {
    moveForward()
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    if isBlocked && isBlockedRight {
        turnLeft()
    }
    if isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    }
}

var switchCounter = 0

while switchCounter != 4 {
    moveForward()
    if isBlocked {
        turnRight()
    }
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter = switchCounter + 1
    }
}


