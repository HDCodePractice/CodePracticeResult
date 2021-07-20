var gemCounter = 0
for i in 1 ... 3{
    if isBlocked {
        turnLeft()
        turnLeft()
    }
    while gemCounter < 7 && !isBlocked{
        collectGem()
        moveForward()
    }
}
