func getT() {
    moveForward()
    collectGem()
    for i in 1 ... 2 {
        turnLeft()
        moveForward()
        collectGem()
        turnAround()
    }
    turnLeft()
    moveForward()
    collectGem()
}
func turnAround() {
    turnLeft()
    turnLeft()
    moveForward()
}
for i in 1 ... 3 {
    getT()
    moveForward()
}
getT()
