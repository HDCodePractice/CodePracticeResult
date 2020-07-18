purplePortal.isActive = false
for i in 1...19{
    if !isBlocked{
    moveForward()
    }
    if isOnGem{
        collectGem()
    }
    if isBlocked{
        turnLeft()
        turnLeft()
        purplePortal.isActive = true
    } 
    if isOnClosedSwitch{
        toggleSwitch()
        purplePortal.isActive = false
    }
}
