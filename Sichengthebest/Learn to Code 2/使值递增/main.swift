var gemCounter = 0

for i in 1 ... 3 {
    while !isBlocked {
        moveForward()
        if isOnGem {
            collectGem()
            gemCounter += 1
        }
    }
    turnRight()
}
