var gemCounter = 0
while !isBlocked {
    moveForward()
    while isOnGem {
        collectGem()
        gemCounter=gemCounter+1
    }
    if isBlocked {
        turnRight()
    }
}
