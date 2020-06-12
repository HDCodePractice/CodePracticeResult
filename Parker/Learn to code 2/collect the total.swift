let totalGems = randomNumberOfGems
var gemCounter = 0
while gemCounter < totalGems {
    moveForward()
    if isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    }
    if !isBlockedRight {
        turnRight()
    } else if !isBlockedLeft {
        turnLeft()
    }
    else if isBlocked {
        turnLeft()
        turnLeft()
    }
}
