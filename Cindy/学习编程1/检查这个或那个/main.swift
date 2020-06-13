for i in 1 ... 12 {
    if isBlockedLeft || isBlocked {
        turnRight()
        moveForward()
    } else {
        moveForward()
    }
}
collectGem()
