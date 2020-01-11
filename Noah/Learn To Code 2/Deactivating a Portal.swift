var switchC = 0

greenPortal.isActive = false

while switchC != 3 {
    if isOnClosedSwitch {
        toggleSwitch()
        switchC += 1
    }
    if isBlocked {
        if isBlockedLeft && isBlockedRight {
            turnRight()
            turnRight()
        }
    }
    if !isBlocked && !isBlockedRight && !isBlockedLeft {
        turnRight()
    }
    moveForward()
}

