let totalGems = randomNumberOfGems
var gemCounter=0
while totalGems != gemCounter{
    moveForward()
    if isOnGem{
        collectGem()
        gemCounter+=1
    }
    if isBlockedLeft && isBlocked && isBlockedRight{
        turnRight()
        turnRight()
    } else if isBlockedRight && isBlocked{
        turnLeft()
    } else if isBlocked && isBlockedLeft{
        turnRight()
    }
}
