let totalGems = randomNumberOfGems
var Gem = 0
while Gem < 5 {
    collectGem()
    moveForward()
    if isBlocked && isBlockedRight {
        turnLeft()
    } else if isBlocked && isBlockedLeft {
        turnRight()
    }
}

