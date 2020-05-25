func move2() {
    moveForward()
    collectGem()
    moveForward()
}
for i in 1 ... 4 {
    move2()    
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    move2()
    collectGem()
    moveForward()
}
