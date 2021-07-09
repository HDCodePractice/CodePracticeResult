func turnAndCollectGem() {
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
};while isOnGem {
    turnAndCollectGem()
}
for i in 1 ... 7 {
    turnAndCollectGem()
}
