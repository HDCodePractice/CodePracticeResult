purplePortal.isActive = false
var gemCounter = 0
while gemCounter < 7 {
    moveForward()
    if isBlocked {
        turnLeft()
        turnLeft()
        purplePortal.isActive = true
    }
    if isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    } else if isOnClosedSwitch {
        toggleSwitch()
        purplePortal.isActive = false
    }
}
