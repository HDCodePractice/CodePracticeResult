for i in 1 ... 13 {
    if isBlocked || isBlockedLeft {
        turnRight()
    } 
    if isOnGem {
        collectGem()    
    } else {
        moveForward()
    }
}
