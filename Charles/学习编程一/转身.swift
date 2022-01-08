func a() {
    for i in 1 ... 2 {
        moveForward()
        collectGem()
        turnLeft()
    }
    moveForward()
    turnRight()
}
for i in 1 ... 4 {
    a()
}
