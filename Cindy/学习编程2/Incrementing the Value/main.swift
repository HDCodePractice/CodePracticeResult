var gemCounter = 0
while !isBlocked{
    while !isBlocked {
        if isOnGem{
            collectGem()
            gemCounter += 1
        }
        moveForward()
    }
    turnRight()
}
