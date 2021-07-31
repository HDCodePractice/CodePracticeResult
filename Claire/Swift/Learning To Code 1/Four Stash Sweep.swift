func pattern() {
    moveForward()
    collectGem()
    for i in 1 ... 2 {
        turnLeft()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
    }
    turnLeft()
    moveForward()
    collectGem()
}
for i in 1 ... 3 {
    pattern()
    moveForward()
}
pattern()
