greenPortal.isActive = false
var switchCounter = 0
while switchCounter < 3 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter = switchCounter + 1
    }
    if !isBlockedRight {
        turnRight()
    } else if isBlocked {
        turnRight()
        turnRight()
    }
}
