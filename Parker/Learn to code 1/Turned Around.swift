func moveGetTurn() {
    moveForward()
    collectGem()
    turnLeft()
}
for i in 1 ... 4 {
    moveGetTurn()
    moveGetTurn()
    moveForward()
    collectGem()
    turnRight()
}
