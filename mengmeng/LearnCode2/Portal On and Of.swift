purplePortal.isActive = false
for i in 1 ... 9 {
    moveForward()
    if isOnGem {
        collectGem()
    }
    if isBlocked && isBlockedRight && isBlockedLeft {
        turnRight()
        turnRight()
    }
}
purplePortal.isActive = true
moveForward()
turnRight()
turnRight()
for i in 1 ... 5 {
    moveForward()
    if isOnGem {
        collectGem()
    }
    if isBlocked && isBlockedLeft && isBlockedRight {
        turnRight()
        turnRight()
    }
}
purplePortal.isActive = false
moveForward()
moveForward()
moveForward()
toggleSwitch()
