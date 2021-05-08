func collect() {
    moveForward()
    collectGem()
    turnLeft()
    for i in 1 ... 3{
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        turnLeft()
    }
    turnLeft()
    moveForward()
    moveForward()
}
for i in 1 ... 4 {
    collect()
}
