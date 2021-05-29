var gems = 0
while gems < 7 {
    moveForward()
    if isOnGem {
        collectGem()
        gems += 1
    }
    if isBlocked {
        turnLeft()
        turnLeft()
    }
}
