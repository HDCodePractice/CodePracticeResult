var gemCounter = 0
while gemCounter < 7 {
    if isOnGem {
        collectGem()
        gemCounter=gemCounter+1
    }
    if isBlocked {
        turnRight()
        turnRight()
    }
    moveForward()
}
