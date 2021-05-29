func collectGemMove() {
    moveForward()
    while isOnGem {
        collectGem()
        turnLeft()
        moveForward()
    }
}
for i in 1 ... 4 {
    collectGemMove()
    turnRight()
}
