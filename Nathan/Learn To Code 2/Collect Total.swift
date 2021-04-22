
let totalGems = randomNumberOfGems
var gemCounter = 0
while gemCounter != randomNumberOfGems {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked {
        if isBlockedRight && isBlockedLeft{
            turnLeft()
            turnLeft()
        }
        if isBlockedRight {
            turnLeft()
        }
        if isBlockedLeft {
            turnRight()
        }
    }
    moveForward()
}

