func solveCorners() {
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
}
func collectThenMaybeMove() {
    collectGem()
    if !isBlocked {
        moveForward()
    }
}
for i in 1 ... 4 {
    moveForward()
    collectGem()
    solveCorners()
    turnRight()
    solveCorners()
    moveForward()
    collectThenMaybeMove()
}
