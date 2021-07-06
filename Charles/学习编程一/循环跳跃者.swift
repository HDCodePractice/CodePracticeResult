func goToGem() {
    moveForward()
    turnLeft()
    moveForward()
    moveForward()
    collectGem()
    turnRight()
    
}
for i in 1 ... 5 {
    goToGem()
    
}
