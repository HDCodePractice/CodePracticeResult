let totalGems = randomNumberOfGems
var Gem = 0
while Gem < totalGems  {
    moveForward()
    if isBlocked && isBlockedRight {
        turnLeft()
    } else if isBlocked && isBlockedLeft {
        turnRight()
    } else if isOnGem {
        Gem = Gem+1
        collectGem()
    }
}
