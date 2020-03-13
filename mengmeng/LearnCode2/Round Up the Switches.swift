let gemCounter = numberOfGems
var gemCount = 0
var openSwitchCount = 0
while openSwitchCount < gemCounter {
    moveForward()
    if isOnGem {
        collectGem()
        gemCount += 1
    }
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    if isBlocked && isBlockedRight {
        turnLeft()
    }
    if isOnClosedSwitch  {
        toggleSwitch()
        openSwitchCount += 1
    }
    
}
