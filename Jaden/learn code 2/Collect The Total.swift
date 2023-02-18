let totalGems = randomNumberOfGems
var gem = 0
while gem<totalGems{
    moveForward()
    if isBlocked && !isBlockedRight{
        turnRight()
        
    }
    if isBlocked && !isBlockedLeft{
        turnLeft()
        
    }
    if isOnGem{
        collectGem()
        gem += 1
    }
}
