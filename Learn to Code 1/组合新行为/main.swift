func turnRight() {
    turnLeft()
    turnLeft()
    turnLeft()
}
for i in 1 ... 3 {
    moveForward()
}
turnRight()
for i in 1 ... 3 {
    moveForward()
}
collectGem()
