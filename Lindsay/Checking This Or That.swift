for i in 1 ... 12 {
    moveForward()
    if isBlockedLeft || isBlocked {
        turnRight()
    }
}
collectGem()
