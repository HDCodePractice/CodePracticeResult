for i in 1 ... 12 {
    if isBlockedLeft || isBlocked {
        turnRight()
        moveForward()
        collectGem()
    } else {
        moveForward()
        collectGem()
    }
}
