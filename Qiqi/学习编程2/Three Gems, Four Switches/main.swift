while !isBlocked {
    while !isBlocked {
        if isOnGem {
            collectGem()
            gemCounter = gemCounter + 1
        }
        moveForward()
    }
    turnRight()
}
