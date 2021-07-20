var gemCounter = 0
for i in 1 ... 16 {
    if isBlocked {
        turnRight()
    }
    moveForward()
    if isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    }
}
