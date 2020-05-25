func turnAndCollectGem() {
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
}

while !isBlocked {
    turnAndCollectGem()
}
