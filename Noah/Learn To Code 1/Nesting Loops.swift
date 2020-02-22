while !isBlocked {
    while isOnGem {
        collectGem()
        turnLeft()
    }
    moveForward()
    while isOnGem {
        collectGem()
        turnLeft()    
    }
}
