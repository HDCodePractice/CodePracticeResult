func turnAndCollectGem() {
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
}
for i in 1 ... 7 {
    turnAndCollectGem()
}
