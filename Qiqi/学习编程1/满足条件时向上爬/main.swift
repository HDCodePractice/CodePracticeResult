for i in 1 ... 16 {
    if isOnGem {
        collectGem()
        turnLeft()
        moveForward()
        
    } else {
        moveForward()
    }
}
