for i in 1 ... 3 {
    while !isBlocked {
        collectGem()
        moveForward()
    }
    if isBlocked {
        turnRight()
    }
}
gemCounter = 6
