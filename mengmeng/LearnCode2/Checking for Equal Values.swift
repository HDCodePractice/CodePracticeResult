let switchCounter = numberOfSwitches
var gemCount = 0
while gemCount < switchCounter {
    moveForward()
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    if isBlocked && isBlockedRight {collectGem()
        turnLeft()
    }
    if isOnGem {
        collectGem()
        gemCount += 1
    } 
}
