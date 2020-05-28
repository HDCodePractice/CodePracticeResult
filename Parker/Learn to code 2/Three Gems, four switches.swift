var gemCount = 0
var switchCount = 0
while 
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    else if isBlocked && isBlockedRight {
        turnLeft() 
    }
    moveForward()
    if isOnGem && gemCount <= 2 {
        collectGem()
        gemCount += 1
    }
    else if isOnClosedSwitch && switchCount <= 3 {
        toggleSwitch()
    }
}
