var gemCounter = 0
while gemCounter < 100 {
    if isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    }
    if isBlocked {
        turnRight()
        turnRight()
    }
    moveForward()
}
