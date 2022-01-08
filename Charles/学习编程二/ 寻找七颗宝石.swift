var gemCounter = 0
while gemCounter<7 {
    if isBlocked {
        turnRight()
        turnRight()
    }
    moveForward()
    if isOnGem {
        collectGem()
        gemCounter=gemCounter+1
    }
}
