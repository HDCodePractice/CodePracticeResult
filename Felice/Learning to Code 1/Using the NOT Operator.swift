for i in 1 ... 4 {
    moveForward()
    if  !isOnGem {
        turnLeft()
        moveForward()
        moveForward()
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        moveForward()
        turnLeft()
    }
    collectGem()
}
