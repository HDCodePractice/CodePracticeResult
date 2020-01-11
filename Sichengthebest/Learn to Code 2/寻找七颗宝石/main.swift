var gems = 0

while gems < 7 {
    while !isBlocked {
        moveForward()
        if isOnGem {
            collectGem()
            gems += 1
        }
    }
    turnLeft()
    turnLeft()
}
