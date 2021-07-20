let totalGems = randomNumberOfGems
var gemCounter = 0
while !isBlocked&&gemCounter < totalGems {
    if isOnGem {
        collectGem()
        gemCounter+=1
    }
    moveForward()
    if isBlocked&&isBlockedLeft&&isBlockedRight {
        turnLeft()
        turnLeft()    
    }
    if isBlocked&&isBlockedLeft {
        turnRight()    
    }
    if isBlocked&&isBlockedRight {
        turnLeft()    
    }
}
