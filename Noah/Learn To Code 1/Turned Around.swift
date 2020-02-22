func oneSide() {
    moveForward()
    collectGem()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    moveForward()
    turnRight()
}

for i in 1 ... 4 {
    oneSide()
}
