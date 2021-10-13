while !isOnGem {
    if isBlockedRight && isBlocked {
        turnLeft()
    } else if isBlockedRight {
        moveForward()
    } else {
        turnRight()
        moveForward()
    }
}
collectGem()
