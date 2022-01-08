var gemCounter = 0
while gemCounter < 7 {
    moveForward()
    if isOnGem {
        collectGem()
        gemCounter=gemCounter+1
    }
    if isBlocked {
        turnRight()
        turnRight()
    }
    }
