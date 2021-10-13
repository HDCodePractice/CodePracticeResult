for i in 1 ... 13 {
    if isBlocked || isBlockedLeft {
        turnRight()
        moveForward()
    }
    else if !isBlocked || !isBlockedLeft {
        moveForward()
    }
}
collectGem()
