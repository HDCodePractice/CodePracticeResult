func gemJump() {
    moveForward()
    collectGem()
for i in 1 ... 2 {
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    moveForward()
}
    turnLeft()
    moveForward()
    collectGem()
    moveForward()}
for i in 1 ... 4 {
    gemJump()
    
}
