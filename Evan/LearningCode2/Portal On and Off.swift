purplePortal.isActive = false
while !isBlocked {
    moveForward()
    if isOnGem {
        collectGem()
    }
}
purplePortal.isActive = true
turnLeft()
turnLeft()
while !isOnClosedSwitch {
    moveForward()
}
toggleSwitch()
turnLeft()
turnLeft()
purplePortal.isActive = false
while !isBlocked {
    moveForward()
    if isOnGem {
        collectGem()
    }
}
