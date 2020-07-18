bluePortal.isActive = false
pinkPortal.isActive = false
var gemCounter = 0
while !isBlocked && gemCounter < 4{
    moveForward()
    if isBlocked{
        turnLeft()
        turnLeft()
        bluePortal.isActive = true
        pinkPortal.isActive = true
    }
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlockedLeft && isBlockedRight{
        bluePortal.isActive = false
    }
}
