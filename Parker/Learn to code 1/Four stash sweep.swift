func turnAround() {
    turnLeft()
    turnLeft()
}


func moveGetGem() {
    moveForward()
    collectGem()
}

for i in 1 ... 4 {
    moveGetGem()
    moveGetGem()
    turnAround()
    moveForward()
    turnRight()
    moveGetGem()
    turnAround()    
    moveForward()
    moveGetGem()
    moveForward()
}
