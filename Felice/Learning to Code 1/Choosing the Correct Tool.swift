func collectingGem() {
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
}
while !isBlocked {
    collectingGem()
}
