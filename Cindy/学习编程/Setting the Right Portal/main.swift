bluePortal.isActive = false
pinkPortal.isActive = false
for i in 1...18 {
    if !isBlocked{
    moveForward()
    }
    if isBlocked{
        turnLeft()
        turnLeft()
        bluePortal.isActive = true
        pinkPortal.isActive = true
    }
    if isOnGem{
        collectGem()
    }
    if isBlockedLeft && isBlockedRight{
        bluePortal.isActive = false
    }
}
