var gemCounter = 0
while gemCounter != 4 {
    if gemCounter == 0 {
        bluePortal.isActive = false
        pinkPortal.isActive = false
    } else if gemCounter == 1 {
        bluePortal.isActive = true
        pinkPortal.isActive = true
    } else if gemCounter == 3 {
        bluePortal.isActive = false
    }
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked {
        turnLeft()
        turnLeft()
    } else {
        moveForward()
    }
}
