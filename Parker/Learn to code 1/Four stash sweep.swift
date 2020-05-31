func `func`() {
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    moveForward()
    turnLeft()
    turnLeft()
}
for i in 1 ... 3{
    `func`()
    for i in 1 ... 3 {
        collectGem()
        moveForward()
    }
}
`func`()
for i in 1 ... 2 {
    collectGem()
    moveForward()
}
collectGem()
