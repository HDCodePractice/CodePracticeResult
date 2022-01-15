let totalGems = randomNumberOfGems
var gemsCollected = 0
while gemsCollected < totalGems {
    if isOnGem {
        collectGem()
        gemsCollected += 1
    }
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    else if isBlocked && isBlockedRight {
        turnLeft()
    }
    moveForward()
}
