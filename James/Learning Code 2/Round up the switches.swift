var gemNumber = numberOfGems
var switchCounter = 0
while switchCounter < gemNumber {
    if isBlocked {
        turnRight()
    } else if isOnClosedSwitch {
        toggleSwitch()
        switchCounter = switchCounter + 1
    } else if isOnGem {
        collectGem()
    } else {
        moveForward()
    } 
}
