for i in 1 ... 4 {
    moveForward()
    if !isOnGem {
        turnLeft()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnLeft()
    } else {
        collectGem()
}
}
