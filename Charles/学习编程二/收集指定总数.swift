let totalGems = randomNumberOfGems
var gemCounter = 0
while gemCounter<totalGems {
    if isBlocked&&isBlockedLeft {
        turnRight()
    }else if isBlocked&&isBlockedRight {
        turnLeft()
    }else{moveForward()
        if isOnGem {
            collectGem()
            gemCounter+=1
        }
    }
}

