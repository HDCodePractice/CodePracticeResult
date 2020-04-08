func getT() {
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    turnRight()
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    moveForward()
    collectGem()
    moveForward()
}
func turnAround() {
    turnLeft()
    turnLeft()
}
for i in 1 ... 4 {
    getT()
}
