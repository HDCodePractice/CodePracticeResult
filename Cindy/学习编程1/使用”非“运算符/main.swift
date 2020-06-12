for i in 1 ... 4 {
    moveForward() 
    if isOnGem {
        collectGem()
    } else {
        turnLeft()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnLeft()
    } 
}
