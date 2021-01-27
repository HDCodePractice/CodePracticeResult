func turnAndCollectGem() {
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
}
while !isBlocked {
    moveForward()
}
for i in 1 ... 6 {
    turnAndCollectGem()
}
