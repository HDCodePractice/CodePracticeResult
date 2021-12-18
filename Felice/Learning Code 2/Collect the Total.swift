let totalGems = randomNumberOfGems
var gemCount = 0
while gemCount < totalGems {
    moveForward()
    if isOnGem {
        collectGem()
        gemCount += 1
    }
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    if isBlocked && isBlockedRight {
        turnLeft()
    }
    if isBlocked && isBlockedLeft && isBlockedRight {
        turnRight()
        turnRight()
    }
}
