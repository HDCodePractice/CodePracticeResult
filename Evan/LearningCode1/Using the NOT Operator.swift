moveForward()
for i in 1 ... 4 {
    if isOnGem {
        collectGem()
    }
    else if !isOnGem {
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
    moveForward()
}
