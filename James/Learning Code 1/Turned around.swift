moveForward()
for i in 1 ... 12 {
    if isOnGem {
        collectGem()
        turnLeft()
        moveForward()
    } else {
        turnRight()
        moveForward()
    }
}
