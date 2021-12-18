var gemCounter = numberOfGems
var switchCounter = 0
while switchCounter < gemCounter {
    moveForward()
    if isOnGem {
        collectGem()
    }
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter += 1
    }
    if isBlocked {
        turnRight()
    }
}
