func turnAndCollectGem() {
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
}
for i in 1 ... 6 {
   turnAndCollectGem()
}
