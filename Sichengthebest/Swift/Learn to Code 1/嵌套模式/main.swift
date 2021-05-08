func turnAround() {
    turnLeft()
    turnLeft()
}
func solveStair() {
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    turnRight()
}
for i in 1 ... 4 {
    solveStair()
}
