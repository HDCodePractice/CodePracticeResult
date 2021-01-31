let totalGems = randomNumberOfGems
var gem = 0
func go() {
    if isBlocked && !isBlockedRight {
        turnRight()
    }
    else if isBlocked && !isBlockedLeft {
        turnLeft()
    }
    else if isBlocked && isBlockedLeft && isBlockedRight{
        turnLeft()
        turnLeft()
    }
    else{
        moveForward()
    }
}
while gem < totalGems {
    go()
    if isOnGem {
        collectGem()
        gem += 1
    }
}
