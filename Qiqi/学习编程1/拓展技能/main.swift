func turnAround() {
    turnLeft()
    turnLeft()
}
func sevenS() {
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
}
for i in 1 ... 3 {
    moveForward()
    moveForward()
    turnRight()
    sevenS()
    toggleSwitch()
    turnAround()
    sevenS()
    turnRight()
    
}
