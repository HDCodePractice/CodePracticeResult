var gemCounter = 0
while gemCounter < 7 {
    moveForward()
    if isBlocked {
        turnLeft()
        turnLeft()
    }    
    if isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    }    
}
