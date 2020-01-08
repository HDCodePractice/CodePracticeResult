func back2start() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
func solveRow() {
    turnLeft()
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    back2start()
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    back2start()
    turnRight()
    moveForward()   
}
for i in 1 ... 3 {
    solveRow()
}
