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
}
func turnAround() {
    turnLeft()
    turnLeft()
}
for i in 1 ... 3 {
    getT()
    moveForward()
}
getT()

