let totalGems = randomNumberOfGems
var gemCounter = 0
moveForward()
pinkPortal.isActive = false
while !(gemCounter ==  totalGems){
    if !isBlocked{
        moveForward()
    }
    if isBlocked{
        turnLeft()
        turnLeft()
    }
    if isOnGem{
        collectGem()
        gemCounter += 1
    }
}

